import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../../../Utils/app_colors.dart';
import '../../property_detail/widgets/send_message_widget.dart';
import '../widgets/pills.dart';

class AgentDetailView extends ConsumerStatefulWidget {
  const AgentDetailView({super.key});

  @override
  ConsumerState<AgentDetailView> createState() => _AgentDetailViewState();
}

class _AgentDetailViewState extends ConsumerState<AgentDetailView> {
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.defaultColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        onPressed: () {
          PropertyDetailWidgets().showSendMessageForm(context);
        },
        child: Icon(
          Icons.message_outlined,
          color: AppColors.secondaryColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: <Widget>[
                      // SizedBox(height: 10.0),
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                          'https://img.freepik.com/free-photo/handsome-bearded-guy-posing-against-white-wall_273609-20597.jpg?size=626&ext=jpg&ga=GA1.1.1224184972.1714953600&semt=sph',
                        ),
                      ),
                      Text(
                        "Agent Zero",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "agent@gmail.com",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: 2.0),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bio",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 8.0,
                ),
                child: Text(
                  "Specialty",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: 4.0,
                    children: [
                      Pill(label: 'Residential Sales'),
                      Pill(label: 'Investment Property'),
                      Pill(label: 'Relocation Service'),
                      Pill(label: 'Buyers Agent'),
                      Pill(label: 'Sellers Agent'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              const ExpansionTile(
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                expandedAlignment: Alignment.centerLeft,
                leading: Icon(Icons.call),
                title: Text('Phone'),
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("+233204920230"),
                  ),
                ],
              ),
              const ExpansionTile(
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                expandedAlignment: Alignment.centerLeft,
                leading: Icon(IconlyBold.location),
                title: Text('Location'),
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text("Address Line 1"),
                        Text("Address Line 2"),
                        Text("Address Line 3"),
                      ],
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                expandedAlignment: Alignment.centerLeft,
                leading: const Icon(Icons.handshake),
                title: const Text('Agency Affiliation'),
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12, width: 2.0),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text('Agency'), Text("Self Employed")],
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text('Agency Type'), Text("- - -")],
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Agency Contact'),
                              Text("+233204920230")
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Website'),
                              Text("mawuli-website.com")
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  )
                ],
              ),
              const SizedBox(height: 80)
            ],
          ),
        ),
      ),
    );
  }
}
