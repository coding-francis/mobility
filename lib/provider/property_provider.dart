import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/api_response_model.dart';
import '../models/property_model.dart';
import '../services/property/property_service.dart';

@immutable
class PropertyState {
  final List<PropertyModel> properties;
  final bool loading;
  final bool loadingMore;
  final int totalPages;
  final int current;

  const PropertyState({
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
    return PropertyState(
      properties: properties ?? this.properties,
      loading: loading ?? this.loading,
      loadingMore: loadingMore ?? this.loadingMore,
      totalPages: totalPages ?? this.totalPages,
      current: current ?? this.current,
    );
  }
}

class PropertyProvider extends StateNotifier<PropertyState> {
  PropertyProvider(this.ref, this.propertyService)
      : super(const PropertyState());
  Ref ref;
  PropertyService propertyService;

  resetCurrent() {
    state = state.copyWith(current: 1);
  }

  getAllMyProperties() async {
    if (state.current == 1) {
      state =
          state.copyWith(loading: state.properties.isNotEmpty ? false : true);
    } else {
      state = state.copyWith(loadingMore: true);
    }

    ApiResponseModel? res = await propertyService.getAllMyProperties(
      page: 1,
      size: 20,
    );
    state = state.copyWith(loading: false, loadingMore: false);
    if (res != null) {
      if (res.statusCode! < 300) {
        List<PropertyModel> newData = parseProperties(res.data['content']);
        // (res.data as List).map((e) => ClientModel.fromJson(e)).toList();
        state = state.copyWith(
          properties:
              state.current == 1 ? newData : [...state.properties, ...newData],
          totalPages: res.data['totalElements'],
        );
        state = state.copyWith(current: state.current + 1);
      } else {
        // AppDialogs.showError(
        //   msg: res.errors[0]['detail'] ?? "Error Loading properties",
        // );
      }
    }
  }
}

final propertyProvider =
    StateNotifierProvider<PropertyProvider, PropertyState>((ref) {
  PropertyService propertyService = ref.watch(propertyServiceProvider);
  return PropertyProvider(ref, propertyService);
});
