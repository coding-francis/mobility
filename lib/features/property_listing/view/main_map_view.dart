import 'dart:async';

import 'package:dynamic_multi_step_form/dynamic_multi_step_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pmc_main/provider/favorite_property_provider.dart';
import 'package:pmc_main/utils/app_colors.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../provider/map_state_provider.dart';
import '../../../provider/property_provider.dart';
import '../../../widgets/main_menu_drawer.dart';
import '../../../widgets/property_card.dart';
import '../../../widgets/property_shimmer.dart';
import '../widgets/map_view_drawer.dart';
import '../widgets/search_map.dart';
import 'list_view.dart';

class MainMapView extends ConsumerStatefulWidget {
  const MainMapView({super.key});

  @override
  ConsumerState<MainMapView> createState() => _MainMapViewState();
}

class _MainMapViewState extends ConsumerState<MainMapView> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  final double _panelHeightClosed = Get.height * 0.08;
  final double _panelHeightOpen = Get.height * 0.8;

  final GlobalKey _panelKey = GlobalKey();
  final PanelController _panelController = PanelController();

  bool _showMarkers = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    final List<Marker> markers = [
      Marker(
        markerId: const MarkerId('marker1'),
        position: const LatLng(5.657750, -0.025470),
        infoWindow: const InfoWindow(
          title: 'Marker 1',
          snippet: 'Description for Marker 1',
        ),
        // icon: BitmapDescriptor.fromAssetImage(
        //   ImageConfiguration(size: Size(48, 48)),
        //   'assets/house_icon.png',
        // ),
        onTap: () {
          debugPrint("Panel 1 tapped");
          _panelController.open();
        },
      ),
      const Marker(
        markerId: MarkerId('marker2'),
        position: LatLng(5.657, -0.026),
        infoWindow: InfoWindow(
          title: 'Marker 2',
          snippet: 'Description for Marker 2',
        ),
      ),
      const Marker(
        markerId: MarkerId('marker3'),
        position: LatLng(5.658, -0.025),
        infoWindow: InfoWindow(
          title: 'Marker 3',
          snippet: 'Description for Marker 3',
        ),
      ),
    ];

    MapState mapState = ref.watch(mapStateProvider);
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        backgroundColor: AppColors.defaultColor,
        actions: [
          Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
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
      endDrawer: const MapViewDrawer(),
      drawer: const CustomMainDrawer(),
      body: SlidingUpPanel(
        key: _panelKey,
        controller: _panelController,
        maxHeight: _panelHeightOpen,
        minHeight: _panelHeightClosed,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
        body: Stack(
          children: [
            GoogleMap(
              onMapCreated: _onMapCreated,
              mapType: MapType.hybrid,
              initialCameraPosition: CameraPosition(
                // bearing: 192.8334901395799,
                target: LatLng(mapState.latitude, mapState.longitude),
                // target: LatLng(7.9465, -1.0232),
                // tilt: 59.440717697143555,
                // zoom: 19.151926040649414,
                zoom: mapState.zoom,
              ),
              markers: _showMarkers ? Set<Marker>.of(markers) : <Marker>{},
              onCameraMoveStarted: () {
                // Store previous zoom value
                // _previousZoom = _controller.future.result!.zoom;
              },
              onCameraMove: (CameraPosition position) {
                if (position.zoom > 11) {
                  setState(() {
                    _showMarkers = true;
                  });
                } else {
                  setState(() {
                    _showMarkers = false;
                  });
                }
                debugPrint(
                  "Current Bearing: ${position.bearing} Current latitude: ${position.target.latitude} Current Bearing:  ${position.target.longitude} Zoom changed to: ${position.zoom}",
                );
                final mapStateNotifier = ref.read(mapStateProvider.notifier);
                mapStateNotifier.updateMap(
                  position.target.latitude,
                  position.target.longitude,
                  position.zoom,
                );
              },
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
            ),
            Positioned(
              top: Get.height * 0.7,
              // left: Get.width * 0.45,
              // left: 10.0,
              left: 0,
              right: 0,
              child: Center(
                child: InkWell(
                  onTap: () {
                    debugPrint("Open list view");
                    Get.to(() => const ListPropertyView());
                  },
                  child: Container(
                    height: 40,
                    width: 100,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: AppColors.defaultColor,
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.list_alt_outlined,
                          color: Colors.white,
                        ),
                        Text(
                          "List view",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20.0,
              left: 20.0,
              right: 20.0,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Expanded(
                            child: SearchLocation(),
                          ),
                          IconButton(
                            icon: const Icon(IconlyBroken.search),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Builder(
                      builder: (context) => IconButton(
                        onPressed: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        icon: const Icon(Icons.tune_outlined),
                        iconSize: 30.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        panel: _buildPanel(),
        collapsed: _buildCollapsedPanel(),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  Widget _buildPanel() {
    PropertyState propertyState = ref.watch(propertyProvider);
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            propertyState.loading
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
                : ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return CustomPropertyCard(
                        property: propertyState.properties[index],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: propertyState.properties.length,
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildCollapsedPanel() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 8.0),
          Container(
            width: 40.0,
            height: 4.0,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2.0),
            ),
          ),
          const SizedBox(height: 8.0),
          const Text(
            'Slide up to or select a property see more',
            style: TextStyle(fontSize: 12.0),
          ),
        ],
      ),
    );
  }

  void initialize() {
    Future.delayed(Duration.zero, () {
      ref.read(propertyProvider.notifier).resetCurrent();
      ref.read(propertyProvider.notifier).getAllMyProperties();

      ref.read(favoritePropertyProvider.notifier).resetCurrent();
      ref.read(favoritePropertyProvider.notifier).getFavoriteProperties();
    });
  }
}
