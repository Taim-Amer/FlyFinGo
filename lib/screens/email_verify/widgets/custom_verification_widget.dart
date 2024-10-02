import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class CustomVerificationWidget extends StatefulWidget {
  const CustomVerificationWidget({super.key, required this.otpController, this.count = 5});

  final TextEditingController otpController;
  final int count;

  @override
  State<CustomVerificationWidget> createState() => _CustomVerificationWidgetState();
}

class _CustomVerificationWidgetState extends State<CustomVerificationWidget> {
  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      mainAxisAlignment: MainAxisAlignment.center,
      fieldWidth: 50,
      fieldHeight: 55,
      showCursor: false,
      alignment: Alignment.center,
      numberOfFields: widget.count,
      borderColor: Colors.amberAccent,
      borderRadius: BorderRadius.circular(10),
      showFieldAsBox: true,
      onCodeChanged: (String code) {
        widget.otpController.text = code;
        print(widget.otpController.text);
      },
      onSubmit: (String code) {
        setState(() {
          widget.otpController.text = code;
        });
        print(widget.otpController.text);
        print("---------------------------------");
      },
    );
  }
}
