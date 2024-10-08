import 'package:dynamic_multi_step_form/dynamic_multi_step_form.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:pmc_main/utils/app_colors.dart';
import 'package:pmc_main/widgets/custom_outline_button.dart';

class MapViewDrawer extends ConsumerStatefulWidget {
  const MapViewDrawer({super.key});

  @override
  ConsumerState<MapViewDrawer> createState() => _MapViewDrawerState();
}

class _MapViewDrawerState extends ConsumerState<MapViewDrawer> {
  RangeValues _currentRangeValues = const RangeValues(0, 100000);

  final List<bool> _filterValues = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.defaultColor,
            ),
            child: const Center(
              child: Text(
                'Filters',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Property Category',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            title: const Text('Apartments'),
            leading: Checkbox(
              value: _filterValues[0],
              onChanged: (bool? value) {
                setState(() {
                  _filterValues[0] = value!;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Stores'),
            leading: Checkbox(
              value: _filterValues[1],
              onChanged: (bool? value) {
                setState(() {
                  _filterValues[1] = value!;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Warehouses'),
            leading: Checkbox(
              value: _filterValues[2],
              onChanged: (bool? value) {
                setState(() {
                  _filterValues[2] = value!;
                });
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Listing type',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            title: const Text('Rent'),
            leading: Checkbox(
              value: _filterValues[3],
              onChanged: (bool? value) {
                setState(() {
                  _filterValues[3] = value!;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Sale'),
            leading: Checkbox(
              value: _filterValues[4],
              onChanged: (bool? value) {
                setState(() {
                  _filterValues[4] = value!;
                });
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Price Range',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Min: GH\u20B5 ${_currentRangeValues.start.toPrecision(2)}',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  'Max: GH\u20B5 ${_currentRangeValues.end.toPrecision(2)}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          RangeSlider(
            values: _currentRangeValues,
            min: 0,
            max: 100000,
            divisions: 10,
            labels: RangeLabels(
              _currentRangeValues.start.round().toString(),
              _currentRangeValues.end.round().toString(),
            ),
            onChanged: (RangeValues values) {
              setState(() {
                _currentRangeValues = values;
              });
            },
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CustomOutlineButton(
              onPressed: () {},
              radius: 20,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(IconlyBold.filter),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text("Apply filter"),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
