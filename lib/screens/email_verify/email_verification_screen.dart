import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:travelt/screens/email_verify/cubit/email_verify_cubit.dart';
import 'package:travelt/screens/home/home_page.dart';
import 'package:travelt/screens/register/register_page.dart';
import 'package:travelt/shared/network/local/cache_helper.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/shared/styles/themes.dart';
import 'package:travelt/widgets/custom_button.dart';
import 'package:travelt/widgets/custom_loading_widget.dart';
import 'package:travelt/widgets/navigate_items.dart';
import 'package:travelt/widgets/text_items.dart';
import 'package:travelt/widgets/custom_toast_widget.dart';
import 'package:travelt/screens/email_verify/widgets/custom_verification_widget.dart';

class EmailVerificationScreen extends StatelessWidget {
  EmailVerificationScreen({super.key});

  var codeController = TextEditingController();

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
        create: (context) => EmailVerifyCubit(),
        child: BlocConsumer<EmailVerifyCubit, EmailVerifyState>(
          listener: (context, state) {
            if(state is VerifyEmailSuccessState){
              showToast(state.verifyEmailModel.message.toString(), ToastState.SUCCESS);
              CacheHelper.saveData(key: "token", value: state.verifyEmailModel.token);
              navigateWithFadeAndFinish(context, HomePage());
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
                          child: titleText("Enter OTP code"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 30),
                          child: detailsText(
                              "We will send on time code on your Email address !" , size: 18),
                        ),
                        // CustomVerificationWidget(otpController: otpCode , count: 6,),
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
                          },
                          onSubmit: (String code) {
                            codeController.text = code;
                          },
                        ),
                        SizedBox(
                          height: size.height * .05,
                        ),
                        ConditionalBuilder(
                            condition: state is! VerifyEmailLoadingState,
                            builder: (context){
                              return CustomButton(
                                text: "Verify",
                                function: () {
                                  print(RegisterPage.emailController.text);
                                  print(codeController.text);
                                  EmailVerifyCubit.get(context).verifyEmail(
                                    email: RegisterPage.emailController.text,
                                    code: codeController.text,
                                  );
                                },
                              );
                            },
                            fallback: (context) => Center(child: CustomLoadingWidget()),
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
