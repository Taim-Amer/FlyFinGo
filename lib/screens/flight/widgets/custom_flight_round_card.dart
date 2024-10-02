import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelt/screens/flight/cubit/flight_cubit.dart';
import 'package:travelt/screens/flight/widgets/custom_flight_round_card_image.dart';
import 'package:travelt/shared/styles/themes.dart';
import 'package:travelt/widgets/custom_button.dart';
import 'package:travelt/widgets/custom_date_picker.dart';
import 'package:travelt/widgets/custom_loading_widget.dart';
import 'package:travelt/widgets/custom_outline_form_field.dart';
import 'package:travelt/widgets/custom_text_field.dart';
import 'package:travelt/widgets/custom_toast_widget.dart';
import 'package:travelt/widgets/text_items.dart';

class CustomFlightRoundCard extends StatelessWidget {
  const CustomFlightRoundCard({super.key});

  static var currentCityNameController = TextEditingController();
  static var destinationCityNameController = TextEditingController();
  static var personController = TextEditingController();
  static var dateGoController = TextEditingController();
  static var dateBackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: SingleChildScrollView(
        child: CustomFlightRoundCardImage(
          widget: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: subTitleText(
                      "Enter your flight details ", color: Colors.black),
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: currentCityNameController,
                        type: TextInputType.text,
                        validator: (value) {},
                        label: "current city",
                        color1: defaultColor,
                        color3: defaultColor,
                        color2: defaultColor,
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Expanded(
                      child: CustomTextField(
                        controller: destinationCityNameController,
                        type: TextInputType.text,
                        validator: (value) {},
                        label: "destination city",
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
                        child: CustomDatePicker(
                          dateController: dateGoController,
                          height: 65,
                          hint: "date Go",
                        ),
                    ),
                    SizedBox(
                      width: size.width * .01,
                    ),
                    Expanded(
                        child: CustomDatePicker(
                          dateController: dateBackController,
                          height: 65,
                          hint: "date Back",
                        )),
                  ],
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                CustomOutlinedTextField(
                  height: 65,
                  controller: personController,
                  hintText: "persons",
                  type: TextInputType.number,
                ),
                BlocBuilder<FlightCubit, FlightState>(
                  builder: (context, state) {
                    return ConditionalBuilder(
                        condition: state is! FlightRoundLoadingState,
                        builder: (context) {
                          return CustomButton(
                            function: () {
                              int? personNumber = int.tryParse(personController.text);
                              if (personNumber != null && currentCityNameController.text.isNotEmpty && destinationCityNameController.text.isNotEmpty && dateGoController.text.isNotEmpty && dateBackController.text.isNotEmpty) {
                                FlightCubit.get(context).getFlightRound(
                                    fromCity: currentCityNameController.text,
                                    toCity: destinationCityNameController.text,
                                    personNumber: personNumber,
                                    dateGo: dateGoController.text,
                                    dateBack: dateBackController.text,
                                    // classs: "First class",
                                    // minValue: 80,
                                    // maxValue: 160
                                );
                              } else {
                                showToast("Please enter a valid details ... !", ToastState.WARNING);
                              }
                            },
                            text: "show flights",
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
