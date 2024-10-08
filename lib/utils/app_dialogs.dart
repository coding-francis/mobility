import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';

import '../widgets/custom_filled_button.dart';
import 'app_colors.dart';
import 'custom_animation.dart';

class AppDialogs {
  static Future showLoading({String? msg}) async {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.threeBounce
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.yellow
      ..backgroundColor = AppColors.defaultColor
      ..indicatorColor = Colors.white
      ..textColor = Colors.white
      ..maskColor = Colors.black.withOpacity(0.6)
      ..userInteractions = false
      ..dismissOnTap = false
      ..customAnimation = CustomAnimation();

    return await EasyLoading.show(
      status: msg ?? 'Loading...',
      maskType: EasyLoadingMaskType.custom,
    );
  }

  static Future showSuccess({String? msg}) async {
    EasyLoading.instance
      ..displayDuration = const Duration(seconds: 8)
      ..indicatorSize = 45.0
      ..dismissOnTap = true
      ..indicatorColor = Colors.green //added
      ..textColor = Colors.white //added
      ..successWidget = const Icon(
        Icons.check_circle_rounded,
        size: 45,
        color: Colors.white,
      )
      ..radius = 10.0
      ..loadingStyle = EasyLoadingStyle.custom
      ..maskColor = Colors.black.withOpacity(0.6)
      ..backgroundColor = Colors.green
      ..userInteractions = true;

    return await EasyLoading.showSuccess(
      msg ?? 'Success!',
      maskType: EasyLoadingMaskType.custom,
    );
  }

  static Future showError({String? msg}) async {
    EasyLoading.instance
      ..displayDuration = const Duration(seconds: 10)
      ..dismissOnTap = true
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorColor = Colors.white
      ..textColor = Colors.white
      ..errorWidget = const Icon(
        Icons.warning_rounded,
        size: 45,
        color: Colors.white,
      )
      ..userInteractions = false
      ..maskColor = Colors.black.withOpacity(0.6)
      ..backgroundColor = Colors.red;

    return await EasyLoading.showError(
      msg ?? 'Error!',
      maskType: EasyLoadingMaskType.custom,
    );
  }

  static Future showNotification({String? msg}) async {
    EasyLoading.instance
      ..displayDuration = const Duration(seconds: 8)
      ..dismissOnTap = true
      ..indicatorSize = 20.0
      ..radius = 10.0
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorColor = Colors.white
      ..textColor = Colors.white
      ..errorWidget = const Icon(
        Icons.notifications_active,
        size: 25,
        color: Colors.white,
      )
      ..userInteractions = false
      ..maskColor = Colors.black.withOpacity(0.6)
      ..backgroundColor = AppColors.defaultColor
      ..toastPosition = EasyLoadingToastPosition.top;

    return await EasyLoading.showError(
      msg ?? 'Error!',
      maskType: EasyLoadingMaskType.custom,
    );
  }

  static dismissDialogs() async {
    return await EasyLoading.dismiss();
  }

  static logoutDialog(dynamic func) {
    Get.dialog(AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      icon: Icon(
        IconlyBold.infoCircle,
        size: 80,
        color: AppColors.defaultColor,
      ),
      title: const Text(
        'Logout',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      content: const Text(
        'Do you want to logout?',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
      actionsPadding: const EdgeInsets.all(10),
      actions: [
        Row(
          children: [
            Expanded(
              child: CustomFilledButton(
                radius: 10,
                height: 40,
                onPressed: () {
                  Get.back();
                },
                child:
                    const Text('Cancel', style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: CustomFilledButton(
                radius: 10,
                height: 40,
                onPressed: () {
                  Get.back();
                  func();
                },
                bgColor: Colors.red,
                child: const Text(
                  'Confirm',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }

  static Future choiceDialog({
    Function()? cancelFunc,
    Function()? okFunc,
    String? cancelText,
    String? okText,
    Widget? icon,
    Widget? content,
    String? title,
    List<Widget>? actions,
    required String body,
  }) async {
    await Get.dialog(AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      icon: icon ??
          Icon(
            IconlyBold.infoCircle,
            size: 80,
            color: AppColors.defaultColor,
          ),
      title: Text(
        title ?? 'Logout',
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      content: content ??
          Text(
            body,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
      actionsPadding: const EdgeInsets.all(10),
      actions: actions ??
          [
            Row(
              children: [
                Expanded(
                  child: CustomFilledButton(
                    radius: 10,
                    height: 40,
                    bgColor: Colors.red,
                    onPressed: () {
                      Get.back();
                      if (cancelFunc != null) {
                        cancelFunc();
                      }
                    },
                    child: Text(cancelText ?? 'Cancel'),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomFilledButton(
                    radius: 10,
                    height: 40,
                    onPressed: () {
                      Get.back();
                      if (okFunc != null) {
                        okFunc();
                      }
                    },
                    bgColor: AppColors.defaultColor,
                    child: Text(
                      okText ?? 'Confirm',
                    ),
                  ),
                ),
              ],
            ),
          ],
    ));
    return;
  }
}
