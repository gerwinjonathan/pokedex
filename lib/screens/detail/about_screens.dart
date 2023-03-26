import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:stocks/controller/detail/detail_controller.dart';
import 'package:stocks/services/common/common_services.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen(
      {super.key,
      this.aboutTitle,
      this.baseHappiness,
      this.captureRate,
      this.height,
      this.weight,
      this.color});
  String? aboutTitle;
  double? baseHappiness;
  double? captureRate;
  double? baseExperiences;
  double? height;
  double? weight;
  String? color;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(
      padding: const EdgeInsets.all(16),
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        Text(
          "About",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: 10,
          width: 10,
        ),
        Text(
          "Profile",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 10,
          width: 10,
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: Row(
            children: <Widget>[
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: CommonServices().getColorStatus(color ?? ""),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Height",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          height.toString(),
                          style: Theme.of(context).textTheme.headlineSmall,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ), //SizedBox
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: CommonServices().getColorStatus(color ?? ""),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Weight",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          weight.toString(),
                          style: Theme.of(context).textTheme.headlineSmall,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ), //Row
        ),
        const SizedBox(
          height: 10,
          width: 10,
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: Row(
            children: <Widget>[
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: CommonServices().getColorStatus(color ?? ""),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Base Happiness",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          baseHappiness.toString(),
                          style: Theme.of(context).textTheme.headlineSmall,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ), //SizedBox
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: CommonServices().getColorStatus(color ?? ""),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Capture Rate",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          captureRate.toString(),
                          style: Theme.of(context).textTheme.headlineSmall,
                          textAlign: TextAlign.right,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ), //Row
        ),
        const SizedBox(
          height: 10,
          width: 10,
        ),
        Text(
          "Story",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(aboutTitle!),
        const SizedBox(
          height: 10,
          width: 10,
        ),
      ],
    ));
  }
}
