import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../Utils/app_colors.dart';
import 'custom_outline_button.dart';

final loadingProvider = StateProvider<bool>((ref) => false);

class NoInternetModal extends ConsumerStatefulWidget {
  final Function fetchInfo;

  const NoInternetModal({super.key, required this.fetchInfo});

  @override
  ConsumerState createState() => _NoInternetModalState();
}

class _NoInternetModalState extends ConsumerState<NoInternetModal> {
  List messages = [
    "Check if you have your mobile data or Wi-Fi connection turned on.",
    "Verify that you have an active data plan with your Internet provider."
        "Still stuck? Contact Support.",
    // "Call to check if we are running a server maintenance. +233204920230."
  ];

  @override
  Widget build(BuildContext context) {
    bool loading = ref.watch(loadingProvider);
    return PopScope(
      canPop: true,
      // onWillPop: () async => false,
      child: SizedBox(
        height: Get.height,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              // shrinkWrap: true,
              // primary: true,
              // padding: const EdgeInsets.all(20),
              children: [
                // Center(
                //   child: Image.asset(
                //     AppImages.noInternet,
                //     height: 100,
                //     width: 100,
                //   ),
                // ),
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
                    setState(() {
                      loading = true;
                    });
                    widget.fetchInfo();
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
        ),
      ),
    );
  }
}
