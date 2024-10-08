import 'package:dynamic_multi_step_form/dynamic_multi_step_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:pmc_main/widgets/custom_filled_button.dart';

import '../../../Utils/app_colors.dart';
import '../../../widgets/custom_text_input.dart';

class PropertyLoanView extends ConsumerStatefulWidget {
  const PropertyLoanView({super.key});

  @override
  ConsumerState<PropertyLoanView> createState() => _PropertyLoanViewState();
}

class _PropertyLoanViewState extends ConsumerState<PropertyLoanView> {
  @override
  Widget build(BuildContext context) {
    List<Map> banks = [
      {
        "name": "JPMorgan Chase",
        "description":
            "JPMorgan Chase & Co. is an American multinational investment bank and financial services holding company headquartered in New York City.",
        "image": "https://logo.clearbit.com/jpmorganchase.com"
      },
      {
        "name": "Bank of America",
        "description":
            "Bank of America is an American multinational investment bank and financial services company headquartered in Charlotte, North Carolina.",
        "image":
            "https://mma.prnewswire.com/media/1612970/Bank_of_America_Corporation_Logo.jpg?p=facebook"
      },
      {
        "name": "Wells Fargo",
        "description":
            "Wells Fargo & Company is an American multinational financial services company headquartered in San Francisco, California, with central offices throughout the United States.",
        "image": "https://logo.clearbit.com/wellsfargo.com"
      },
      {
        "name": "Citibank",
        "description":
            "Citibank is the consumer division of financial services multinational Citigroup, headquartered in New York City.",
        "image": "https://logo.clearbit.com/citi.com"
      },
      {
        "name": "Goldman Sachs",
        "description":
            "The Goldman Sachs Group, Inc. is an American multinational investment bank and financial services company headquartered in New York City.",
        "image": "https://logo.clearbit.com/goldmansachs.com"
      },
      {
        "name": "HSBC",
        "description":
            "HSBC Holdings plc is a British multinational investment bank and financial services holding company. It is the largest bank in Europe by total assets.",
        "image": "https://logo.clearbit.com/hsbc.com"
      },
      {
        "name": "Barclays",
        "description":
            "Barclays is a British multinational investment bank and financial services company, headquartered in London, England.",
        "image": "https://logo.clearbit.com/barclays.com"
      },
      {
        "name": "Deutsche Bank",
        "description":
            "Deutsche Bank AG is a German multinational investment bank and financial services company headquartered in Frankfurt, Germany.",
        "image":
            "https://mma.prnewswire.com/media/1201028/Deutsche_Bank.jpg?p=twitter"
      },
      {
        "name": "UBS",
        "description":
            "UBS Group AG is a Swiss multinational investment bank and financial services company founded and based in Switzerland.",
        "image": "https://logo.clearbit.com/ubs.com"
      },
      {
        "name": "BNP Paribas",
        "description":
            "BNP Paribas S.A. is a French international banking group. It is the largest bank in Europe and the seventh largest bank in the world.",
        "image": "https://logo.clearbit.com/bnpparibas.com"
      }
    ];
    List<Map> ghanaianBanks = [
      {
        "name": "Ghana Commercial Bank (GCB)",
        "description":
            "Ghana Commercial Bank, also known as GCB Bank, is the largest bank in Ghana by assets, operating an extensive network of branches across the country.",
        "image": "https://logo.clearbit.com/gcb.com.gh"
      },
      {
        "name": "Ecobank Ghana",
        "description":
            "Ecobank Ghana is a member of the leading independent pan-African banking group, Ecobank, offering a wide range of banking services to its customers.",
        "image": "https://logo.clearbit.com/ecobank.com"
      },
      {
        "name": "Stanbic Bank Ghana",
        "description":
            "Stanbic Bank Ghana is a member of the Standard Bank Group, providing personal and business banking solutions to its clients in Ghana.",
        "image": "https://logo.clearbit.com/stanbicbank.com.gh"
      },
      {
        "name": "Fidelity Bank Ghana",
        "description":
            "Fidelity Bank Ghana is one of the fastest growing banks in Ghana, offering a comprehensive suite of products and services for individuals and businesses.",
        "image": "https://logo.clearbit.com/fidelitybank.com.gh"
      },
      {
        "name": "Absa Bank Ghana",
        "description":
            "Absa Bank Ghana, formerly Barclays Bank of Ghana, is a leading financial services provider offering a range of banking solutions to its customers.",
        "image": "https://logo.clearbit.com/absa.com.gh"
      },
      {
        "name": "CAL Bank",
        "description":
            "CAL Bank is a commercial bank in Ghana providing a wide array of banking services to corporate, SME, and retail clients.",
        "image": "https://logo.clearbit.com/calbank.net"
      },
      {
        "name": "Zenith Bank Ghana",
        "description":
            "Zenith Bank Ghana is a subsidiary of Zenith Bank Plc, Nigeria, offering innovative financial solutions to its customers in Ghana.",
        "image": "https://logo.clearbit.com/zenithbank.com.gh"
      },
      {
        "name": "Agricultural Development Bank (ADB)",
        "description":
            "Agricultural Development Bank is a universal bank in Ghana with a focus on agricultural financing, providing financial services to farmers and agribusinesses.",
        "image":
            "https://cdn.modernghana.com/content__/640/457/newlogoforadb300x220.jpg"
      },
      {
        "name": "HFC Bank",
        "description":
            "HFC Bank, a subsidiary of Republic Bank Limited, offers a wide range of personal, business, and investment banking services in Ghana.",
        "image": "https://logo.clearbit.com/republicghana.com"
      },
      {
        "name": "First Atlantic Bank",
        "description":
            "First Atlantic Bank is a full-service commercial bank in Ghana offering a wide range of products and services for individual and corporate customers.",
        "image": "https://logo.clearbit.com/firstatlanticbank.com.gh"
      }
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
              const CustomTextInput(
                radius: 20,
                prefix: Icon(IconlyBroken.search),
                hint: "Search",
              ),
              const SizedBox(height: 20),
              Text(
                "Top lenders",
                style: TextStyle(
                  color: AppColors.defaultColor,
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: banks.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.network(
                              banks[index]['image'],
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 130,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            banks[index]['name'],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            banks[index]['description'],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      width: 10,
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Recommended for you",
                style: TextStyle(
                  color: AppColors.defaultColor,
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                ),
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: ghanaianBanks.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: Get.width * 0.4,
                            width: Get.width * 0.4,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.network(
                                ghanaianBanks[index]['image'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.05,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ghanaianBanks[index]['name'],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  ghanaianBanks[index]['description'],
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 10),
                                CustomFilledButton(
                                  onPressed: () {},
                                  fullWidth: false,
                                  height: 30,
                                  child: const Text(
                                    "Visit us",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 10.0,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
