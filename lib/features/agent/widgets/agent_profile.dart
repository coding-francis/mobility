import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pmc_main/features/agent/views/agent_details_view.dart';

class AgentProfileListItem extends StatelessWidget {
  final String name;
  final String imageUrl;

  const AgentProfileListItem(
      {super.key, required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => const AgentDetailView());
      },
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
            radius: 40,
          ),
          const SizedBox(height: 4),
          Text(name),
        ],
      ),
    );
  }
}
