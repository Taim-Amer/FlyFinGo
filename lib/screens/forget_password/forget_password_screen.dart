
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:iconsax/iconsax.dart';
import 'package:travelt/screens/forget_password/cubit/forget_password_cubit.dart';
import 'package:travelt/screens/home/home_page.dart';
import 'package:travelt/screens/login/login_page.dart';
import 'package:travelt/shared/network/local/cache_helper.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/shared/styles/themes.dart';
import 'package:travelt/widgets/custom_button.dart';
import 'package:travelt/widgets/custom_loading_widget.dart';
import 'package:travelt/widgets/navigate_items.dart';
import 'package:travelt/widgets/custom_text_field.dart';
import 'package:travelt/widgets/text_items.dart';
import 'package:travelt/widgets/custom_toast_widget.dart';
import 'package:travelt/screens/email_verify/widgets/custom_verification_widget.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordConfirmationController = TextEditingController();
  var codeController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              secondColor,
              wightGreyColor,
              textColor,
            ]),
      ),
      child: BlocProvider(
        create: (context) => ForgetPasswordCubit(),
        child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
            if(state is NewPasswordSuccessState){
              showToast(state.newPasswordModel.message!, ToastState.SUCCESS);
              navigateWithFadeAndFinish(context, LoginPage());
            }else if(state is ForgetPasswordErrorState){
              showToast(state.error, ToastState.ERROR);
            }
            if(state is NewPasswordErrorState){
              showToast(state.error, ToastState.ERROR);
            }
          },
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: Container(
                  width: size.width * .90,
                  height: size.height * .70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: textColor.withOpacity(.2),
                    boxShadow: [
                      BoxShadow(
                        color: textColor.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 30),
                          child: titleText("Reset Password"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 30),
                          child: detailsText(
                              "We will send on time code on your Email address !" , size: 18),
                        ),
                        SizedBox(
                          height: size.height * .03,
                        ),
                        Visibility(
                          visible: !ForgetPasswordCubit.get(context).isVisible,
                          child: Column(
                            children: [
                              CustomTextField(
                                controller: emailController,
                                type: TextInputType.emailAddress,
                                validator: (value) {
                                  if(value!.isEmpty){
                                    return "Email Address must not be Empty !";
                                  }
                                  return null;
                                },
                                label: "Email Address",
                                prefix: Iconsax.message,
                              ),
                              SizedBox(
                                height: size.height * .02,
                              ),
                              ConditionalBuilder(
                                condition: state is! ForgetPasswordLoadingState,
                                builder: (context) {
                                  return CustomButton(
                                      function: () {
                                        ForgetPasswordCubit.get(context).forgetPassword(email: emailController.text);
                                      },
                                      text: "get reset link");
                                },
                                fallback: (context) => CustomLoadingWidget(),
                              ),
                            ],
                          ),
                          replacement: Column(
                            children: [
                              CustomTextField(
                                  controller: passwordController,
                                  type: TextInputType.visiblePassword,
                                  validator: (value) {
                                    if(value!.isEmpty){
                                      return "";
                                    }
                                    return null;
                                  },
                                  label: "New Password",
                                  prefix: Iconsax.lock,
                                  suffix: ForgetPasswordCubit.get(context).suffix,
                                  suffixPressed: () => ForgetPasswordCubit.get(context).changePasswordVisibility(),
                                  isPassword: ForgetPasswordCubit.get(context).isPassword
                              ),
                              SizedBox(height: size.height * .01),
                              CustomTextField(
                                  controller: passwordConfirmationController,
                                  type: TextInputType.visiblePassword,
                                  validator: (value) {},
                                  label: "Password Ponfirmation",
                                  prefix: Iconsax.lock,
                                  suffix: ForgetPasswordCubit.get(context).suffix,
                                  suffixPressed: () => ForgetPasswordCubit.get(context).changePasswordVisibility(),
                                  isPassword: ForgetPasswordCubit.get(context).isPassword
                              ),
                              SizedBox(height: size.height * .03),
                              // CustomVerificationWidget(otpController: codeController , count: 6,),
                              OtpTextField(
                                mainAxisAlignment: MainAxisAlignment.center,
                                fieldWidth: 50,
                                fieldHeight: 55,
                                showCursor: false,
                                alignment: Alignment.center,
                                numberOfFields: 6,
                                borderColor: Colors.amberAccent,
                                borderRadius: BorderRadius.circular(10),
                                showFieldAsBox: true,
                                onCodeChanged: (String code) {
                                  codeController.text = code;
                                  print(codeController.text);
                                },
                                onSubmit: (String code) {
                                  codeController.text = code;
                                },
                              ),
                              SizedBox(height: size.height * .03),
                              ConditionalBuilder(
                                  condition: state is! NewPasswordLoadingState,
                                  builder: (context) {
                                    return CustomButton(
                                      function: () {
                                          ForgetPasswordCubit.get(context).resetPassord(
                                            email: emailController.text,
                                            password: passwordController.text,
                                            passwordConfirmation: passwordConfirmationController.text,
                                            code: codeController.text,
                                          );
                                      },
                                      text: "reset password",
                                    );
                                  },
                                  fallback: (context) => CustomLoadingWidget()),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
