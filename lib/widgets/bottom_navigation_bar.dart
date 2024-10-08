import 'package:dynamic_multi_step_form/dynamic_multi_step_form.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmc_main/core/box_manager.dart';
import 'package:pmc_main/models/user_model.dart';

import '../features/account_information/account_information_view.dart';
import '../features/authentication/views/login_view.dart';
import '../features/property_listing/view/main_map_view.dart';
import '../features/rent_calculator/view/rent_calculator_view.dart';
import '../provider/bottom_nav_provider.dart';
import '../provider/map_state_provider.dart';
import '../utils/app_colors.dart';

class CustomNavigationBar extends ConsumerStatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  ConsumerState<CustomNavigationBar> createState() =>
      _CustomNavigationBarState();
}

class _CustomNavigationBarState extends ConsumerState<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    UserModel? user = BoxManager().getUser();
    List pages = [
      const MainMapView(),
      const RentCalculatorView(),
      user == null ? const LoginView() : AccountInformationView(),
    ];

    final currentIndex = ref.watch(bottomNavProvider);
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (int tappedIndex) {
          if (currentIndex == 0) {
            MapState mapState = ref.watch(mapStateProvider);
            BoxManager().setMapState(mapState);
            debugPrint(
              "tappedIndex: $tappedIndex, currentIndex: $currentIndex",
            );
          }
          ref.read(bottomNavProvider.notifier).setCurrentIndex(tappedIndex);
        },
        backgroundColor: Colors.white,
        elevation: 0,
        selectedItemColor: AppColors.defaultColor,
        unselectedItemColor: Colors.black,
        // showSelectedLabels: true,
        // showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(currentIndex == 0 ? IconlyBold.home : IconlyBroken.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
                currentIndex == 1 ? Icons.calculate : Icons.calculate_outlined),
            label: "Rent Calculator",
          ),
          BottomNavigationBarItem(
            icon: Icon(
                currentIndex == 2 ? IconlyBold.profile : IconlyBroken.profile),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
