import 'dart:convert';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stocks/model/types/types.dart';

class SaveDtlController extends GetxController {
  var exists = false.obs;

  savePokemon(TypesHive types) async {
    Box<TypesHive> box = await Hive.openBox<TypesHive>("pokemonType");
    await box.add(types);
    exists.value = true;
    Hive.close();
  }

  unsavePokemon(TypesHive types) {
    types.delete();
    exists.value = false;
  }

  checkIfExists(TypesHive types) async {
    Box<TypesHive> box = await Hive.openBox<TypesHive>("pokemonType");
    for (int i = 0; i < box.length; i++) {
      TypesHive? temp = box.getAt(i);
      if (types.name == temp?.name) {
        exists.value = true;
        return true;
      }
    }
    return false;
  }
}
