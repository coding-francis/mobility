import 'package:hive_flutter/hive_flutter.dart';
import 'package:pmc_main/provider/map_state_provider.dart';

import '../models/user_model.dart';

class BoxManager {
  Box box = Hive.box('settings');

  bool onboardingComplete() {
    // box.delete('onboardingComplete');
    return box.get('onboardingComplete', defaultValue: false);
  }

  setOnboardingComplete(bool value) async {
    await box.put('onboardingComplete', value);
  }

  String? getPrivateToken() {
    return box.get('privateToken', defaultValue: null);
  }

  setPrivateToken(String? value) async {
    await box.put('privateToken', value);
  }

  MapState? getMapState() {
    Map? mapState = box.get('mapState', defaultValue: null);
    if (mapState == null) {
      return null;
    } else {
      return MapState.fromJson(mapState);
    }
  }

  setMapState(MapState value) async {
    await box.put('mapState', value.toJson());
  }

  storeUser(Map? user) async {
    await box.put('user', user);
  }

  UserModel? getUser() {
    Map? user = box.get('user', defaultValue: null);
    if (user == null) {
      return null;
    } else {
      return UserModel.fromJson(user);
    }
  }

  setFcmToken(String? val) async {
    await box.put('notificationToken', val);
  }

  String? getFcmToken() {
    return box.get('notificationToken');
  }
}
