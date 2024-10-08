import 'package:dynamic_multi_step_form/dynamic_multi_step_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:pmc_main/Utils/app_colors.dart';
import 'package:pmc_main/widgets/custom_text_input.dart';

import '../widgets/agent_card.dart';

class FindAnAgentView extends ConsumerStatefulWidget {
  const FindAnAgentView({super.key});

  @override
  ConsumerState<FindAnAgentView> createState() => _FindAnAgentViewState();
}

class _FindAnAgentViewState extends ConsumerState<FindAnAgentView> {
  @override
  Widget build(BuildContext context) {
    List<String> names = [
      'John',
      'Emily',
      'Michael',
      'Sophia',
      'William',
      "ken",
      "Jonathan",
      "Andrew"
    ];
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Search Estate Agent",
                style: TextStyle(
                  color: AppColors.defaultColor,
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const Text("Find the best recommendations place to live"),
              const SizedBox(height: 20),
              const CustomTextInput(
                radius: 20,
                prefix: Icon(IconlyBroken.search),
                hint: "Search Agent",
              ),
              const SizedBox(height: 20),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: names.length,
                itemBuilder: (context, index) {
                  return AgentCard(
                    name: names[index],
                  );
                },
              ),
              const SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}
