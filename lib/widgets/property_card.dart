import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:pmc_main/models/property_model.dart';

import '../Utils/app_colors.dart';
import '../features/property_detail/view/property_detail_view.dart';
import '../provider/favorite_property_provider.dart';

class CustomPropertyCard extends ConsumerStatefulWidget {
  final PropertyModel property;

  const CustomPropertyCard({super.key, required this.property});

  @override
  ConsumerState<CustomPropertyCard> createState() => _CustomPropertyCardState();
}

class _CustomPropertyCardState extends ConsumerState<CustomPropertyCard> {
  bool isFavorite = false;
  bool actionTaken = false;

  @override
  void initState() {
    super.initState();
    // Initialize isFavorite based on the initial state
    final favoritePropertyState = ref.read(favoritePropertyProvider);
    final favoriteIds = favoritePropertyState.properties.map((e) => e.id);
    isFavorite = favoriteIds.contains(widget.property.id);
  }

  @override
  Widget build(BuildContext context) {
    PropertyModel property = widget.property;
    ref.listen<FavoritePropertyState>(favoritePropertyProvider, (_, next) {
      final favoriteIds = next.properties.map((e) => e.id);
      if (isFavorite != favoriteIds.contains(property.id)) {
        setState(() {
          isFavorite = favoriteIds.contains(property.id);
        });
      }
    });

    return InkWell(
      onTap: () {
        Get.to(() => const PropertyDetailView());
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: Colors.grey.shade200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Image.network(
                    "https://i0.wp.com/port2flavors.com/wp-content/uploads/2022/07/placeholder-614.png?fit=1200%2C800&ssl=1",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () async {
                          bool state;
                          if (isFavorite) {
                            state = await ref
                                .read(favoritePropertyProvider.notifier)
                                .removeFavorites(propertyId: property.id);
                          } else {
                            state = await ref
                                .read(favoritePropertyProvider.notifier)
                                .addToFavorites(propertyId: property.id);
                          }
                          setState(() {
                            isFavorite = state;
                            actionTaken = true;
                          });
                        },
                        icon: Icon(
                          isFavorite ? IconlyBold.heart : IconlyBroken.heart,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          property.propertyName,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      Text(
                        "GHS${property.price}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    property.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    IconlyBold.location,
                    color: AppColors.defaultColor,
                    size: 20,
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      "${property.address.street} ${property.address.city}, ${property.address.region} - ${property.address.country}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
