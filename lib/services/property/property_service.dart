import 'package:dynamic_multi_step_form/dynamic_multi_step_form.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmc_main/core/box_manager.dart';
import 'package:pmc_main/models/user_model.dart';

import '../../core/base_mixin.dart';
import '../../models/api_response_model.dart';
import 'property_api.dart';
import 'property_repo.dart';

final propertyServiceProvider =
    Provider<PropertyService>((ref) => PropertyService());

class PropertyService with BaseMixin implements PropertyRepo {
  @override
  Future<ApiResponseModel?> getAllMyProperties(
      {required int page, int? size}) async {
    ApiResponseModel? res =
        await get(route: PropertyEndpoints.getMyProperties, queryParams: {
      "page": page - 1,
      "size": size,
    });
    return res;
  }

  @override
  Future<ApiResponseModel?> getFavoriteProperties(
      {required int page, int? size}) async {
    UserModel? user = BoxManager().getUser();
    debugPrint(
        "${PropertyEndpoints.getMyFavoriteProperties}/${user?.id ?? 2}/favorites");
    ApiResponseModel? res = await get(
        route:
            "${PropertyEndpoints.getMyFavoriteProperties}/${user?.id ?? 2}/favorites",
        queryParams: {
          "page": page - 1,
          "size": size,
        });
    return res;
  }

  @override
  Future<ApiResponseModel?> addToFavorites({required int propertyId}) async {
    UserModel? user = BoxManager().getUser();
    ApiResponseModel? res = await put(
        route:
            "${PropertyEndpoints.getMyFavoriteProperties}/${user?.id ?? 2}/favorites/$propertyId");
    return res;
  }

  @override
  Future<ApiResponseModel?> removeFavorites({required int propertyId}) async {
    UserModel? user = BoxManager().getUser();
    ApiResponseModel? res = await delete(
        route:
            "${PropertyEndpoints.getMyFavoriteProperties}/${user?.id ?? 2}/favorites/$propertyId");
    return res;
  }
}
