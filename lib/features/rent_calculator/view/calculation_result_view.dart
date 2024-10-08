import 'package:dynamic_multi_step_form/dynamic_multi_step_form.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:pmc_main/widgets/custom_filled_button.dart';

import '../../../Utils/app_colors.dart';

class CalculationResultView extends ConsumerStatefulWidget {
  const CalculationResultView({super.key});

  @override
  ConsumerState<CalculationResultView> createState() =>
      _CalculationResultViewState();
}

class _CalculationResultViewState extends ConsumerState<CalculationResultView> {
  TextStyle infoStyle = const TextStyle(
    fontSize: 18.0,
    color: Colors.black45,
    fontWeight: FontWeight.w600,
  );

  @override
  Widget build(BuildContext context) {
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
        actions: [
          IconButton(
            onPressed: () => _showTermsAndConditionsModal(context),
            icon: const Icon(
              Icons.info,
              color: Colors.white,
              size: 25,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Based on your submission",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ExpansionTile(
                initiallyExpanded: true,
                trailing: const Icon(
                  Icons.local_activity,
                  color: Colors.green,
                ),
                title: const Text(
                  "30% Sweet Spot",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                children: [
                  const SizedBox(height: 10),
                  Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12, width: 2.0),
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                    child: Image.network(
                      'https://media.publit.io/file/Screenshot-2024-05-22-153831-9.png',
                      width: double.infinity,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Monthly Income", style: infoStyle),
                        Text("GHC24,900.00", style: infoStyle),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Monthly Expenses", style: infoStyle),
                        Text("GHC8,000.00", style: infoStyle),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Monthly Savings", style: infoStyle),
                        Text("GHC10,000.00", style: infoStyle),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Budget", style: infoStyle),
                        Text("GHC2,000.00", style: infoStyle),
                      ],
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                trailing: const Icon(
                  Icons.document_scanner_sharp,
                  color: Colors.amber,
                ),
                title: const Text(
                  "20% Thrifty",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.amber,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                children: [
                  const SizedBox(height: 10),
                  Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12, width: 2.0),
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                    child: Image.network(
                      'https://media.publit.io/file/Screenshot-2024-05-22-153831-9.png',
                      width: double.infinity,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Monthly Income", style: infoStyle),
                        Text("GHC24,900.00", style: infoStyle),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Monthly Expenses", style: infoStyle),
                        Text("GHC8,000.00", style: infoStyle),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Monthly Savings", style: infoStyle),
                        Text("GHC10,000.00", style: infoStyle),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Budget", style: infoStyle),
                        Text("GHC2,000.00", style: infoStyle),
                      ],
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                trailing: const Icon(
                  Icons.monetization_on_outlined,
                  color: Colors.red,
                ),
                title: const Text(
                  "50% A Splurge",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                children: [
                  const SizedBox(height: 10),
                  Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12, width: 2.0),
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                    child: Image.network(
                      'https://media.publit.io/file/Screenshot-2024-05-22-153831-9.png',
                      width: double.infinity,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Monthly Income", style: infoStyle),
                        Text("GHC24,900.00", style: infoStyle),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Monthly Expenses", style: infoStyle),
                        Text("GHC8,000.00", style: infoStyle),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Monthly Savings", style: infoStyle),
                        Text("GHC10,000.00", style: infoStyle),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Budget", style: infoStyle),
                        Text("GHC2,000.00", style: infoStyle),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: 2.0),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Our Advice',
                      style: infoStyle,
                    ),
                    const Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              CustomFilledButton(
                radius: 15.0,
                onPressed: () {},
                child: const Text(
                  'Find Property',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showTermsAndConditionsModal(
    BuildContext context,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12, width: 2.0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'What is The Rent Calculator?',
                            style: infoStyle,
                          ),
                          const Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12, width: 2.0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: const TextSpan(children: [
                          TextSpan(
                            text: "Disclaimer: ",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text:
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                            style: TextStyle(color: Colors.black),
                          ),
                        ]),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12, width: 2.0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'How does The Rent Calculator work?',
                            style: infoStyle,
                          ),
                          const Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12, width: 2.0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'What percentage of my income should go to rent?',
                            style: infoStyle,
                          ),
                          const Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
