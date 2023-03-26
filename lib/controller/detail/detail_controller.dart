import 'package:get/get.dart';
import 'package:stocks/model/pokemon/pokemon_detail.dart';
import 'package:stocks/model/sprites/sprites.dart';
import 'package:stocks/model/stats/stat.dart';
import 'package:stocks/model/stats/stats.dart';
import 'package:stocks/model/types/types.dart';
import 'package:stocks/services/detail/detail_poke_services.dart';

class DetailController extends GetxController {
  var test = 0.obs;
  var url = "".obs;

  var species = const Types().obs;
  var color = const Types().obs;
  var sprites = const Sprites().obs;
  var isLoading = false.obs;

  var about = "".obs;
  var _aboutTemp = "";
  var lang = const Types().obs;

  var stats = <Stats>[].obs;
  var location = <Types>[].obs;

  var name = "".obs;
  var habitat = Types().obs;
  var generation = Types().obs;
  var growthRate = Types().obs;
  var eggGroups = <Types>[].obs;

  var baseHappiness = (0.0).obs;
  var captureRate = (0.0).obs;
  var height = (0.0).obs;
  var weight = (0.0).obs;

  var ability = <Types>[].obs;
  var moves = <Types>[].obs;
  var types = <Types>[].obs;
  var shapes = Types().obs;

  getData() async {
    isLoading.value = true;

    await getDetailPokemonCreature();
    await getDetailPokemonSpecies();
    getDetailPokemonLocation(name.value);
    getDetailPokemon(name.value);

    isLoading.value = false;
  }

  getDetailPokemon(String poke) async {
    final response = await DetailPokeServices().getDetailPokemon(poke);
    if (response != null) {
      weight.value = response["weight"];
      height.value = response["height"];
      ability.value = [];
      moves.value = [];
      types.value = [];

      for (int i = 0; i < response["abilities"].length; i++) {
        ability.value.add(Types.fromJson(response["abilities"][i]["ability"]));
      }

      for (int j = 0; j < response["moves"].length; j++) {
        moves.value.add(Types.fromJson(response["moves"][j]["move"]));
      }

      for (int k = 0; k < response["types"].length; k++) {
        types.value.add(Types.fromJson(response["types"][k]["type"]));
      }
    }
  }

  getDetailPokemonCreature() async {
    final response =
        await DetailPokeServices().getDetailPokemonCreature(url.value);
    if (response != null) {
      species.value = Types.fromJson(response["species"]);
      sprites.value = Sprites.fromJson(response["sprites"]);
      stats.value.addAll(List.generate(response["stats"].length,
          (index) => Stats.fromJson(response["stats"][index])));

      await setUrl(species.value.url!);
    }
  }

  getDetailPokemonSpecies() async {
    final response = await DetailPokeServices().getDetailSpecies(url.value);
    if (response != null) {
      color.value = Types.fromJson(response["color"]);
      baseHappiness.value = response["base_happiness"];
      captureRate.value = response["capture_rate"];

      for (int i = 0; i < response["flavor_text_entries"].length; i++) {
        lang.value =
            Types.fromJson(response["flavor_text_entries"][i]["language"]);

        if (lang.value.name == "en") {
          _aboutTemp += response["flavor_text_entries"][i]["flavor_text"];
        }
      }

      about.value = _aboutTemp;
      habitat.value = Types.fromJson(response["habitat"]);
      generation.value = Types.fromJson(response["generation"]);

      eggGroups.value = [];
      for (int j = 0; j < response["egg_groups"].length; j++) {
        eggGroups.add(Types.fromJson(response["egg_groups"][j]));
      }
      growthRate.value = Types.fromJson(response["growth_rate"]);
      shapes.value = Types.fromJson(response["shape"]);
    }
  }

  getDetailPokemonLocation(String pokemonCreature) async {
    final response = await DetailPokeServices()
        .getDetailPokemonLocation(pokemonCreature.toLowerCase());
    if (response != null) {
      location.value = [];
      for (int i = 0; i < response.length; i++) {
        location.value.add(Types.fromJson(response[i]["location_area"]));
      }
    }
  }

  setUrl(String input) {
    url.value = input;
  }

  setNamePokemon(String input) {
    name.value = input;
  }
}
