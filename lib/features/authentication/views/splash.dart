import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:pmc_main/provider/map_state_provider.dart';

import '../../../core/box_manager.dart';
import '../../../models/update_model.dart';
import '../../../provider/version_update_provider.dart';
import '../../../widgets/bottom_navigation_bar.dart';
import '../../../widgets/no_internet_modal.dart';
import '../../../widgets/update_dialog.dart';
import 'no_internet.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchInfo();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }

  showInternetModal() {
    if (!Get.isBottomSheetOpen!) {
      Get.bottomSheet(
        NoInternetModal(
          fetchInfo: fetchInfo,
        ),
        isDismissible: true,
        isScrollControlled: true,
      );
    }
  }

  void fetchInfo() async {
    debugPrint("Fetching info");

    Future.delayed(const Duration(seconds: 2), () async {
      UpdateModel? data = await ref.watch(versionUpdateProvider.future);

      FlutterNativeSplash.remove();
      MapState? mapState = BoxManager().getMapState();
      String? token = BoxManager().getPrivateToken();
      debugPrint("---------Token: $token");
      if (data != null) {
        if (data.available) {
          if (mapState != null) {
            debugPrint("mapState: ${mapState.toString()}");
            final mapStateNotifier = ref.read(mapStateProvider.notifier);
            mapStateNotifier.updateMap(
              mapState.latitude,
              mapState.longitude,
              mapState.zoom,
            );
          }
          Get.off(() => const CustomNavigationBar());
        }

        if (data.latestUpdate != null) {
          return showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return PopScope(
                canPop: data.available,
                child: UpdateDialog(update: data),
              );
            },
          );
        }
      } else {
        Get.off(() => const NoInternetView());
      }
      // showInternetModal();
    });
  }
}
