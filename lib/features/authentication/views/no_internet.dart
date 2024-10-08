import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../../../Utils/app_colors.dart';
import '../../../core/box_manager.dart';
import '../../../models/update_model.dart';
import '../../../provider/map_state_provider.dart';
import '../../../provider/version_update_provider.dart';
import '../../../utils/app_images.dart';
import '../../../widgets/bottom_navigation_bar.dart';
import '../../../widgets/custom_outline_button.dart';
import 'dart:async';

import '../../../widgets/update_dialog.dart';

class NoInternetView extends ConsumerStatefulWidget {
  const NoInternetView({super.key});

  @override
  ConsumerState<NoInternetView> createState() => _NoInternetViewState();
}

class _NoInternetViewState extends ConsumerState<NoInternetView> {
  bool loading = false;

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    _timer = Timer.periodic(const Duration(seconds: 90), (timer) {
      fetchInfo(context);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List messages = [
      "Check if you have your mobile data or Wi-Fi connection turned on.",
      "Verify that you have an active data plan with your Internet provider."
          "Still stuck? Contact Support.",
      "Thanks for using oyeh"
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          // shrinkWrap: true,
          // primary: true,
          // padding: const EdgeInsets.all(20),
          children: [
            Center(
              child: Image.asset(AppImages.noInternet, height: 100, width: 100),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Sorry, it seems you're currently without an internet connection. Here's what to do:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                ListTile(
                  title: Text('1. ${messages[0]}'),
                ),
                ListTile(
                  title: Text('2. ${messages[1]}'),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            CustomOutlineButton(
              onPressed: () {
                fetchInfo(context);
              },
              radius: 25,
              fullWidth: false,
              child: loading == true
                  ? SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColors.defaultColor,
                      ),
                    )
                  : Text(
                      'Try Again',
                      style: TextStyle(
                        color: AppColors.defaultColor,
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }

  void fetchInfo(BuildContext context) async {
    Future.delayed(Duration.zero, () async {
      setState(() {
        loading = true;
      });
      UpdateModel? data = await ref.refresh(versionUpdateProvider.future);
      if (data != null) {
        if (data.available) {
          MapState? mapState = BoxManager().getMapState();
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
          setState(() {
            loading = false;
          });
          showDialog(
            barrierDismissible: false,
            builder: (context) {
              return PopScope(
                canPop: data.available,
                child: UpdateDialog(update: data),
              );
            },
            context: context,
          );
        }
      } else {
        setState(() {
          loading = false;
        });
      }
    });
  }
}
