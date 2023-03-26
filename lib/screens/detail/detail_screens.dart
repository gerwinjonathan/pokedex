import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stocks/controller/detail/detail_controller.dart';
import 'package:stocks/controller/detail/save_dtl_controller.dart';
import 'package:stocks/model/types/types.dart';
import 'package:stocks/screens/detail/about_screens.dart';
import 'package:stocks/screens/detail/gallery_screens.dart';
import 'package:stocks/screens/detail/location_screens.dart';
import 'package:stocks/screens/detail/more_poke_screens.dart';
import 'package:stocks/screens/detail/stats_screens.dart';
import 'package:stocks/services/common/common_services.dart';

class DetailScreens extends StatefulWidget {
  DetailScreens({super.key, this.title, this.url});

  String? title;
  String? url;

  @override
  DetailStateScreens createState() => DetailStateScreens();
}

class DetailStateScreens extends State<DetailScreens>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  DetailController? detailController;
  SaveDtlController? saveDtlController;
  TypesHive? types;
  bool? exists;

  @override
  void initState() {
    controller = TabController(length: 5, vsync: this);
    detailController = Get.put(DetailController());
    detailController!.setUrl(widget.url!);
    detailController!.getData();
    detailController!.setNamePokemon(widget.title!.toLowerCase());
    saveDtlController = Get.put(SaveDtlController());

    types = TypesHive(
      name: widget.title,
      url: widget.url,
      urlSprites: detailController!.sprites.value.front_default,
      color: detailController!.color.value.name,
    );
    saveDtlController!.checkIfExists(types!);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = 200;
    return SafeArea(
        child: Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              titleTextStyle: const TextStyle(
                color: Colors.black,
              ),
              actions: [
                Obx(
                  () => IconButton(
                    onPressed: () async {
                      if (saveDtlController!.exists.value) {
                        saveDtlController!.unsavePokemon(types!);
                      } else {
                        types = TypesHive(
                          name: widget.title,
                          url: widget.url,
                          urlSprites:
                              detailController!.sprites.value.front_default,
                          color: detailController!.color.value.name,
                        );
                        saveDtlController!.savePokemon(types!);
                      }
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: saveDtlController!.exists.value
                          ? Colors.red
                          : Colors.black,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.smart_screen_outlined,
                    color: Colors.black,
                  ),
                )
              ],
              title: Text(
                widget.title!,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              floating: false,
              pinned: true,
              snap: false,
              expandedHeight: height,
              bottom: TabBar(
                isScrollable: true,
                splashFactory: NoSplash.splashFactory,
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.gamepad_outlined),
                        SizedBox(
                          height: 5,
                          width: 5,
                        ),
                        Text("About")
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.area_chart_outlined),
                        SizedBox(
                          height: 5,
                          width: 5,
                        ),
                        Text("Stats")
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.location_on_outlined),
                        SizedBox(
                          height: 5,
                          width: 5,
                        ),
                        Text("Location & Encounters")
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.browse_gallery_outlined),
                        SizedBox(
                          height: 5,
                          width: 5,
                        ),
                        Text("Gallery & Sprites")
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.menu_outlined),
                        SizedBox(
                          height: 5,
                          width: 5,
                        ),
                        Text("Others")
                      ],
                    ),
                  ),
                ],
                labelPadding: const EdgeInsets.symmetric(horizontal: 30),
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.white),
                indicatorColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                controller: controller,
                indicatorPadding: const EdgeInsets.all(10),
              ),
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Obx(
                      () {
                        return detailController!.isLoading.value
                            ? SizedBox(
                                height: height,
                                width: double.infinity,
                                child:
                                    const Icon(Icons.catching_pokemon_outlined),
                              )
                            : Container(
                                height: height,
                                width: double.infinity,
                                color: CommonServices().getColorStatus(
                                    detailController!.color.value.name!),
                                child: Image.network(detailController!
                                    .sprites.value.front_default!),
                              );
                      },
                    ),
                  ],
                ),
              ),
            )
          ];
        },
        body: TabBarView(
          controller: controller,
          children: [
            Obx(
              () => AboutScreen(
                aboutTitle: detailController!.about.value,
                baseHappiness: detailController!.baseHappiness.value,
                captureRate: detailController!.captureRate.value,
                weight: detailController!.weight.value,
                height: detailController!.height.value,
                color: detailController!.color.value.name,
              ),
            ),
            Obx(
              () => StatsScreens(
                listStats: detailController!.stats.value,
                listAbilities: detailController!.ability.value,
                listMoves: detailController!.moves.value,
                listTypes: detailController!.types.value,
                listEggGroups: detailController!.eggGroups.value,
                shapes: detailController!.shapes.value,
              ),
            ),
            Obx(
              () => LocationScreens(
                listLocations: detailController!.location.value,
                habitat: detailController!.habitat.value,
                generation: detailController!.generation.value,
              ),
            ),
            Obx(
              () => GalleryScreens(
                sprites: detailController!.sprites.value,
              ),
            ),
            const MorePokeScreens(),
          ],
        ),
      ),
    ));
  }
}
