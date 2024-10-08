import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/api_response_model.dart';
import '../models/update_model.dart';
import '../services/app_services.dart';

final versionUpdateProvider = FutureProvider<UpdateModel?>((ref) async {
  AppService accountService = ref.watch(appServiceProvider);

  ApiResponseModel? res = await accountService.checkVersion();

  if (res != null) {
    if (res.statusCode! < 300) {
      return UpdateModel.fromJson(res.data);
    }
  }
  return null;
});
