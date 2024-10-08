import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../core/base_mixin.dart';
import '../../../models/api_response_model.dart';
import '../features/authentication/services/auth_api.dart';

abstract class AppRepo {
  Future<ApiResponseModel?> checkVersion();
}

class AppService with BaseMixin implements AppRepo {
  @override
  Future<ApiResponseModel?> checkVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    debugPrint(
        "Build number: ${packageInfo.buildNumber} \nVersion: ${packageInfo.version} \nBuildSignature: ${packageInfo.buildSignature} \nInstallerStore: ${packageInfo.installerStore}");
    ApiResponseModel? res = await get(
      showInternetModal: true,
      route: AuthEndpoints.checkVersion,
      data: {
        "version": packageInfo.version,
        "buildNumber": packageInfo.buildNumber,
        "application": "PMC_ANDROID",
      },
    );
    return res;
  }
}

final appServiceProvider = Provider((ref) => AppService());
