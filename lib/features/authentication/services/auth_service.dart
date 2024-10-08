import 'package:dynamic_multi_step_form/dynamic_multi_step_form.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/base_mixin.dart';
import '../../../models/api_response_model.dart';
import 'auth_api.dart';
import 'auth_repo.dart';

final authServiceProvider = Provider<AuthService>((ref) => AuthService());

class AuthService with BaseMixin implements AuthRepo {
  @override
  Future<ApiResponseModel?> login(Map<String, dynamic> data) async {
    ApiResponseModel? res = await post(
      route: AuthEndpoints.login,
      data: data,
    );
    return res;
  }

  @override
  Future<ApiResponseModel?> signup(Map<String, dynamic> data) async {
    ApiResponseModel? res = await post(
      route: AuthEndpoints.signup,
      data: data,
    );
    return res;
  }

  @override
  Future<ApiResponseModel?> verify(Map<String, dynamic> data) async {
    ApiResponseModel? res = await post(
      route: AuthEndpoints.verifyOTP,
      data: data,
    );
    return res;
  }

  @override
  Future<ApiResponseModel?> resendEmailVerification(String email) async {
    debugPrint("URL is: ${AuthEndpoints.emailResend}?email=$email");
    ApiResponseModel? res = await post(
      route: "${AuthEndpoints.emailResend}?email=$email",
    );
    return res;
  }

  @override
  Future<ApiResponseModel?> getUserDetailsUsingEmail(String email) async {
    ApiResponseModel? res = await post(
      route: "${AuthEndpoints.userDetailsWithEmail}/$email",
    );
    return res;
  }
}
