import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:travelt/screens/email_verify/email_verification_screen.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/screens/register/cubit/register_cubit.dart';
import 'package:travelt/shared/styles/themes.dart';
import 'package:travelt/widgets/custom_button.dart';
import 'package:travelt/widgets/custom_loading_widget.dart';
import 'package:travelt/widgets/navigate_items.dart';
import 'package:travelt/widgets/custom_text_field.dart';
import 'package:travelt/widgets/text_items.dart';
import 'package:travelt/widgets/custom_toast_widget.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  static var emailController = TextEditingController();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit,RegisterState>(
        listener: (context , state){
          if(state is RegisterSuccessState){
            navigateWithSlideFromRight(context, EmailVerificationScreen());
            showToast(state.registerModel.message.toString(), ToastState.SUCCESS);
          }else if(state is RegisterErrorState){
            showToast(state.error, ToastState.ERROR);
          }
        },
        builder: (context , state){
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    secondColor,
                    wightGreyColor,
                    textColor,
                  ]
              ),
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
                      padding: const EdgeInsets.only(right: 10,left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10,bottom: 30),
                            child: titleText("Register"),
                          ),
                          CustomTextField(
                              controller: nameController,
                              type: TextInputType.name,
                              validator: (value){
                                if(value!.isEmpty){
                                  return "";
                                }
                                return null;
                              },
                              label: "Username",
                              prefix: Iconsax.user,
                          ),
                          const SizedBox(height: 10,),
                          CustomTextField(
                              controller: emailController,
                              type: TextInputType.emailAddress,
                              validator: (value){
                                if(value!.isEmpty){
                                  return "";
                                }
                                return null;
                              },
                              label: "Email Address",
                              prefix: Iconsax.message
                          ),
                          const SizedBox(height: 10,),
                          CustomTextField(
                              controller: phoneController,
                              type: TextInputType.phone,
                              validator: (value){
                                if(value!.isEmpty){
                                  return "";
                                }
                                return null;
                              },
                              label: "Phone",
                              prefix: Iconsax.call
                          ),
                          const SizedBox(height: 10,),
                          CustomTextField(
                              controller: passwordController,
                              type: TextInputType.visiblePassword,
                              onSubmit: (){
                                RegisterCubit.get(context).userRegister(
                                  name: nameController.text,
                                  email: emailController.text,
                                  phone: phoneController.text,
                                  password: passwordController.text,
                                );
                              },
                              validator: (value){
                                if(value!.isEmpty){
                                  return "";
                                }
                                return null;
                              },
                              label: "Password",
                              prefix: Iconsax.lock,
                              suffix: RegisterCubit.get(context).suffix,
                              isPassword: RegisterCubit.get(context).isPassword,
                              suffixPressed: (){
                                RegisterCubit.get(context).changePasswordVisibility();
                              }
                          ),
                          const SizedBox(height: 20,),
                          ConditionalBuilder(
                              condition: state is! RegisterLoadingState,
                              builder: (contex) {
                                return CustomButton(
                                  function: (){
                                    RegisterCubit.get(context).userRegister(
                                      name: nameController.text,
                                      email: emailController.text,
                                      phone: phoneController.text,
                                      password: passwordController.text,
                                    );
                                  },
                                  text: "REGISTER",
                                );
                              },
                              fallback: (context) => Center(child: CustomLoadingWidget()),
                          )
                        ],
                      ),
                    ),
                  ),
                )
            ),
          );
        },
      ),
    );
  }
}
