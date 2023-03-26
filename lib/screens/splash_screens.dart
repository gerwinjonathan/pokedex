import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stocks/config/constant.dart';

class SplashScreens extends StatelessWidget {
  const SplashScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LottieBuilder.network(
        UrlConstant.SPLASH_SCREEN_URL,
        width: 100,
        height: 100,
      ),
    );
  }
}
