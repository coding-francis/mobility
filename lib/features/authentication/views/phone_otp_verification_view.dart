import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../../../Utils/app_colors.dart';
import '../../../widgets/bottom_navigation_bar.dart';
import '../../../widgets/custom_filled_button.dart';
import '../../../widgets/otp_input.dart';
import '../providers/auth_provider.dart';

class PhoneOTPVerificationView extends ConsumerStatefulWidget {
  final String phoneNumber;

  const PhoneOTPVerificationView({super.key, required this.phoneNumber});

  @override
  ConsumerState<PhoneOTPVerificationView> createState() =>
      _PhoneOTPVerificationViewState();
}

class _PhoneOTPVerificationViewState
    extends ConsumerState<PhoneOTPVerificationView> {
  final formKey = GlobalKey<FormState>();
  final tokenController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = ref.read(authProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "We've sent a One-Time Password (OTP) to ${widget.phoneNumber}. Please check your messages.",
                  style: TextStyle(
                    color: AppColors.defaultColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Verify Phone Number ',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              OtpInput(
                label: 'Enter OTP',
                length: 6,
                controller: tokenController,
                // verifyCode: (code) => provider.verifyEmail(
                //   email: widget.email,
                //   token: code,
                // ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomFilledButton(
                height: 60,
                radius: 30,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    // provider.verifyEmail(
                    //   email: widget.email,
                    //   token: tokenController.text,
                    // );
                    Get.offAll(() => const CustomNavigationBar());
                  }
                },
                child: const Text(
                  'Verify',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      provider.verifyPhoneNumber();
                    },
                    child: Text(
                      'Resend OTP',
                      style: TextStyle(
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
