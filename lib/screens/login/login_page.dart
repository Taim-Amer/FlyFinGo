import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:travelt/screens/forget_password/forget_password_screen.dart';
import 'package:travelt/shared/network/local/cache_helper.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/screens/home/home_page.dart';
import 'package:travelt/screens/login/cubit/login_cubit.dart';
import 'package:travelt/screens/register/register_page.dart';
import 'package:travelt/shared/styles/themes.dart';
import 'package:travelt/widgets/custom_button.dart';
import 'package:travelt/widgets/custom_loading_widget.dart';
import 'package:travelt/widgets/navigate_items.dart';
import 'package:travelt/widgets/custom_text_field.dart';
import 'package:travelt/widgets/text_items.dart';
import 'package:travelt/widgets/custom_toast_widget.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  var formKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccesState) {
            CacheHelper.saveData(key: "token", value: state.loginModel.token);
            showToast(state.loginModel.message!, ToastState.SUCCESS);
              navigateWithSlideFromRightAndFinish(context, HomePage());
          }else if(state is LoginErrorState){
            showToast(state.error, ToastState.ERROR);
          }
        },
        builder: (context, state) {
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
            child: Scaffold(
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10, bottom: 30),
                            child: titleText("LOGIN NOW"),
                          ),
                          CustomTextField(
                              controller: emailController,
                              type: TextInputType.emailAddress,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "";
                                }
                                return null;
                              },
                              label: "Email Address",
                              prefix: Iconsax.message),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            controller: passwordController,
                            type: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "";
                              }
                              return null;
                            },
                            label: "Password",
                            prefix: Iconsax.lock,
                            isPassword: LoginCubit.get(context).isPassword,
                            suffix: LoginCubit.get(context).suffix,
                            onSubmit: (){
                              LoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            },
                            suffixPressed: () {
                              LoginCubit.get(context).changePasswordVisibility();
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ConditionalBuilder(
                              condition: state is! LoginLoadingState,
                              builder: (context){
                                return CustomButton(
                                  function: () {
                                    LoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  },
                                  text: "LOGIN",
                                );
                              },
                              fallback: (context) => Center(child: CustomLoadingWidget())
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Don\'t have an account ?",
                                    style: TextStyle(color: textColor),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      navigateWithFade(context, RegisterPage());
                                    },
                                    child: Text(
                                      "REGISTER",
                                      style: TextStyle(color: secondColor),
                                    ),
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () {
                                  navigateWithFade(context, ForgetPasswordScreen());
                                },
                                child: Text(
                                  "FORGET PASSWORD",
                                  style: TextStyle(color: secondColor),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          );
        },
      ),
    );
  }
}
