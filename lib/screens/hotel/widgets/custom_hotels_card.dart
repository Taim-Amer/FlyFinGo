import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelt/screens/hotel/manger/cubit/hotel_cubit.dart';
import 'package:travelt/screens/hotel/widgets/custom_hotel_card_image.dart';
import 'package:travelt/shared/styles/themes.dart';
import 'package:travelt/widgets/custom_button.dart';
import 'package:travelt/widgets/custom_date_picker.dart';
import 'package:travelt/widgets/custom_loading_widget.dart';
import 'package:travelt/widgets/custom_outline_form_field.dart';
import 'package:travelt/widgets/custom_text_field.dart';
import 'package:travelt/widgets/custom_toast_widget.dart';
import 'package:travelt/widgets/text_items.dart';

class CustomHotelsCard extends StatelessWidget {
  CustomHotelsCard({super.key,});

  static var cityNameController = TextEditingController();
  static var personController = TextEditingController();
  static var startController = TextEditingController();
  static var endController = TextEditingController();
  List<TextEditingController> childrenController = [
    TextEditingController(),
    TextEditingController(),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: SingleChildScrollView(
        child: CustomHotelCardImage(
          widget: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: subTitleText("Enter the details of hotel you want to visit", color: Colors.black),
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                CustomTextField(
                  controller: cityNameController,
                  type: TextInputType.text,
                  validator: (value) {},
                  label: "Enter city name ",
                  color1: defaultColor,
                  color3: defaultColor,
                  color2: defaultColor,
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomOutlinedTextField(
                        height: 65,
                        controller: personController,
                        hintText: "persons",
                        type: TextInputType.number,
                      ),
                    ),
                    SizedBox(
                      width: size.width * .01,
                    ),
                    Expanded(
                        child: CustomDatePicker(
                          dateController: startController,
                          height: 65,
                          hint: "start",
                        )),
                    SizedBox(
                      width: size.width * .01,
                    ),
                    Expanded(
                        child: CustomDatePicker(
                            dateController: endController,
                            height: 65,
                            hint: "end",
                        ),
                    )
                  ],
                ),
                // CustomRadioList(
                //   options: const [
                //     "with children",
                //     "without children"
                //   ],
                //   size: 150,
                //   controllers: childrenController,
                // ),
                BlocBuilder<HotelCubit, HotelState>(
                  builder: (context, state){
                    return ConditionalBuilder(
                        condition: state is! HotelLoadingState,
                        builder: (context) {
                          return CustomButton(
                                  function: () {
                                    int? personNumber = int.tryParse(personController.text);
                                    // bool withChildren = RadioCubit.get(context).withChildren;
                                    if (personNumber != null && cityNameController.text.isNotEmpty && endController.text.isNotEmpty && startController.text.isNotEmpty) {
                                      HotelCubit.get(context).showHotel(
                                        cityName: cityNameController.text,
                                        personNumber: personNumber,
                                        start: startController.text,
                                        end: endController.text,
                                        children: true,
                                        sort: "normal"
                                      );
                                    } else {
                                      showToast("Please enter a valid details", ToastState.WARNING);
                                    }
                                  },
                                  text: "show hotels",
                                );
                        },
                        fallback: (context) => Center(child: CustomLoadingWidget()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

