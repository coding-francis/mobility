import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:pmc_main/Utils/app_colors.dart';

import '../../../provider/favorite_property_provider.dart';
import '../../../widgets/property_card.dart';
import '../../../widgets/property_shimmer.dart';

class FavoritePropertyView extends ConsumerStatefulWidget {
  const FavoritePropertyView({super.key});

  @override
  ConsumerState<FavoritePropertyView> createState() =>
      _FavoritePropertyViewState();
}

class _FavoritePropertyViewState extends ConsumerState<FavoritePropertyView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    FavoritePropertyState favoritePropertyState =
        ref.watch(favoritePropertyProvider);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.defaultColor,
          title: const Text(
            "Favorite properties",
            style: TextStyle(color: Colors.white),
          ),
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
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                favoritePropertyState.loading
                    ? ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return const PropertyShimmer();
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox();
                        },
                        itemCount: 3,
                      )
                    : favoritePropertyState.properties.isEmpty
                        ? const Center(
                            child: Text(
                              "You have not added any items to your favorites",
                            ),
                          )
                        : ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return CustomPropertyCard(
                                property:
                                    favoritePropertyState.properties[index],
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                height: 10,
                              );
                            },
                            itemCount: favoritePropertyState.properties.length,
                          ),
              ],
            ),
          ),
        ));
  }

  void initialize() {
    Future.delayed(Duration.zero, () {
      ref.read(favoritePropertyProvider.notifier).resetCurrent();
      ref.read(favoritePropertyProvider.notifier).getFavoriteProperties();
    });
  }
}
