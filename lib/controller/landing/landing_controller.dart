import 'dart:math';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stocks/model/common/paging.dart';
import 'package:stocks/model/pokemon/pokemon_detail.dart';
import 'package:stocks/model/sprites/sprites.dart';
import 'package:stocks/model/types/types.dart';
import 'package:stocks/services/detail/detail_poke_services.dart';
import 'package:stocks/services/home/landing_services.dart';

class LandingController extends GetxController {
  var refreshController = RefreshController(initialRefresh: false).obs;
  var selectedChipTypeIdx = 0.obs;

  Paging paging = const Paging();
  List<Types>? listTypes = <Types>[].obs;
  List<Types>? listPokemon = <Types>[].obs;
  List<PokemonDetail>? listPokemonDetail = <PokemonDetail>[].obs;
  List<Sprites>? listSprites = <Sprites>[].obs;
  List<Types>? listGenerations = <Types>[].obs;
  var listFavoritePokemon = <TypesHive>[].obs;

  @override
  void onInit() {
    getPokeType();
    getPokemonCreature();
    getPokemonGenerations();
    getFavoritePokemon();
    super.onInit();
  }

  getPokeType() async {
    final response = await LandingServices().getPokeType();
    if (response != null) {
      listTypes = [];
      paging = Paging.fromJson(response);
      listTypes?.addAll((response["results"] as List)
          .map((item) => Types.fromJson(item))
          .toList());
    }
  }

  getPokemonCreature() async {
    int offsetLimit = Random().nextInt(90) + 10;
    final response =
        await LandingServices().getPokemonCreature(offsetLimit: offsetLimit);
    if (response != null) {
      listPokemon = [];
      listPokemonDetail = [];
      paging = Paging.fromJson(response);
      listPokemon?.addAll((response["results"] as List)
          .map((item) => Types.fromJson(item))
          .toList());

      for (Types type in listPokemon!) {
        final res =
            await DetailPokeServices().getDetailPokemonCreature(type.url!);
        if (res != null) {
          listSprites?.add(Sprites.fromJson(res["sprites"]));
        }
      }
    }
  }

  getPokemonGenerations() async {
    final response = await LandingServices().getPokemonGenerations();
    if (response != null) {
      listGenerations = [];
      listGenerations?.addAll((response["results"] as List)
          .map((item) => Types.fromJson(item))
          .toList());
    }
  }

  getFavoritePokemon() async {
    listFavoritePokemon.value = [];
    Box<TypesHive> pokeBaseDb = await Hive.openBox<TypesHive>("pokemonType");
    for (int i = 0; i < pokeBaseDb.length; i++) {
      TypesHive th = pokeBaseDb.getAt(i) ?? TypesHive();
      listFavoritePokemon.value.add(th);
    }
  }

  onRefresh() async {
    await getFavoritePokemon();
  }
}
