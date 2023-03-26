import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stocks/config/constant.dart';
import 'package:stocks/config/global_styles.dart';
import 'package:stocks/model/types/types.dart';
import 'package:stocks/screens/home/home_screens.dart';
import 'package:stocks/screens/splash_screens.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:stocks/utils/shared_pref_utils.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await initDb();
  runApp(const MainApp());
}

initDb() async {
  Hive.registerAdapter(TypesHiveAdapter());
  await Hive.openBox<TypesHive>("pokemonType");
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getDarkTheme();
    startTimer();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        textTheme: GoogleFonts.latoTextTheme(
          TextTheme(bodyLarge: GoogleFonts.montserrat()),
        ),
        primaryColor: ColorConstant.APP_PRIMARY,
        primaryColorLight: ColorConstant.APP_PRIMARY,
        primaryColorDark: ColorConstant.APP_PRIMARY_DARK,
        appBarTheme: AppBarTheme(
          titleTextStyle: GoogleFonts.montserrat(
            textStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        textTheme: GoogleFonts.latoTextTheme(
          TextTheme(
            bodyLarge: GoogleFonts.montserrat(
              color: Colors.white,
            ),
          ).apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
            decorationColor: Colors.white,
          ),
        ),
        primaryColor: Colors.white,
        primaryColorLight: ColorConstant.APP_PRIMARY,
        primaryColorDark: ColorConstant.APP_PRIMARY_DARK,
        primaryIconTheme: const IconThemeData(
          color: Colors.white,
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: GoogleFonts.montserrat(
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.white,
            ),
          ),
        ),
      ),
      builder: (context, child) {
        return ScrollConfiguration(
            behavior: DisableGrowBehavior(), child: child!);
      },
      home: const SafeArea(
        child: Scaffold(
          body: SplashScreens(),
        ),
      ),
    );
  }

  startTimer() {
    Timer(DurationConstant.SPLASH_SCREEN_DURATION, () {
      Get.to(const HomeScreens());
    });
  }

  getDarkTheme() async {
    final result = await SharedPrefUtils().getDarkMode();
    Get.changeThemeMode(result ? ThemeMode.dark : ThemeMode.light);
  }
}

class DisableGrowBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
