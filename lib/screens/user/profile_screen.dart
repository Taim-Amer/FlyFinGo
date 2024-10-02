import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:travelt/screens/login/login_page.dart';
import 'package:travelt/screens/user/cubit/profile_cubit.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/shared/styles/themes.dart';
import 'package:travelt/widgets/custom_button.dart';
import 'package:travelt/widgets/custom_loading_widget.dart';
import 'package:travelt/widgets/custom_text_field.dart';
import 'package:travelt/widgets/custom_toast_widget.dart';
import 'package:travelt/widgets/navigate_items.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return BlocProvider(
        create: (context) => ProfileCubit()..getProfile(),
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {

            if(state is ProfileSuccessState){
              nameController.text = state.profileModel.data!.name!;
              emailController.text = state.profileModel.data!.email!;
              phoneController.text = state.profileModel.data!.phone!;
            }

            return Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        defaultColor,
                        wightColor,
                        secondColor,
                      ])),
              child: ConditionalBuilder(
                  condition: state is! ProfileLoadingState,
                  builder: (context) {
                    return Scaffold(
                      appBar: AppBar(
                        backgroundColor: Colors.transparent,
                        automaticallyImplyLeading: false,
                      ),
                      backgroundColor: Colors.transparent,
                      body: Center(
                        child: Container(
                          width: size.width * .90,
                          height: size.height * .70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: wightGreyColor.withOpacity(.1),
                            boxShadow: [
                              BoxShadow(
                                color: textColor.withOpacity(0.1),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: size.height * .05,
                                    ),
                                    state is! ProfileLoadingState? CustomTextField(
                                        controller: nameController,
                                        type: TextInputType.text,
                                        validator: (value) {},
                                        label: nameController.text,
                                        prefix: Iconsax.user) : SizedBox(),
                                    SizedBox(
                                      height: size.height * .02,
                                    ),
                                    state is! ProfileLoadingState? CustomTextField(
                                        controller: emailController,
                                        type: TextInputType.emailAddress,
                                        validator: (value) {},
                                        label: emailController.text,
                                        prefix: Iconsax.message) : SizedBox(),
                                    SizedBox(
                                      height: size.height * .02,
                                    ),
                                    state is! ProfileLoadingState? CustomTextField(
                                        controller: phoneController,
                                        type: TextInputType.phone,
                                        validator: (value) {},
                                        label: phoneController.text,
                                        prefix: Iconsax.call) : SizedBox(),
                                    SizedBox(
                                      height: size.height * .03,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomButton(
                                            function: () {},
                                            text: "UPDATE",
                                            width: size.width * .40
                                        ),
                                        CustomButton(
                                            function: () {
                                              navigateAndFinish(context, LoginPage());
                                              // showToast("You Logged Out", state)
                                            },
                                            text: "LOGOUT",
                                            width: size.width * .40
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  fallback: (context) => Center(child: CustomLoadingWidget(),),
              ),
            );
          },
        )
    );
  }
}
