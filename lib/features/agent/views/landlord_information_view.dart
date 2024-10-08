import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:pmc_main/Utils/app_colors.dart';

import '../../../widgets/bottom_navigation_bar.dart';
import '../../../widgets/property_card.dart';

class LandLordInformationView extends ConsumerStatefulWidget {
  const LandLordInformationView({super.key});

  @override
  ConsumerState<LandLordInformationView> createState() =>
      _LandLordInformationViewState();
}

class _LandLordInformationViewState
    extends ConsumerState<LandLordInformationView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
            onPressed: () {
              Get.offAll(() => const CustomNavigationBar());
            },
            icon: const Icon(
              IconlyBroken.home,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      'https://img.freepik.com/free-photo/handsome-bearded-guy-posing-against-white-wall_273609-20597.jpg?size=626&ext=jpg&ga=GA1.1.1224184972.1714953600&semt=sph',
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Landlord Name",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "landlord@gmail.com",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: Get.width / 4,
                  height: 60.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.shade300,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "5.0",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              IconlyBold.star,
                              size: 15,
                              color: AppColors.secondaryColor,
                            ),
                            Icon(
                              IconlyBold.star,
                              size: 15,
                              color: AppColors.secondaryColor,
                            ),
                            Icon(
                              IconlyBold.star,
                              size: 15,
                              color: AppColors.secondaryColor,
                            ),
                            Icon(
                              IconlyBold.star,
                              size: 15,
                              color: AppColors.secondaryColor,
                            ),
                            Icon(
                              IconlyBold.star,
                              size: 15,
                              color: AppColors.secondaryColor,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: Get.width / 4,
                  height: 60.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    // color: Colors.grey.shade300,
                    border: Border.all(
                      width: 0.5,
                    ),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "235",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("Reviews"),
                      )
                    ],
                  ),
                ),
                Container(
                  width: Get.width / 4,
                  height: 60.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    // color: Colors.grey.shade300,
                    border: Border.all(
                      width: 0.5,
                    ),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "18",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("Sold"),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black38,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                  // border: Border.all(color: Colors.black, width: 1),
                ),
                dividerColor: Colors.transparent,
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                tabs: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Listing",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Sold",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "2 Listings",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // CustomPropertyCard(
                        //   name: '12 contemporary home',
                        //   price: 'GHC 1,700.00',
                        //   url:
                        //       'https://i.pinimg.com/736x/be/d5/8e/bed58e0fea0bec4c3924858a2a13cd5d.jpg',
                        //   rating: '4.8',
                        //   location: 'East Legon',
                        //   favorite: true,
                        // ),
                        // SizedBox(height: 10.0),
                        // CustomPropertyCard(
                        //   name: '2 bedroom self contains',
                        //   price: 'GHC 900.00',
                        //   url:
                        //       'https://photos.zillowstatic.com/fp/4fbc5f04780b850c2235944b9a1c3f3f-p_e.jpg',
                        //   rating: '4.8',
                        //   location: 'Achimota',
                        //   favorite: true,
                        // ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "2 Sold",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
