import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelt/screens/flight/cubit/flight_cubit.dart';
import 'package:travelt/screens/flight/widgets/custom_flight_card_image.dart';
import 'package:travelt/shared/styles/themes.dart';
import 'package:travelt/widgets/custom_button.dart';
import 'package:travelt/widgets/custom_date_picker.dart';
import 'package:travelt/widgets/custom_loading_widget.dart';
import 'package:travelt/widgets/custom_outline_form_field.dart';
import 'package:travelt/widgets/custom_text_field.dart';
import 'package:travelt/widgets/custom_toast_widget.dart';
import 'package:travelt/widgets/text_items.dart';

class CustomFlightsCard extends StatelessWidget {
  const CustomFlightsCard({super.key,});

  static var currentCityNameController = TextEditingController();
  static var destinationCityNameController = TextEditingController();
  static var personController = TextEditingController();
  static var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: SingleChildScrollView(
        child: CustomFlightCardImage(
          widget: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: subTitleText("Enter your flight details ", color: Colors.black),
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
                        validator: (value) {
                          return null;
                        },
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
                        validator: (value) {
                          return null;
                        },
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
                          dateController: dateController,
                          height: 65,
                          hint: "date",
                        )),
                  ],
                ),

                BlocBuilder<FlightCubit, FlightState>(
                  builder: (context, state){
                    return ConditionalBuilder(
                        condition: state is! FlightLoadingState,
                        builder: (context) {
                          return CustomButton(
                            function: () {
                              int? personNumber = int.tryParse(personController.text);
                              if (personNumber != null && currentCityNameController.text.isNotEmpty && destinationCityNameController.text.isNotEmpty && dateController.text.isNotEmpty) {
                                FlightCubit.get(context).showFlight(
                                    fromCity: currentCityNameController.text,
                                    toCity: destinationCityNameController.text,
                                    personNumber: personNumber,
                                    date: dateController.text,
                                    period: "early",
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

