import 'package:dynamic_multi_step_form/dynamic_multi_step_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../Utils/app_colors.dart';
import '../core/box_manager.dart';
import '../features/account_information/account_settings_view.dart';
import '../features/agent/views/find_an_agent_view.dart';
import '../features/property_loan/view/property_loan_view.dart';
import '../models/user_model.dart';

class CustomMainDrawer extends ConsumerWidget {
  const CustomMainDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserModel? user = BoxManager().getUser();
    return Drawer(
      backgroundColor: Colors.grey.shade300,
      elevation: 2,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          user == null
              ? const SizedBox(
                  height: 40,
                )
              : DrawerHeader(
                  padding: const EdgeInsets.symmetric(horizontal: 20.00),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.to(() => const AccountSettingsView());
                            },
                            icon: const Icon(Icons.settings),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.secondaryColor,
                            radius: 40,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${user.firstName} ${user.lastName}",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.ellipsis),
                                Text(
                                  user.emailAddress,
                                  style: const TextStyle(fontSize: 15),
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
          ListTile(
            leading: const Icon(Icons.person_pin_outlined),
            title: const Text('Find Property'),
            onTap: () {
              Get.to(() => const FindAnAgentView());
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_pin_outlined),
            title: const Text('Find An Agent'),
            onTap: () {
              Get.to(() => const FindAnAgentView());
            },
          ),
          ListTile(
            leading: const Icon(Icons.calculate_outlined),
            title: const Text('Rent Calculator'),
            onTap: () {},
          ),
          // ListTile(
          //   leading: const Icon(Icons.manage_search_outlined),
          //   title: const Text('Find My Next Home'),
          //   onTap: () {},
          // ),
          ListTile(
            leading: const Icon(Icons.manage_search_outlined),
            title: const Text('Property loans'),
            onTap: () {
              Get.to(() => const PropertyLoanView());
            },
          ),
          // ListTile(
          //   leading: const Icon(Icons.person_2_outlined),
          //   title: const Text('Tenant Screener'),
          //   onTap: () {},
          // ),
          ListTile(
            leading: const Icon(Icons.contact_support_outlined),
            title: const Text('Contact Us'),
            onTap: () {},
          ),
          // user == null
          //     ? Column(
          //         children: [
          //           const Divider(),
          //           Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: CustomFilledButton(
          //               radius: 15.0,
          //               onPressed: () {
          //                 // Get.to(() => const LoginView());
          //               },
          //               child: const Text(
          //                 "Login",
          //                 style: TextStyle(
          //                   color: Colors.white,
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ],
          //       )
          //     : const SizedBox()
        ],
      ),
    );
  }
}
