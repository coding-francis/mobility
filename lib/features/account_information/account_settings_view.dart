import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pmc_main/Utils/app_colors.dart';
import 'package:pmc_main/core/box_manager.dart';
import 'package:pmc_main/widgets/custom_filled_button.dart';
import 'package:pmc_main/widgets/custom_text_input.dart';

import '../../models/user_model.dart';

class AccountSettingsView extends StatefulWidget {
  const AccountSettingsView({super.key});

  @override
  State<AccountSettingsView> createState() => _AccountSettingsViewState();
}

class _AccountSettingsViewState extends State<AccountSettingsView> {
  @override
  Widget build(BuildContext context) {
    UserModel? user = BoxManager().getUser();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.defaultColor,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 10.0,
                      ),
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8fDA%3D',
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        "${user?.firstName} ${user?.lastName}",
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${user?.emailAddress}",
                        style: const TextStyle(fontSize: 15),
                      ),
                      Text(
                        "${user?.phoneNumber}",
                        style: const TextStyle(fontSize: 15),
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              CustomTextInput(
                radius: 15,
                label: "Your Email",
                readOnly: true,
                initial: user?.emailAddress ?? '',
              ),
              const SizedBox(height: 20.0),
              CustomTextInput(
                radius: 15,
                label: "Phone number",
                readOnly: true,
                initial: user?.phoneNumber ?? '',
              ),
              const SizedBox(height: 20.0),
              CustomTextInput(
                radius: 15,
                label: "First name",
                initial: user?.firstName ?? '',
              ),
              const SizedBox(height: 20.0),
              CustomTextInput(
                radius: 15,
                label: "Middle name",
                initial: user?.middleName ?? '',
              ),
              const SizedBox(height: 20.0),
              CustomTextInput(
                radius: 15,
                label: "Last name",
                initial: user?.lastName ?? '',
              ),
              const SizedBox(height: 20.0),
              CustomFilledButton(
                radius: 15.0,
                onPressed: () {},
                child: const Text(
                  "Update",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
