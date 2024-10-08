import 'package:flutter_riverpod/flutter_riverpod.dart';

class MapState {
  double latitude = 0;
  double longitude;
  double zoom;

  MapState({
    required this.latitude,
    required this.longitude,
    required this.zoom,
  });

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'zoom': zoom,
    };
  }

  factory MapState.fromJson(Map json) {
    return MapState(
      latitude: json['latitude'],
      longitude: json['longitude'],
      zoom: json['zoom'],
    );
  }
}

class MapStateNotifier extends StateNotifier<MapState> {
  MapStateNotifier(MapState state) : super(state);

  void updateMap(double latitude, double longitude, double zoom) {
    state = MapState(
      latitude: latitude,
      longitude: longitude,
      zoom: zoom,
    );
  }
}

final mapStateProvider =
    StateNotifierProvider<MapStateNotifier, MapState>((ref) {
  return MapStateNotifier(
      MapState(latitude: 7.9465, longitude: -1.0232, zoom: 7.0));
});
