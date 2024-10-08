import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getx;

import '../../Utils/app_colors.dart';
import '../models/api_response_model.dart';
import '../utils/app_dialogs.dart';
import 'box_manager.dart';
import 'enums.dart';

mixin BaseMixin {
  static String baseUrl = BaseUrl.dev.url;

  static CacheOptions options = CacheOptions(
    store: MemCacheStore(),
    policy: CachePolicy.noCache,
    hitCacheOnErrorExcept: [401, 403],
    maxStale: const Duration(minutes: 1),
    priority: CachePriority.normal,
    cipher: null,
    keyBuilder: CacheOptions.defaultCacheKeyBuilder,
    allowPostMethod: false,
  );

  static final _options = BaseOptions(
    followRedirects: false,
    connectTimeout: const Duration(seconds: 60),
    baseUrl: BaseUrl.dev.url,
    validateStatus: (status) {
      return status! < 500;
    },
    // headers: {'Authorization': BoxManger().getToken()},
  );

  final cancelToken = CancelToken();

  final Dio dio = Dio(_options)
    ..interceptors.addAll([
      LogInterceptor(
        responseBody: true,
        requestBody: true,
      ),
      InterceptorsWrapper(onRequest: (options, handler) {
        String? token = BoxManager().getPrivateToken();
        // debugPrint("---------Token: $token");
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      }),
      DioCacheInterceptor(options: options)
    ]);

  String handleExceptionTpe(DioExceptionType type) {
    switch (type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout';
      case DioExceptionType.sendTimeout:
        return 'Send timeout';
      case DioExceptionType.receiveTimeout:
        return 'Receive timeout';
      case DioExceptionType.badCertificate:
        return 'Bad certificate';
      case DioExceptionType.badResponse:
        return 'Bad response';
      case DioExceptionType.cancel:
        return 'Request cancelled';
      case DioExceptionType.connectionError:
        return 'Connection error. Check your internet';
      case DioExceptionType.unknown:
        return 'Oops! Something went wrong';
    }
  }

  Future<ApiResponseModel?> get(
      {required String route,
      Map<String, dynamic>? data,
      Map<String, dynamic>? queryParams,
      CachePolicy? cachePolicy,
      bool? showInternetModal}) async {
    try {
      Response res = await dio.get(
        route,
        data: data,
        cancelToken: cancelToken,
        options: options.copyWith(policy: cachePolicy).toOptions(),
        queryParameters: queryParams,
      );
      return ApiResponseModel.fromJson(res);
    } on SocketException catch (e) {
      debugPrint("$e");
      if (showInternetModal == true) {
        //show connection lost page
        if (!getx.Get.isBottomSheetOpen!) {
          getx.Get.bottomSheet(
            PopScope(
              canPop: true,
              // canPop: () async => false,
              child: Scaffold(
                body: ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    const Center(
                      child: Icon(
                        Icons.link_off_rounded,
                        size: 50,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Sorry, it seems you're currently without an internet connection. Here's what to do:",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                      primary: false,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 3, // Number of list items
                      itemBuilder: (context, index) {
                        if (index == 2) {
                          // The last item with "Contact support"
                          return RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: '3. Still stuck? ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16, // Customize text style
                                  ),
                                ),
                                TextSpan(
                                  text: 'Contact Support',
                                  style: TextStyle(
                                    color: AppColors.defaultColor,
                                    // Customize link text color
                                    decoration: TextDecoration.underline,
                                    fontSize: 16, // Add underline
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Add your "Contact support" action here
                                    },
                                ),
                              ],
                            ),
                          );
                        } else {
                          // Regular list items
                          return ListTile(
                            title: Text('${index + 1}. Your text here'),
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
            isDismissible: false,
            isScrollControlled: true,
          );
        }
      } else {
        await AppDialogs.showError(
            msg:
                "Network Error. Check your internet \nconnection and try again.");
      }
    } on DioException catch (e) {
      if (e.response != null) {
        //handle errors here
        return ApiResponseModel.fromJson(e.response!);
      } else {
        debugPrint("Dio exception error: $e");
        String msg = handleExceptionTpe(e.type);

        await AppDialogs.showError(msg: msg);
        return null;
        // Something happened in setting up or sending the request that triggered an Error
      }
    } catch (e) {
      debugPrint("Other error: $e");
      await AppDialogs.showError(msg: "Oops! Something went wrong");
    }
    return null;
  }

  Future<ApiResponseModel?> post({
    required String route,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      Response res = await dio.post(
        route,
        data: data,
        queryParameters: queryParams,
        cancelToken: cancelToken,
      );
      print("Here you are. . . .$res");
      return ApiResponseModel.fromJson(res);
    } on SocketException catch (e) {
      debugPrint("$e");
      await AppDialogs.showError(
          msg:
              "Network Error. Check your internet \nconnection and try again.");
    } on DioException catch (e) {
      if (e.response != null) {
        //handle errors here
        return ApiResponseModel.fromJson(e.response!);
      } else {
        debugPrint("Dio exception error: $e");
        String msg = handleExceptionTpe(e.type);

        await AppDialogs.showError(msg: msg);
        // Something happened in setting up or sending the request that triggered an Error
      }
    } catch (e) {
      debugPrint("Other error: $e");
      await AppDialogs.showError(msg: "Oops! Something went wrong");
    }
    return null;
  }

  Future<ApiResponseModel?> put({
    required String route,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParams,
    bool? ignore,
  }) async {
    try {
      Response res = await dio.put(
        route,
        data: data,
        queryParameters: queryParams,
        cancelToken: cancelToken,
      );
      return ApiResponseModel.fromJson(res);
    } on SocketException catch (e) {
      debugPrint("$e");
      await AppDialogs.showError(
          msg: "A error occurred. \nCheck your internet");
    } on DioException catch (e) {
      // String? token = BoxManager().getPrivateToken();
      // debugPrint("---------Token: $token");
      if (e.response != null) {
        //handle errors here
        return ApiResponseModel.fromJson(e.response!);
      } else {
        debugPrint("Dio exception error: $e");
        String msg = handleExceptionTpe(e.type);
        if (ignore != true) {
          await AppDialogs.showError(msg: msg);
        }
        // Something happened in setting up or sending the request that triggered an Error
      }
    } catch (e) {
      debugPrint("Other error: $e");
      if (ignore != true) {
        await AppDialogs.showError(msg: "Oops! Something went wrong");
      }
    }
    return null;
  }

  Future<ApiResponseModel?> patch({
    required String route,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      Response res = await dio.patch(
        route,
        data: data,
        queryParameters: queryParams,
        cancelToken: cancelToken,
      );
      return ApiResponseModel.fromJson(res);
    } on DioException catch (e) {
      if (e.response != null) {
        //handle errors here
        return ApiResponseModel.fromJson(e.response!);
      } else {
        debugPrint("Dio exception error: $e");
        String msg = handleExceptionTpe(e.type);

        await AppDialogs.showError(msg: msg);
        // Something happened in setting up or sending the request that triggered an Error
      }
    } catch (e) {
      debugPrint("Other error: $e");
      await AppDialogs.showError(msg: "Oops! Something went wrong");
    }
    return null;
  }

  Future<ApiResponseModel?> delete({
    required String route,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      Response res = await dio.delete(
        route,
        data: data,
        queryParameters: queryParams,
        cancelToken: cancelToken,
      );
      return ApiResponseModel.fromJson(res);
    } on DioException catch (e) {
      if (e.response != null) {
        //handle errors here
        return ApiResponseModel.fromJson(e.response!);
      } else {
        debugPrint("Dio exception error: $e");
        String msg = handleExceptionTpe(e.type);

        await AppDialogs.showError(msg: msg);
        // Something happened in setting up or sending the request that triggered an Error
      }
    } catch (e) {
      debugPrint("Other error: $e");
      await AppDialogs.showError(msg: "Oops! Something went wrong");
    }
    return null;
  }
}
