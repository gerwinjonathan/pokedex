import 'package:get/get.dart';
import 'package:stocks/config/constant.dart';
import 'package:stocks/services/common/base_services.dart';

class DetailPokeServices extends GetxService with BaseServices {
  getDetailPokemon(String poke) async {
    String URL = "${UrlConstant.POKE_URL}/pokemon/$poke/";
    final response = await getService(URL);
    if (response != null) {
      return response;
    }
  }

  getDetailPokemonCreature(String url) async {
    final response = await getService(url);
    if (response != null) {
      return response;
    }
  }

  getDetailSpecies(String url) async {
    final response = await getService(url);
    if (response != null) {
      return response;
    }
  }

  getDetailPokemonLocation(String pokeCreature) async {
    final String URL =
        "${UrlConstant.POKE_URL}/pokemon/$pokeCreature/encounters";
    final response = await getService(URL);
    if (response != null) {
      return response;
    }
  }
}
