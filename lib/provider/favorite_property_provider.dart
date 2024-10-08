import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/api_response_model.dart';
import '../models/property_model.dart';
import '../services/property/property_service.dart';
import '../utils/app_dialogs.dart';

@immutable
class FavoritePropertyState {
  final List<PropertyModel> properties;
  final bool loading;
  final bool loadingMore;
  final int totalPages;
  final int current;

  const FavoritePropertyState({
    this.properties = const [],
    this.loading = true,
    this.loadingMore = false,
    this.totalPages = 0,
    this.current = 1,
  });

  copyWith(
      {List<PropertyModel>? properties,
      bool? loading,
      bool? loadingMore,
      int? totalPages,
      int? current}) {
    return FavoritePropertyState(
      properties: properties ?? this.properties,
      loading: loading ?? this.loading,
      loadingMore: loadingMore ?? this.loadingMore,
      totalPages: totalPages ?? this.totalPages,
      current: current ?? this.current,
    );
  }
}

class FavoritePropertyProvider extends StateNotifier<FavoritePropertyState> {
  FavoritePropertyProvider(this.ref, this.propertyService)
      : super(const FavoritePropertyState());
  Ref ref;
  PropertyService propertyService;

  resetCurrent() {
    state = state.copyWith(current: 1);
  }

  getFavoriteProperties() async {
    if (state.current == 1) {
      state =
          state.copyWith(loading: state.properties.isNotEmpty ? false : true);
    } else {
      state = state.copyWith(loadingMore: true);
    }

    ApiResponseModel? res = await propertyService.getFavoriteProperties(
      page: 1,
      size: 20,
    );
    state = state.copyWith(loading: false, loadingMore: false);
    if (res != null) {
      if (res.statusCode! < 300) {
        List<PropertyModel> newData = parseProperties(res.data);
        // (res.data as List).map((e) => ClientModel.fromJson(e)).toList();
        state = state.copyWith(
          properties:
              state.current == 1 ? newData : [...state.properties, ...newData],
        );
        state = state.copyWith(current: state.current + 1);
      } else {
        // AppDialogs.showError(
        //   msg: res.errors[0]['detail'] ?? "Error Loading properties",
        // );
      }
    }
  }

  Future<bool> addToFavorites({required int propertyId}) async {
    AppDialogs.showLoading(msg: 'Adding to favorites...');

    ApiResponseModel? res =
        await propertyService.addToFavorites(propertyId: propertyId);
    EasyLoading.dismiss();

    if (res != null) {
      if (res.statusCode! < 300) {
        return true;
      } else {
        return false;
      }
    }

    return false;
  }

  Future<bool> removeFavorites({required int propertyId}) async {
    AppDialogs.showLoading(msg: 'Removing...');

    ApiResponseModel? res =
        await propertyService.removeFavorites(propertyId: propertyId);
    EasyLoading.dismiss();

    if (res != null) {
      if (res.statusCode! < 300) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }
}

final favoritePropertyProvider =
    StateNotifierProvider<FavoritePropertyProvider, FavoritePropertyState>(
        (ref) {
  PropertyService propertyService = ref.watch(propertyServiceProvider);
  return FavoritePropertyProvider(ref, propertyService);
});
