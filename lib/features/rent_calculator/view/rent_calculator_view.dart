import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:pmc_main/Utils/app_colors.dart';
import 'package:pmc_main/widgets/custom_filled_button.dart';
import 'package:pmc_main/widgets/custom_text_input.dart';

import '../../../widgets/main_menu_drawer.dart';
import 'calculation_result_view.dart';

class RentCalculatorView extends ConsumerStatefulWidget {
  const RentCalculatorView({super.key});

  @override
  ConsumerState<RentCalculatorView> createState() => _RentCalculatorViewState();
}

class _RentCalculatorViewState extends ConsumerState<RentCalculatorView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.defaultColor,
        actions: [
          Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              iconSize: 30.0,
            ),
          ),
        ],
      ),
      endDrawer: const CustomMainDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: Form(
            // key:_formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Let's help you know how much you can afford",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomTextInput(
                  radius: 15.0,
                  hint: "eg. 500.00",
                  label: "Monthly Savings",
                  keyboard: TextInputType.number,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const CustomTextInput(
                  radius: 15.0,
                  hint: "eg. 500.00",
                  label: "Monthly Savings",
                  keyboard: TextInputType.number,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const CustomTextInput(
                  radius: 15.0,
                  hint: "eg. 500.00",
                  label: "Monthly Savings",
                  keyboard: TextInputType.number,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const CustomTextInput(
                  radius: 15.0,
                  hint: "eg. 500.00",
                  label: "Budget",
                  keyboard: TextInputType.number,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CustomFilledButton(
                  radius: 15,
                  onPressed: () {
                    Get.to(() => const CalculationResultView());
                  },
                  child: const Text(
                    "Calculate",
                    style: TextStyle(color: Colors.white),
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
