import 'package:dynamic_multi_step_form/dynamic_multi_step_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:pmc_main/Utils/app_colors.dart';
import 'package:pmc_main/features/property_detail/view/request_tour_view.dart';
import 'package:pmc_main/widgets/custom_filled_button.dart';

import '../../agent/views/landlord_information_view.dart';
import '../widgets/send_message_widget.dart';

class CardItem {
  final IconData icon;
  final String label;

  CardItem({required this.icon, required this.label});
}

class PropertyDetailView extends StatefulWidget {
  const PropertyDetailView({super.key});

  @override
  State<PropertyDetailView> createState() => _PropertyDetailViewState();
}

class _PropertyDetailViewState extends State<PropertyDetailView> {
  final List<CardItem> scrollCardContent = [
    CardItem(icon: Icons.square_foot_outlined, label: '1,500 square ft'),
    CardItem(icon: Icons.bed_outlined, label: '2 Bedroom'),
    CardItem(icon: Icons.house_siding_outlined, label: '1 Balcony'),
    CardItem(icon: Icons.room_preferences_outlined, label: '1 Hall'),
  ];

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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Image.network(
                    "https://nh.rdcpix.com/5990bbf98cd83350ef339ab6bbb7fc71l-f4169637906rd-w2048_h1536.webp",
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
                        onPressed: () {},
                        icon: const Icon(
                          IconlyBroken.heart,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.defaultColor,
                              width: 2,
                            ), // Add a red border
                          ),
                          child: Image.network(
                            "https://nh.rdcpix.com/5990bbf98cd83350ef339ab6bbb7fc71t-f2347025243rd-w2048_h1536.webp",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.defaultColor,
                                  width: 2), // Add a red border
                            ),
                            child: Image.network(
                              "https://nh.rdcpix.com/5990bbf98cd83350ef339ab6bbb7fc71t-f2347025243rd-w2048_h1536.webp",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Text(
                                '+2',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Meridian View',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 20.0,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      Text(
                        "GHC 4,000.00",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Apartment'),
                      Text('For sale'),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: Image.network(
                              "https://i.pinimg.com/736x/93/f4/0e/93f40ec756290812571be534e12bcfe7.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.to(() => const LandLordInformationView());
                                },
                                child: const Text(
                                  "Emmanuel",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              const Text(
                                "Landlord",
                                style: TextStyle(fontWeight: FontWeight.w100),
                              ),
                            ],
                          )
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          PropertyDetailWidgets().showSendMessageForm(context);
                        },
                        icon: const Icon(IconlyBroken.message),
                      )
                    ],
                  ),
                  const Divider(),
                  SizedBox(
                    height: 80.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: scrollCardContent.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            width: 200.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey.shade300,
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    (scrollCardContent[index]).icon,
                                    color: AppColors.secondaryColor,
                                    size: 30.0,
                                  ),
                                  Text(
                                    (scrollCardContent[index]).label,
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Table(
                    border: TableBorder.all(
                      color: Colors.black,
                      width: 1.0,
                      style: BorderStyle.solid,
                    ),
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                            child: Container(
                              height: 40,
                              color: Colors.grey.shade400,
                              child: const Center(child: Text('Room type')),
                            ),
                          ),
                          const TableCell(
                            child: SizedBox(
                              height: 40,
                              child: Center(child: Text('2 Bedrooms')),
                            ),
                          ),
                          TableCell(
                            child: Container(
                              height: 40,
                              color: Colors.grey.shade400,
                              child: const Center(child: Text('Floor')),
                            ),
                          ),
                          const TableCell(
                            child: SizedBox(
                              height: 40,
                              child: Center(child: Text('1st Floor')),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            child: Container(
                              height: 40,
                              color: Colors.grey.shade400,
                              child: const Center(child: Text('No of floors')),
                            ),
                          ),
                          const TableCell(
                            child: SizedBox(
                              height: 40,
                              child: Center(child: Text('2 floors')),
                            ),
                          ),
                          TableCell(
                            child: Container(
                              height: 40,
                              color: Colors.grey.shade400,
                              child: const Center(child: Text('City')),
                            ),
                          ),
                          const TableCell(
                            child: SizedBox(
                              height: 40,
                              child: Center(child: Text('Osu')),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            child: Container(
                              height: 40,
                              color: Colors.grey.shade400,
                              child: const Center(child: Text('Property type')),
                            ),
                          ),
                          const TableCell(
                            child: SizedBox(
                              height: 40,
                              child: Center(child: Text('Flat')),
                            ),
                          ),
                          TableCell(
                            child: Container(
                              height: 40,
                              color: Colors.grey.shade400,
                              child: const Center(child: Text('State')),
                            ),
                          ),
                          const TableCell(
                            child: SizedBox(
                              height: 40,
                              child: Center(child: Text('Accra')),
                            ),
                          ),
                        ],
                      ),
                      // Add more TableRows as needed
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Description",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  const Text(
                    "An open floor plan, landscaped backyard, porcelain flooring, recessed lighting, quartz countertops – buyers who look at this listing know to expect a high-end, move-in ready home. The people who ask to view this home will likely value these amenities and be willing to pay to have a house equipped with them.Highlighting unique home features doesn’t just make clear the value of your listings. It makes it more likely that the right kind of buyers will come to see your properties.",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 100.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            width: 150.0,
                            height: 100.0,
                            color: Colors.blue,
                            child: Center(
                              child: Text("Card ${index + 1}"),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade400,
                          ),
                          padding: const EdgeInsets.all(8),
                          child: const Icon(
                            IconlyBroken.location,
                            size: 35,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Flexible(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "Tema North, Community 4 Opposite Chemu Secondary school",
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 8,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                          color: AppColors.defaultColor,
                          width: 1.0,
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(IconlyBold.location),
                        const SizedBox(
                          width: 10.0,
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: const TextStyle(
                              color: Colors.black,
                              height: 1.5,
                              wordSpacing: 2,
                            ),
                            children: [
                              TextSpan(
                                text: '2.5km',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.defaultColor,
                                ),
                              ),
                              const TextSpan(
                                text: ' from your location',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.network(
                        'https://www.google.com/maps/d/thumbnail?mid=1ToP_DSgxJJEOn6XyjHMLlREtYC4&hl=en',
                        fit: BoxFit.cover, // Fill the entire width
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: CustomFilledButton(
          radius: 15.0,
          onPressed: () {
            Get.to(() => const RequestTourView());
          },
          child: const Text(
            "Request tour",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
