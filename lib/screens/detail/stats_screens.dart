import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stocks/model/stats/stats.dart';
import 'package:stocks/model/types/types.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatsScreens extends StatelessWidget {
  StatsScreens(
      {super.key,
      this.listStats,
      this.listAbilities,
      this.listMoves,
      this.listTypes,
      this.listEggGroups,
      this.shapes});

  List<Stats>? listStats;
  List<Types>? listAbilities;
  List<Types>? listMoves;
  List<Types>? listTypes;
  List<Types>? listEggGroups;
  Types? shapes;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          Text(
            "Stats",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(
            height: 10,
            width: 10,
          ),
          Text(
            "General",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Card(
            elevation: 2,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                  width: 10,
                ),
                listItem(listStats!.length ~/ 2 * 0),
                const SizedBox(
                  height: 10,
                  width: 10,
                ),
                listItem(listStats!.length ~/ 2 * 1),
                const SizedBox(
                  height: 10,
                  width: 10,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
            width: 10,
          ),
          Text(
            "Stats in Charts",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Card(
            elevation: 2,
            child: SfCircularChart(
              legend: Legend(
                isResponsive: true,
                isVisible: true,
              ),
              series: <CircularSeries>[
                RadialBarSeries<Stats, String>(
                    dataSource: listStats,
                    xValueMapper: (datum, _) => datum.stat!.name,
                    yValueMapper: (datum, _) => datum.base_stat,
                    dataLabelMapper: (datum, _) => datum.stat!.name,
                    legendIconType: LegendIconType.circle)
              ],
            ),
          ),
          const SizedBox(
            height: 10,
            width: 10,
          ),
          Text(
            "Abilities",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              listAbilities!.length,
              (index) => ListTile(
                title: Text(
                  listAbilities![index].name!,
                  maxLines: 4,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios_rounded,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
            width: 10,
          ),
          Text(
            "Moves",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 10,
            width: 10,
          ),
          GridView.count(
            crossAxisCount: 5,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            children: List.generate(
              listMoves!.length,
              (index) => Card(
                elevation: 2,
                child: Center(
                  child: Text(
                    listMoves![index].name!,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
            width: 10,
          ),
          Text(
            "Types",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 10,
            width: 10,
          ),
          Row(
            children: List.generate(
              listTypes!.length,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Chip(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  label: Text(
                    listTypes![index].name!,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
            width: 10,
          ),
          Text(
            "Egg Groups",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 10,
            width: 10,
          ),
          Row(
            children: List.generate(
              listEggGroups!.length,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Chip(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  label: Text(
                    listEggGroups![index].name!,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
            width: 10,
          ),
          Text(
            "Shapes",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 10,
            width: 10,
          ),
          Row(children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Chip(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                label: Text(shapes!.name!),
              ),
            ),
          ]),
        ],
      ),
    );
  }

  listItem(indexDivison) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
          3,
          (index) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      avatar(indexDivison + index),
                      Text(listStats![indexDivison + index]
                          .base_stat
                          .toString()),
                    ],
                  ),
                  Text(listStats![indexDivison + index]
                      .stat!
                      .name!
                      .capitalizeFirst!),
                ],
              )),
    );
  }

  avatar(index) {
    var icon;
    switch (index) {
      case 0:
        icon = const Icon(Icons.bolt_outlined);
        break;
      case 1:
        icon = const Icon(Icons.power_input_outlined);
        break;
      case 2:
        icon = const Icon(Icons.shield_outlined);
        break;
      case 3:
        icon = const Icon(Icons.power_input_sharp);
        break;
      case 4:
        icon = const Icon(Icons.shield_sharp);
        break;
      case 5:
        icon = const Icon(Icons.speed_outlined);
        break;
      default:
        icon = const Icon(Icons.catching_pokemon);
        break;
    }
    return icon;
  }
}
