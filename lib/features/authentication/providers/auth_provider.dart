import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:pmc_main/features/authentication/views/opt_verification_view.dart';

import '../../../core/box_manager.dart';
import '../../../models/api_response_model.dart';
import '../../../models/user_model.dart';
import '../../../provider/bottom_nav_provider.dart';
import '../../../provider/token_provider.dart';
import '../../../utils/app_dialogs.dart';
import '../../../widgets/bottom_navigation_bar.dart';
import '../models/user_registration_model.dart';
import '../services/auth_service.dart';
import '../views/phone_otp_verification_view.dart';

class AuthProvider extends StateNotifier<bool> {
  AuthProvider(this.authService, this.ref) : super(false);
  AuthService authService;
  Ref ref;

  Future login({required String email, required String password}) async {
    AppDialogs.showLoading(msg: 'Signing in...');

    // String? fcmToken = await createFcmToken();

    ApiResponseModel? res = await authService.login({
      'emailAddress': email,
      'password': password,
    });
    EasyLoading.dismiss();

    if (res != null) {
      if (res.statusCode! < 300) {
        debugPrint("Login Response is: ${res.data}");
        // debugPrint("USER is: ${res.data['payload']}");
        // debugPrint(
        //   "Token is: ${res.data['payload']['authenticationResponse']['token']}",
        // );
        await BoxManager().setPrivateToken(
            res.data['payload']['authenticationResponse']['token']);
        await BoxManager().storeUser(res.data['payload']);
        await AppDialogs.showSuccess(msg: res.message);

        if (res.data['payload']['isUserVerified'] == true) {
          ref.read(bottomNavProvider.notifier).setCurrentIndex(0);
        } else {
          Get.offAll(
            () => OTPVerificationView(
              email: res.data['payload']['emailAddress'],
            ),
          );
        }
      } else {
        debugPrint("Error is: ${res.errors}");
        await AppDialogs.showError(
          msg: res.errors[0]['detail'] ?? "Error trying to login",
        );
      }
    }
  }

  Future signup(UserRegistrationModel signupForm) async {
    AppDialogs.showLoading(msg: 'Signing up...');
    bool? accept = true;

    if (accept == true) {
      ApiResponseModel? res = await authService.signup(signupForm.toJson());
      EasyLoading.dismiss;

      if (res != null) {
        if (res.statusCode! < 300) {
          //handle success
          debugPrint("Signup Response is: ${res.data}");

          await BoxManager().setPrivateToken(
              res.data['payload']['authenticationResponse']['token']);
          await BoxManager().storeUser(res.data['payload']);
          await AppDialogs.showSuccess(msg: res.message);
          Get.offAll(
            () => OTPVerificationView(
              email: res.data['payload']['emailAddress'],
            ),
          );
          // Get.offAll(() => const CustomNavigationBar());
        } else {
          //handle errors
          debugPrint("Error is: ${res.errors}");
          await AppDialogs.showError(
            msg: res.errors[0]['detail'] ?? "Error trying to create account",
          );
        }
      }
    }
  }

  Future resendEmailVerification({required String email}) async {
    AppDialogs.showLoading(msg: 'Resending...');

    ApiResponseModel? res = await authService.resendEmailVerification(email);
    EasyLoading.dismiss;

    if (res != null) {
      if (res.statusCode! < 300) {
        await AppDialogs.showSuccess(msg: res.message);
        return;
      } else {
        await AppDialogs.showError(msg: res.errors[0]['detail']);
      }
    }
  }

  Future verifyEmail({required String token, required String email}) async {
    AppDialogs.showLoading(msg: 'Verifying...');

    ApiResponseModel? res =
        await authService.verify({"token": token, "email": email});
    EasyLoading.dismiss;

    if (res != null) {
      if (res.statusCode! < 300) {
        //handle success
        // UserModel? user = BoxManager().getUser();
        // Map userDetails = {...res.data['payload'], 'isUserVerified': true};
        //
        // BoxManager().storeUser(userDetails);

        await AppDialogs.showSuccess(msg: res.message);
        Get.offAll(() => const CustomNavigationBar());
      } else {
        //handle errors
        await AppDialogs.showError(msg: res.message);
      }
    }
  }

  Future logout({bool? noRoute}) async {
    ref.read(tokenProvider.notifier).setPrivateToken(null);
    ref.invalidateSelf();
    Future.delayed(const Duration(seconds: 1), () async {
      await BoxManager().storeUser(null);
      await BoxManager().setPrivateToken(null);
    });
    if (noRoute != true) {
      ref.read(bottomNavProvider.notifier).setCurrentIndex(0);
    }
  }

  //sms stuff
  Future verifyPhoneNumber() async {
    AppDialogs.showLoading(msg: 'Verifying...');

    UserModel? user = BoxManager().getUser();

    ApiResponseModel? res =
        await authService.getUserDetailsUsingEmail("${user?.emailAddress}");
    debugPrint("Email data is: $res");
    EasyLoading.dismiss;

    try {
      String url = 'https://sms.arkesel.com/api/v2/sms/send';
      String apiKey = 'c21wQnVDTnFrUkJoUXdVRlB4VWc';
      final Dio dio = Dio();

      AppDialogs.showLoading(msg: 'Sending verification code...');
      final response = await dio.post(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'api-key': apiKey,
          },
        ),
        data: {
          'sender': 'eHealth',
          // 'recipients': ['${user?.phoneNumber}'],
          'recipients': ['0204920230'],
          'message': "Hello Mawuli, your otp is: 665858",
        },
      );
      EasyLoading.dismiss;
      debugPrint("$response");
      if (response.statusCode == 200) {
        // Successfully sent SMS
        await AppDialogs.showSuccess(msg: 'Verification SMS sent successfully');
        Get.to(() => PhoneOTPVerificationView(
              phoneNumber: '${user?.phoneNumber}',
            ));
      } else {
        // Failed to send SMS
        debugPrint('Failed to send SMS: ${response.data}');
        await AppDialogs.showError(
          msg: "Unable to send verification token to phone, please try again",
        );
      }
    } catch (e) {
      debugPrint('Error sending SMS: $e');
      await AppDialogs.showError(
        msg: "Unable to send verification token to phone, please try again",
      );
    }

    // if (res != null) {
    //   if (res.statusCode! < 300) {
    //     debugPrint("${res.data}");// save token locally for later verification
    // mover trycatch here instead
    //   } else {
    //     //handle errors
    //     await AppDialogs.showError(msg: res.message);
    //   }
    // }
  }
}

final authProvider = StateNotifierProvider<AuthProvider, bool>((ref) {
  final authService = ref.watch(authServiceProvider);
  return AuthProvider(authService, ref);
});
