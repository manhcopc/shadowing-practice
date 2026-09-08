import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeWidget extends StatelessWidget {
  const PinCodeWidget({
    super.key,
    required this.otpController,
    required this.email,
    required this.onCompleted,
    required this.onChanged,
  });

  final TextEditingController otpController;
  final String email;
  final ValueChanged<String> onCompleted;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      controller: otpController,
      length: 6,
      cursorHeight: 19.h,
      enableActiveFill: true,
      textStyle: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(10.r),
        fieldHeight: 50.h,
        fieldWidth: 40.w,
        inactiveColor: Colors.grey,
        inactiveFillColor:
            Colors.transparent, // Theme.of(context).colorScheme.surface,
        activeColor: Theme.of(context).colorScheme.primary,
        activeFillColor: Colors.transparent,
        selectedFillColor: Theme.of(context).colorScheme.primary,
        selectedColor: Theme.of(context).colorScheme.primary,
      ),
      onCompleted: onCompleted,
      onChanged: onChanged,
    );
  }
}
