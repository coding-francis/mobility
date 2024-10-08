import 'package:dynamic_multi_step_form/dynamic_multi_step_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:pmc_main/Utils/app_colors.dart';
import 'package:pmc_main/features/agent/widgets/agent_profile.dart';

import '../../../widgets/custom_text_input.dart';
import '../../../widgets/property_card.dart';
import '../../agent/views/find_an_agent_view.dart';
import '../widgets/map_view_drawer.dart';

class ListPropertyView extends ConsumerStatefulWidget {
  const ListPropertyView({super.key});

  @override
  ConsumerState<ListPropertyView> createState() => _ListPropertyViewState();
}

class _ListPropertyViewState extends ConsumerState<ListPropertyView> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> profiles = [
      {
        'name': 'John',
        'imageUrl': 'https://randomuser.me/api/portraits/men/51.jpg'
      },
      {
        'name': 'Alice',
        'imageUrl': 'https://randomuser.me/api/portraits/women/80.jpg'
      },
      {
        'name': 'Bob',
        'imageUrl': 'https://randomuser.me/api/portraits/men/57.jpg'
      },
      {
        'name': 'Emma',
        'imageUrl': 'https://randomuser.me/api/portraits/men/45.jpg'
      },
      {
        'name': 'David',
        'imageUrl': 'https://randomuser.me/api/portraits/men/38.jpg'
      },
      {
        'name': 'Sophia',
        'imageUrl': 'https://randomuser.me/api/portraits/women/26.jpg'
      },
      {
        'name': 'James',
        'imageUrl': 'https://randomuser.me/api/portraits/men/18.jpg'
      },
      {
        'name': 'Olivia',
        'imageUrl': 'https://randomuser.me/api/portraits/women/65.jpg'
      },
      {
        'name': 'Michael',
        'imageUrl': 'https://randomuser.me/api/portraits/men/74.jpg'
      },
      {
        'name': 'Emily',
        'imageUrl': 'https://randomuser.me/api/portraits/women/27.jpg'
      },
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
        actions: [
          Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
              icon: const Icon(
                Icons.tune_outlined,
                color: Colors.white,
              ),
              iconSize: 30.0,
            ),
          ),
        ],
      ),
      endDrawer: const MapViewDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Let's Start Exploring",
                style: TextStyle(
                  color: AppColors.defaultColor,
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 20),
              const CustomTextInput(
                radius: 20,
                prefix: Icon(IconlyBroken.search),
                hint: "Search Apartment, House etc",
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Agents",
                    style: TextStyle(
                      color: AppColors.defaultColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => const FindAnAgentView());
                    },
                    child: Text(
                      "Explore",
                      style: TextStyle(color: AppColors.secondaryColor),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 130,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: profiles.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AgentProfileListItem(
                        name: profiles[index]['name'],
                        imageUrl: profiles[index]['imageUrl'],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // CustomPropertyCard(
                  //   name: 'Maridian view',
                  //   price: 'GHC 4,000.00',
                  //   url:
                  //       'https://www.trulia.com/pictures/thumbs_4/zillowstatic/fp/b44bcee36dc7d7498bd1c5f5b8233d1c-full.jpg',
                  //   rating: '3.8',
                  //   location: 'Comm 1. Tema',
                  //   favorite: false,
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
