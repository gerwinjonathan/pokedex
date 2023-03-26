import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:stocks/model/types/types.dart';

class LocationScreens extends StatelessWidget {
  LocationScreens(
      {super.key, this.listLocations, this.habitat, this.generation});
  List<Types>? listLocations;
  Types? habitat;
  Types? generation;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          Text(
            "Location",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(
            height: 10,
            width: 10,
          ),
          Text(
            "Locations",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Column(
            children: List.generate(listLocations!.length, (index) {
              return Card(
                margin: const EdgeInsets.all(5),
                elevation: 2,
                child: Row(
                  children: [
                    const Icon(Icons.map),
                    const SizedBox(
                      height: 10,
                      width: 10,
                    ),
                    Text(
                      listLocations![index].name!,
                      maxLines: 3,
                      overflow: TextOverflow.fade,
                    )
                  ],
                ),
              );
            }),
          ),
          const SizedBox(
            height: 10,
            width: 10,
          ),
          Text(
            "Habitats",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 10,
            width: 10,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ActionChip(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  label: Text(
                    habitat!.name!,
                  ),
                  onPressed: () {},
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
            width: 10,
          ),
          Text(
            "Appearance",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 10,
            width: 10,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ActionChip(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  label: Text(
                    generation!.name!,
                  ),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
