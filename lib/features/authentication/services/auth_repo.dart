import '../../../models/api_response_model.dart';

abstract class AuthRepo {
  Future<ApiResponseModel?> login(Map<String, dynamic> data);

  Future<ApiResponseModel?> signup(Map<String, dynamic> data);

  Future<ApiResponseModel?> verify(Map<String, dynamic> data);

  Future<ApiResponseModel?> resendEmailVerification(String email);

  Future<ApiResponseModel?> getUserDetailsUsingEmail(String email);
}
