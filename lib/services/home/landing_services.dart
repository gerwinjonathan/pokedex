import 'package:get/get.dart';
import 'package:stocks/config/constant.dart';
import 'package:stocks/model/common/paging.dart';
import 'package:stocks/services/common/base_services.dart';
import 'package:stocks/model/types/types.dart';

class LandingServices extends GetxService with BaseServices {
  final String urlType = "${UrlConstant.POKE_URL}/type";
  final String urlPokemon = "${UrlConstant.POKE_URL}/pokemon/";
  final String urlPokemonGenerations = "${UrlConstant.POKE_URL}/generation/";

  getPokeType() async {
    final response = await getService(urlType);
    if (response != null) {
      return response;
    }
  }

  getPokemonCreature(
      {int pageLimit = PagingInfoConstant.PAGING_LIMIT,
      int offsetLimit = PagingInfoConstant.OFFSET_LIMIT}) async {
    String param = "?limit=$pageLimit&offset=$offsetLimit";
    final response = await getService(urlPokemon + param);
    if (response != null) {
      return response;
    }
  }

  getPokemonGenerations() async {
    final response = await getService(urlPokemonGenerations);
    if (response != null) {
      return response;
    }
  }
}
