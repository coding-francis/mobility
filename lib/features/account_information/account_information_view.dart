import 'package:dynamic_multi_step_form/dynamic_multi_step_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:pmc_main/Utils/app_colors.dart';

import '../../core/box_manager.dart';
import '../../models/user_model.dart';
import '../../utils/app_dialogs.dart';
import '../../widgets/main_menu_drawer.dart';
import '../authentication/providers/auth_provider.dart';
import '../favorites/views/favorite_view.dart';
import 'account_settings_view.dart';

class MenuItem {
  final Function() onPressed;
  final IconData icon;
  final String label;

  MenuItem({required this.icon, required this.label, required this.onPressed});
}

class AccountInformationView extends ConsumerStatefulWidget {
  const AccountInformationView({super.key});

  @override
  ConsumerState<AccountInformationView> createState() =>
      _AccountInformationViewState();
}

class _AccountInformationViewState extends ConsumerState<AccountInformationView>
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
    final provider = ref.read(authProvider.notifier);

    final List<MenuItem> menuItems = [
      MenuItem(
        icon: Icons.favorite,
        label: "Favorites",
        onPressed: () {
          Get.to(() => const FavoritePropertyView());
        },
      ),
      MenuItem(
        icon: Icons.edit,
        label: "Edit Profile",
        onPressed: () {
          Get.to(() => const AccountSettingsView());
        },
      ),
      MenuItem(
        icon: Icons.support_agent,
        label: "Help & Support",
        onPressed: () {},
      ),
      MenuItem(
        icon: Icons.settings,
        label: "Settings",
        onPressed: () {},
      ),
      MenuItem(
        icon: Icons.logout,
        label: "Logout",
        onPressed: () {},
      ),
    ];

    UserModel? user = BoxManager().getUser();
    return Scaffold(
      appBar: AppBar(
        // title: Text('Account Information'),
        backgroundColor: AppColors.defaultColor,
        actions: [
          IconButton(
            onPressed: () async {
              await AppDialogs.logoutDialog(provider.logout);
            },
            icon: const Icon(
              IconlyBroken.logout,
              color: Colors.redAccent,
            ),
          ),
          Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
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
      endDrawer: const CustomMainDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 10.0,
                          ),
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: AppColors.defaultColor,
                            child: Text(
                              "${user?.firstName[0].toUpperCase()}${user?.lastName[0].toUpperCase()}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            "${user?.firstName} ${user?.middleName ?? ' '}${user?.lastName}",
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            user?.emailAddress ?? '',
                            style: const TextStyle(fontSize: 15),
                          ),
                          Row(
                            children: [
                              Text(
                                user?.phoneNumber ?? '',
                                style: const TextStyle(fontSize: 15),
                              ),
                              const SizedBox(width: 5.0),
                              user!.isUserVerified
                                  ? const SizedBox()
                                  : InkWell(
                                      onTap: () {
                                        debugPrint("initialize verify phone");
                                        provider.verifyPhoneNumber();
                                      },
                                      child: const Text(
                                        'verify',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    )
                            ],
                          ),
                          const SizedBox(height: 20.0),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Favorites",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 180.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: 170.0,
                        height: 180.0,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              height: 100,
                              width: double.infinity,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                // Adjust the radius as needed
                                child: Image.network(
                                  "https://images.adsttc.com/media/images/5da1/c12e/3312/fd49/8d00/01f1/newsletter/210.jpg?1570881829",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Property ${index + 1}"),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            IconlyBold.star,
                                            color: AppColors.secondaryColor,
                                            size: 20,
                                          ),
                                          Text("4.$index")
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 5.0,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            IconlyBold.location,
                                            color: AppColors.defaultColor,
                                            size: 20,
                                          ),
                                          const Text("location")
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  itemBuilder: (context, index) => ListTile(
                    title: Text(menuItems[index].label),
                    contentPadding: EdgeInsets.zero,
                    trailing: const Icon(IconlyLight.arrowRight2),
                    leading: Icon(menuItems[index].icon),
                    onTap: menuItems[index].onPressed,
                  ),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: menuItems.length,
                  physics: const NeverScrollableScrollPhysics(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
