import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelt/screens/house/cubit/house_cubit.dart';
import 'package:travelt/screens/house/widget/custom_houses_card_image.dart';
import 'package:travelt/shared/styles/themes.dart';
import 'package:travelt/widgets/custom_button.dart';
import 'package:travelt/widgets/custom_date_picker.dart';
import 'package:travelt/widgets/custom_loading_widget.dart';
import 'package:travelt/widgets/custom_outline_form_field.dart';
import 'package:travelt/widgets/custom_text_field.dart';
import 'package:travelt/widgets/custom_toast_widget.dart';
import 'package:travelt/widgets/text_items.dart';

class CustomHousesCard extends StatelessWidget {
  const CustomHousesCard({super.key});

  static var cityNameController = TextEditingController();
  static var minSpaceController = TextEditingController();
  static var maxSpaceController = TextEditingController();
  static var roomsController = TextEditingController();
  static var startController = TextEditingController();
  static var monthsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: SingleChildScrollView(
        child: CustomHousesCardImage(
          widget: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: subTitleText("Enter your houses details ",
                      color: Colors.black),
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomOutlinedTextField(
                        height: 50,
                        controller: cityNameController,
                        type: TextInputType.text,
                        // validator: (val){},
                        hintText: "city name",
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: CustomDatePicker(
                        dateController: startController,
                        hint: "start date ",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: roomsController,
                        type: TextInputType.number,
                        validator: (value) {},
                        label: "room number",
                        color1: defaultColor,
                        color3: defaultColor,
                        color2: defaultColor,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: CustomTextField(
                        controller: monthsController,
                        type: TextInputType.number,
                        validator: (value) {},
                        label: "month number",
                        color1: defaultColor,
                        color3: defaultColor,
                        color2: defaultColor,
                      ),
                    ),
                  ],
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
                        controller: minSpaceController,
                        hintText: "min space",
                        type: TextInputType.number,
                      ),
                    ),
                    SizedBox(
                      width: size.width * .01,
                    ),
                    Expanded(
                        child: CustomOutlinedTextField(
                      height: 65,
                      controller: maxSpaceController,
                      hintText: "max space",
                      type: TextInputType.number,
                    )),
                  ],
                ),
                BlocBuilder<HouseCubit, HouseState>(
                  builder: (context, state) {
                    return ConditionalBuilder(
                        condition: state is !ShowHousesLoadingState,
                        builder: (context) {
                          return CustomButton(
                            function: () {
                              int? minSpace = int.tryParse(minSpaceController.text.toString());
                              int? maxSpace = int.tryParse(maxSpaceController.text.toString());
                              int? rooms = int.tryParse(roomsController.text.toString());
                              int? months = int.tryParse(monthsController.text.toString());

                              if (cityNameController.text.isNotEmpty &&
                                  minSpaceController.text.isNotEmpty &&
                                  maxSpaceController.text.isNotEmpty &&
                                  monthsController.text.isNotEmpty &&
                                  startController.text.isNotEmpty &&
                                  roomsController.text.isNotEmpty
                              ) {
                                HouseCubit.get(context).showHouses(
                                    cityName: cityNameController.text,
                                    minSpace: minSpace!,
                                    maxSpace: maxSpace!,
                                    rooms: rooms!,
                                    start: startController.text,
                                    months: months!,
                                );
                              } else {
                                showToast("Please enter a valid details", ToastState.WARNING);
                              }
                            },
                            text: "show houses",
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
