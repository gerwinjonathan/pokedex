import 'dart:html';

import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stocks/components/common/appbar/common_appbar_widget.dart';
import 'package:stocks/components/common/bottomnav/bottom_navhome_widget.dart';
import 'package:stocks/controller/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:stocks/screens/landing/landing_screens.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  HomeStateScreens createState() => HomeStateScreens();
}

class HomeStateScreens extends State<HomeScreens> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CommonAppBarWidget(
            title: "Pokédex",
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                onPressed: getProfilePokedex,
                icon: const Icon(Icons.person_4_outlined),
              ),
              Obx(
                () => IconButton(
                  onPressed: () {
                    homeController.changeDarkMode();
                    Get.changeThemeMode(homeController.isDarkMode.value
                        ? ThemeMode.dark
                        : ThemeMode.light);
                  },
                  icon: homeController.isDarkMode.value
                      ? const Icon(Icons.wb_sunny_outlined)
                      : const Icon(Icons.dark_mode_outlined),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu_outlined),
              ),
            ],
          ),
        ),
        body: Obx(() => IndexedStack(
              index: homeController.tabIndex.value,
              children: const [
                LandingScreen(),
              ],
            )),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
              currentIndex: homeController.tabIndex.value,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.catching_pokemon_outlined),
                    label: "Home",
                    activeIcon: Icon(
                      Icons.catching_pokemon,
                    )),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.games_outlined,
                    ),
                    label: "All Pokemon",
                    activeIcon: Icon(
                      Icons.games,
                    )),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.star_outline,
                    ),
                    label: "Favorite",
                    activeIcon: Icon(
                      Icons.star,
                    )),
              ],
              onTap: homeController.changeTabIndex,
            )),
      ),
    );
  }

  getProfilePokedex() {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        context: context,
        builder: (context) => Container(
              padding: const EdgeInsets.all(16),
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.55),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "About Apps",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                      width: 10,
                    ),
                    Text(
                      "Pokédex v1.0.0 Alpha",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(
                      height: 15,
                      width: 15,
                    ),
                    Text(
                      "Pokédex v1.0.0 is an educational app. The purpose of this app is making such a Pokédex library using mobile frameworks. Our app is made by Flutter with libraries.",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    const SizedBox(
                      height: 10,
                      width: 10,
                    ),
                    Text(
                      "Pokédex v1.0.0 features:",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    Text(
                      "- Initial Apps",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    Text(
                      "- Connect to API Pokédex",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    Text(
                      "- Local Pokédex Database",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    const SizedBox(
                      height: 20,
                      width: 20,
                    ),
                    Text.rich(
                      TextSpan(
                          text: "If you have idea or anything, ",
                          children: [
                            TextSpan(
                                text:
                                    "please kindly support us at my contact: ",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(fontWeight: FontWeight.bold))
                          ]),
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    const SizedBox(
                      height: 15,
                      width: 15,
                    ),
                    Text(
                      "gerwinjonathan97@gmail.com",
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Instagram: @gerwinjonathan",
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Linkedin: Gerwin Jonathan Henri",
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ));
  }
}
