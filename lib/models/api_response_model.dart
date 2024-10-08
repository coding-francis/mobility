import 'package:dio/dio.dart';

class ApiResponseModel {
  final String message;
  final dynamic data;
  final dynamic errors;
  final int? statusCode;

  ApiResponseModel({
    this.data,
    required this.message,
    this.errors,
    this.statusCode,
  });

  factory ApiResponseModel.fromJson(Response res) {
    final json = res.data;
    return ApiResponseModel(
      message: json is Map<String, dynamic> && json.containsKey('message')
          ? json['message']
          : "Oops! Something went wrong",
      data: json,
      errors: json is Map<String, dynamic> && json.containsKey('errors')
          ? json['errors']
          : null,
      statusCode: res.statusCode,
    );
  }
}
