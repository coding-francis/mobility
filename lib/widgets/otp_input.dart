import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinput/pinput.dart';

import '../utils/app_colors.dart';

class OtpInput extends ConsumerWidget {
  final Function(String)? verifyCode;
  final int length;
  final String? label;
  final TextEditingController? controller;

  const OtpInput({
    Key? key,
    this.verifyCode,
    required this.length,
    this.controller,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 20,
        color: AppColors.defaultColor,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.defaultColor),
      borderRadius: BorderRadius.circular(5),
    );

    final errorPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.red),
      borderRadius: BorderRadius.circular(5),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        border: Border.all(color: AppColors.defaultColor),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label == null ? const SizedBox() : Text(label!),
        SizedBox(height: label == null ? 0 : 5),
        Pinput(
          length: length,
          controller: controller,
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: focusedPinTheme,
          submittedPinTheme: submittedPinTheme,
          errorPinTheme: errorPinTheme,
          validator: (s) {
            return s == null || s.isEmpty
                ? "OTP is required"
                : s.length < length
                    ? "OTP must be $length numbers"
                    : null;
          },
          pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
          showCursor: true,
          // onChanged: ref.read(verifyProvider.notifier).setOtp,
          onCompleted: verifyCode,
        ),
      ],
    );
  }
}
