import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchLocation extends ConsumerStatefulWidget {
  const SearchLocation({super.key});

  @override
  ConsumerState<SearchLocation> createState() => _SearchLocationState();
}

class _SearchLocationState extends ConsumerState<SearchLocation> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      decoration: const InputDecoration(
        hintText: 'Search location...',
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
        focusedBorder: InputBorder.none,
      ),
    );
  }
}
