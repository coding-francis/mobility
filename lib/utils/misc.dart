import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/box_manager.dart';
import '../widgets/custom_filled_button.dart';
import 'app_dialogs.dart';

class Misc {
  static String generateRandomNumber() {
    final random = Random();
    int number = random.nextInt(900000000) + 100000000;
    return number.toString();
  }

  static List<String> titles = [
    "Mr.",
    "Mrs.",
    "Miss",
    "Ms.",
    "Dr.",
    "Prof.",
    "Rev.",
    "Hon. (Honorable)",
    "Capt. (Captain)",
    "Col. (Colonel)",
    "Major",
    "Sir",
    "Madam",
  ];

  static Map<String, String?>? convertMapToStringNullable(
      Map<String, dynamic>? originalMap) {
    if (originalMap == null) {
      return null;
    }

    final convertedMap = <String, String?>{};
    originalMap.forEach((key, value) {
      convertedMap[key] = value?.toString();
    });

    return convertedMap;
  }

  static Map<String, dynamic> convertStringMapToDynamic(
      Map<String, String?>? stringMap) {
    final dynamicMap = <String, dynamic>{};

    if (stringMap != null) {
      stringMap.forEach((key, value) {
        // Convert null values to null in the dynamic map, otherwise, use the String value.
        dynamicMap[key] = value;
      });
    }

    return dynamicMap;
  }

  static String camelCaseToWords(String input) {
    String words = input.replaceAllMapped(
      RegExp(r'([a-z])([A-Z])'),
      (Match match) => '${match.group(1)} ${match.group(2)}',
    );

    return '${words[0].toUpperCase()}${words.substring(1)}';
  }

  // static bool profileComplete() {
  //   return BoxManger().getUser()!.profilePicture != null &&
  //       BoxManger().getUser()!.phone != null;
  // }

  static Map<String, dynamic> convertDynamicMapToMap(
      Map<dynamic, dynamic> dynamicMap) {
    Map<String, dynamic> stringMap = {};
    dynamicMap.forEach((key, value) {
      stringMap[key.toString()] = value;
    });
    return stringMap;
  }

  static selectTime({required BuildContext context, TimeOfDay? initial}) async {
    final ThemeData theme = Theme.of(context);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return buildMaterialTimePicker(context: context, initial: initial);
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return buildMaterialTimePicker(context: context, initial: initial);
    }
  }

  static selectDate({
    required BuildContext context,
    DateTime? first,
    DateTime? last,
  }) async {
    final ThemeData theme = Theme.of(context);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return buildMaterialDatePicker(context, first, last);
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return buildMaterialDatePicker(context, first, last);
    }
  }

  static Future<TimeOfDay?> buildMaterialTimePicker(
      {required BuildContext context, TimeOfDay? initial}) async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: initial ??
          TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute),
    );
    return time;
  }

  static Future<DateTime?> buildCupertinoDateTimePicker(
      BuildContext context) async {
    DateTime? date;
    return await showModalBottomSheet<DateTime>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: MediaQuery.of(context).copyWith().size.height / 3,
              color: Colors.white,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (DateTime value) {
                  date = value;
                },
                initialDateTime: DateTime.now(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CustomFilledButton(
                    height: 40,
                    fullWidth: false,
                    onPressed: () {
                      Get.back(result: date);
                    },
                    child: const Text('Done'),
                  ),
                )
              ],
            )
          ],
        );
      },
    );
  }

  static Future<DateTime?> buildMaterialDatePicker(
      BuildContext context, DateTime? first, DateTime? last) async {
    return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: first ?? DateTime(1800),
      lastDate: last ?? DateTime.now(),
      initialEntryMode: DatePickerEntryMode.calendar,
    );
  }

  static openLink(String link) async {
    if (await canLaunchUrl(Uri.parse(link))) {
      await launchUrl(Uri.parse(link), mode: LaunchMode.externalApplication);
    } else {
      AppDialogs.showError(msg: 'Could not open $link');
    }
  }

  static makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    try {
      await launchUrl(launchUri);
    } catch (e) {
      debugPrint('Could not launch $launchUri');
    }
  }

  static sendEmail(String email) async {
    final Uri launchUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    try {
      await launchUrl(launchUri);
    } catch (e) {
      debugPrint('Could not launch $launchUri');
    }
  }
}
