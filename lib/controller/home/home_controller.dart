import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stocks/model/common/paging.dart';
import 'package:stocks/model/types/types.dart';
import 'package:stocks/services/home/landing_services.dart';
import 'package:stocks/utils/shared_pref_utils.dart';

class HomeController extends GetxController {
  var tabIndex = 0.obs;

  Paging paging = const Paging();
  List<Types>? listTypes = <Types>[].obs;

  Rx<SharedPrefUtils> sharedPrefUtils = SharedPrefUtils().obs;
  var isDarkMode = false.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  getPokeType() async {
    final response = await LandingServices().getPokeType();
    if (response != null) {
      paging = Paging.fromJson(response);
      listTypes?.addAll((response["results"] as List)
          .map((item) => Types.fromJson(item))
          .toList());
    }
  }

  void changeDarkMode() {
    if (isDarkMode.value) {
      sharedPrefUtils.value.setDarkMode(false);
    } else {
      sharedPrefUtils.value.setDarkMode(true);
    }

    getDarkMode();
  }

  void getDarkMode() {
    sharedPrefUtils.value.getDarkMode().then((value) {
      isDarkMode.value = value;
    });
  }

  @override
  void onInit() {
    getPokeType();
    getDarkMode();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
