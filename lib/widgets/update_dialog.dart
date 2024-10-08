import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../../../Utils/app_colors.dart';
import '../../../utils/misc.dart';
import '../../../widgets/custom_filled_button.dart';
import '../models/update_model.dart';

class UpdateDialog extends ConsumerWidget {
  final UpdateModel update;

  const UpdateDialog({super.key, required this.update});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'PMC Portal has a new update!',
              style: TextStyle(
                color: AppColors.defaultColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Divider(thickness: 1),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Version:',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '- PMC Portal v${update.latestUpdate?.version}(${update.latestUpdate?.buildNumber})',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Changelog:',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              update.latestUpdate!.features,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(thickness: 1),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Visibility(
                    visible: update.available,
                    child: CustomFilledButton(
                      bgColor: Colors.red, // Palette.blue,
                      radius: 25,
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        'Close',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomFilledButton(
                    bgColor: AppColors.defaultColor,
                    radius: 25,
                    onPressed: () async {
                      Misc.openLink(Platform.isIOS
                          ? 'https://apps.apple.com/gh/app/oyeh/211212'
                          : 'https://play.google.com/store/apps/details?id=com.oyeh_ghana');

                      // if (BoxManager().getFcmToken() == null) {
                      //   ref.read(tokenProvider.notifier).setPrivateToken(null);
                      // }
                    },
                    child: const Text(
                      'Update',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
