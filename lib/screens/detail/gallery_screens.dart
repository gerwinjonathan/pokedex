import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stocks/config/constant.dart';
import 'package:stocks/model/sprites/sprites.dart';
import 'package:stocks/model/types/types.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GalleryScreens extends StatelessWidget {
  GalleryScreens({super.key, this.sprites});

  Sprites? sprites;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          Text(
            "Gallery & Sprites",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(
            height: 10,
            width: 10,
          ),
          Text(
            "Front",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 10,
            width: 10,
          ),
          StaggeredGrid.count(
            crossAxisCount: 3,
            children: [
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 1,
                child: Card(
                  elevation: 2,
                  child: CachedNetworkImage(
                    imageUrl: sprites!.front_default ?? "",
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.catching_pokemon),
                  ),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 2,
                child: Card(
                  elevation: 2,
                  child: CachedNetworkImage(
                    imageUrl: sprites!.front_female ?? "",
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.catching_pokemon),
                  ),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Card(
                  elevation: 2,
                  child: CachedNetworkImage(
                    imageUrl: sprites!.front_shiny ?? "",
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.catching_pokemon),
                  ),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Card(
                  elevation: 2,
                  child: CachedNetworkImage(
                    imageUrl: sprites!.front_shiny_female ?? "",
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.catching_pokemon),
                  ),
                ),
              ),
            ],
          ),
          Text(
            "Back",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 10,
            width: 10,
          ),
          StaggeredGrid.count(
            crossAxisCount: 3,
            children: [
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 1,
                child: Card(
                  elevation: 2,
                  child: CachedNetworkImage(
                    imageUrl: sprites!.back_default ?? "",
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.catching_pokemon),
                  ),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 2,
                child: Card(
                  elevation: 2,
                  child: CachedNetworkImage(
                    imageUrl: sprites!.back_female ?? "",
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.catching_pokemon),
                  ),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Card(
                  elevation: 2,
                  child: CachedNetworkImage(
                    imageUrl: sprites!.back_shiny ?? "",
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.catching_pokemon),
                  ),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Card(
                  elevation: 2,
                  child: CachedNetworkImage(
                    imageUrl: sprites!.back_shiny_female ?? "",
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.catching_pokemon),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
