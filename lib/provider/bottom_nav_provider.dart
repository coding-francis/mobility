import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavProvider extends StateNotifier<int> {
  BottomNavProvider() : super(0); // move back to 0 for map

  setCurrentIndex(int index) {
    state = index;
  }
}

final bottomNavProvider =
    StateNotifierProvider<BottomNavProvider, int>((ref) => BottomNavProvider());
