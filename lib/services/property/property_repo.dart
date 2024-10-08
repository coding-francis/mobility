import '../../../models/api_response_model.dart';

abstract class PropertyRepo {
  // Future<ApiResponseModel?> addClient(CreateClientModel data);

  Future<ApiResponseModel?> getAllMyProperties({required int page, int? size});

  Future<ApiResponseModel?> getFavoriteProperties(
      {required int page, int? size});

  Future<ApiResponseModel?> addToFavorites({required int propertyId});

  Future<ApiResponseModel?> removeFavorites({required int propertyId});
}
