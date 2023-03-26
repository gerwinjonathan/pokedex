import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stocks/config/constant.dart';
import 'package:stocks/config/global_styles.dart';
import 'package:stocks/controller/detail/save_dtl_controller.dart';
import 'package:stocks/controller/landing/landing_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:stocks/screens/detail/detail_screens.dart';
import 'package:stocks/services/common/common_services.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LandingController landingController = Get.put(LandingController());

    return Obx(() => SmartRefresher(
        controller: landingController.refreshController.value,
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(
          waterDropColor: ColorConstant.APP_PRIMARY,
          idleIcon: const Icon(
            Icons.catching_pokemon,
            color: Colors.white,
          ),
          complete: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LottieBuilder.network(
                UrlConstant.SPLASH_SCREEN_URL,
                width: 14,
                height: 14,
              ),
              const SizedBox(
                height: 10,
                width: 10,
              ),
              Text(
                "Pokédex completed. Yahoo!!!",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 14),
              )
            ],
          ),
        ),
        footer: CustomFooter(
          builder: ((context, mode) {
            debugPrint("Mode: $mode");
            if (mode == LoadStatus.idle) {
              return const Center(
                child: Text("That's all folks!"),
              );
            } else if (mode == LoadStatus.loading) {
              return Center(
                child: LottieBuilder.network(
                  UrlConstant.SPLASH_SCREEN_URL,
                  width: 20,
                  height: 20,
                ),
              );
            } else if (mode == LoadStatus.noMore) {
              return const Center(
                child: Text("That's all folks!"),
              );
            } else {
              return Container();
            }
          }),
        ),
        onRefresh: () async {
          await landingController.onRefresh();
          landingController.refreshController.value.refreshCompleted();
        },
        onLoading: () async {
          landingController.refreshController.value.loadComplete();
        },
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
          children: [
            featuredPokemonWidget(context, landingController),
            const SizedBox(
              height: 25,
              width: 25,
            ),
            discoveryPokeGenerationWidget(context, landingController),
            const SizedBox(
              height: 25,
              width: 25,
            ),
            savedPokemonWidget(context, landingController),
            const SizedBox(
              height: 25,
              width: 25,
            ),
          ],
        )));
  }

  featuredPokemonWidget(context, landingController) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Featured Pokemon",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Latest Pokemon Here",
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
              ActionChip(
                labelStyle: Theme.of(context).textTheme.labelSmall,
                label: const Text(
                  "See all",
                ),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(
            height: 10,
            width: 10,
          ),
          SizedBox(
            height: 125,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) => Card(
                      elevation: 2,
                      child: InkWell(
                        onTap: () {
                          Get.to(
                            DetailScreens(
                              title: landingController.listPokemon[index].name
                                  .toString()
                                  .capitalizeFirst!,
                              url: landingController.listPokemon[index].url,
                            ),
                          )!
                              .then((value) async {
                            await landingController.onRefresh();
                          });
                        },
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                child: CachedNetworkImage(
                                  imageUrl: landingController
                                      .listSprites[index].front_default,
                                  width: 75,
                                  height: 75,
                                  errorWidget: (context, url, error) =>
                                      const Icon(
                                          Icons.catching_pokemon_outlined),
                                ),
                              ),
                              Text(
                                landingController.listPokemon[index].name
                                    .toString()
                                    .capitalizeFirst!,
                                maxLines: 3,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                itemCount: landingController.listSprites.length),
          ),
        ],
      ),
    );
  }

  discoveryPokeGenerationWidget(context, landingController) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Discover The Generation",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text.rich(
                    TextSpan(text: "Beyond the", children: [
                      TextSpan(
                          text: " generations of Pokémon",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontWeight: FontWeight.bold))
                    ]),
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
            width: 10,
          ),
          SizedBox(
            height: 140,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        listGenerationCards(
                            context,
                            (landingController.listGenerations.length ~/ 2 * 0 +
                                index),
                            landingController),
                        const SizedBox(
                          height: 10,
                          width: 10,
                        ),
                        listGenerationCards(
                            context,
                            (landingController.listGenerations.length ~/ 2 * 1 +
                                index),
                            landingController),
                      ],
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                itemCount: landingController.listGenerations.length ~/ 2),
          ),
        ],
      ),
    );
  }

  listGenerationCards(context, index, landingController) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: () {},
        child: SizedBox(
          height: 50,
          width: 150,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.catching_pokemon_rounded),
              const SizedBox(
                height: 10,
                width: 10,
              ),
              Text(
                landingController.listGenerations[index].name
                    .toString()
                    .capitalizeFirst!,
                maxLines: 3,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  savedPokemonWidget(context, LandingController landingController) {
    final SaveDtlController saveDtlController = Get.put(SaveDtlController());
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Discover Your Card",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Check your favorite card here",
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
              ActionChip(
                labelStyle: Theme.of(context).textTheme.labelSmall,
                label: const Text(
                  "See all",
                ),
                onPressed: () {},
              )
            ],
          ),
          const SizedBox(
            height: 10,
            width: 10,
          ),
          Obx(
            () => landingController.listFavoritePokemon.value.isNotEmpty
                ? ListView.separated(
                    physics: const ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount:
                        landingController.listFavoritePokemon.value.length,
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (context, index) => ListTile(
                      leading: CircleAvatar(
                        backgroundColor: CommonServices().getColorStatus(
                          landingController
                              .listFavoritePokemon.value[index].color!,
                        ),
                        child: CachedNetworkImage(
                          imageUrl: landingController
                              .listFavoritePokemon.value[index].urlSprites!,
                          errorWidget: (context, url, error) => const Icon(
                            Icons.catching_pokemon,
                          ),
                        ),
                      ),
                      title: Text(
                        landingController
                            .listFavoritePokemon.value[index].name!,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      onTap: () {
                        Get.to(
                          DetailScreens(
                            title: landingController
                                .listFavoritePokemon.value[index].name
                                .toString()
                                .capitalizeFirst!,
                            url: landingController
                                .listFavoritePokemon.value[index].url,
                          ),
                        )!
                            .then(
                          (value) async {
                            await landingController.onRefresh();
                          },
                        );
                      },
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () async {
                          await saveDtlController.unsavePokemon(
                            landingController.listFavoritePokemon.value[index],
                          );
                          await landingController.onRefresh();
                        },
                      ),
                    ),
                    separatorBuilder: (context, index) => const Divider(),
                  )
                : const Center(
                    child: Text(
                      "No favorite, folks!",
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  getAvatar(index) {
    Widget icon = const SizedBox.shrink();
    switch (index) {
      case 2: // flying
        icon = const Icon(Icons.wind_power_outlined);
        break;
      case 3: // poison
        icon = const Icon(Icons.crisis_alert_outlined);
        break;
      case 4: // ground
        icon = const Icon(Icons.park_outlined);
        break;
      case 5: // rock
        icon = const Icon(Icons.rocket_outlined);
        break;
      case 6: // bug
        icon = const Icon(Icons.bug_report_outlined);
        break;
      case 7: // ghost
        icon = const Icon(Icons.person_2_outlined);
        break;
      case 8: // steel
        icon = const Icon(Icons.iron_outlined);
        break;
      case 9: // fire
        icon = const Icon(Icons.fireplace_outlined);
        break;
      case 10: // water
        icon = const Icon(Icons.water_drop_outlined);
        break;
      case 11: // grass
        icon = const Icon(Icons.grass_outlined);
        break;
      case 12:
        icon = const Icon(Icons.thunderstorm_outlined);
        break; // electric
      case 13:
        icon = const Icon(Icons.person_3_outlined);
        break; // physics
      case 14:
        icon = const Icon(Icons.icecream_outlined);
        break; // iceon
      case 16:
        icon = const Icon(Icons.dark_mode_outlined);
        break; // dark
      default:
        icon = const Icon(Icons.catching_pokemon_outlined);
    }

    return icon;
  }
}
