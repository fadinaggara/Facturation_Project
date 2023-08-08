import 'package:at_gauges/at_gauges.dart';
import 'package:flutter/material.dart';

class dash extends StatefulWidget {
  const dash({key});

  @override
  State<dash> createState() => _dashState();
}

class _dashState extends State<dash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(50),
              child: Text("Top 20 Clients"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey,width: 2)),
                  height: 200, // set the height of the container
                  child: Container(
                    child: ListView(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Client 1"),
                              SimpleRadialGauge(
                                actualValue: 80,
                                maxValue: 100,
                                minValue: 0,
                                titlePosition: TitlePosition.top,
                                unit: '%',
                                pointerColor: Colors.blue,
                                decimalPlaces: 0,
                                isAnimate: true,
                                animationDuration: 2000,
                                size: 85,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Client 1"),
                              SimpleRadialGauge(
                                actualValue: 80,
                                maxValue: 100,
                                minValue: 0,
                                titlePosition: TitlePosition.top,
                                unit: '%',
                                pointerColor: Colors.green,
                                decimalPlaces: 0,
                                isAnimate: true,
                                animationDuration: 2000,
                                size: 85,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Client 1"),
                              SimpleRadialGauge(
                                actualValue: 80,
                                maxValue: 100,
                                minValue: 0,
                                titlePosition: TitlePosition.top,
                                unit: '%',
                                pointerColor: Colors.blue,
                                decimalPlaces: 0,
                                isAnimate: true,
                                animationDuration: 2000,
                                size: 85,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Client 1"),
                              SimpleRadialGauge(
                                actualValue: 80,
                                maxValue: 100,
                                minValue: 0,
                                titlePosition: TitlePosition.top,
                                unit: '%',
                                pointerColor: Colors.blue,
                                decimalPlaces: 0,
                                isAnimate: true,
                                animationDuration: 2000,
                                size: 85,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ),

            Padding(
              padding: const EdgeInsets.all(50),
              child: Text("Top 10 Article"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey,width: 2)),
                  height: 200, // set the height of the container
                  child: Container(
                    child: ListView(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Client 1"),
                              SimpleRadialGauge(
                                actualValue: 80,
                                maxValue: 100,
                                minValue: 0,
                                titlePosition: TitlePosition.top,
                                unit: '%',
                                pointerColor: Colors.blue,
                                decimalPlaces: 0,
                                isAnimate: true,
                                animationDuration: 2000,
                                size: 85,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Client 1"),
                              SimpleRadialGauge(
                                actualValue: 80,
                                maxValue: 100,
                                minValue: 0,
                                titlePosition: TitlePosition.top,
                                unit: '%',
                                pointerColor: Colors.blue,
                                decimalPlaces: 0,
                                isAnimate: true,
                                animationDuration: 2000,
                                size: 85,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Client 1"),
                              SimpleRadialGauge(
                                actualValue: 80,
                                maxValue: 100,
                                minValue: 0,
                                titlePosition: TitlePosition.top,
                                unit: '%',
                                pointerColor: Colors.blue,
                                decimalPlaces: 0,
                                isAnimate: true,
                                animationDuration: 2000,
                                size: 85,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Client 1"),
                              SimpleRadialGauge(
                                actualValue: 80,
                                maxValue: 100,
                                minValue: 0,
                                titlePosition: TitlePosition.top,
                                unit: '%',
                                pointerColor: Colors.blue,
                                decimalPlaces: 0,
                                isAnimate: true,
                                animationDuration: 2000,
                                size: 85,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(50),
              child: Text("Top 10 Article"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey,width: 2)),
                  height: 200, // set the height of the container
                  child: Container(
                    child: ListView(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Client 1"),
                              SimpleRadialGauge(
                                actualValue: 80,
                                maxValue: 100,
                                minValue: 0,
                                titlePosition: TitlePosition.top,
                                unit: '%',
                                pointerColor: Colors.blue,
                                decimalPlaces: 0,
                                isAnimate: true,
                                animationDuration: 2000,
                                size: 85,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Client 1"),
                              SimpleRadialGauge(
                                actualValue: 80,
                                maxValue: 100,
                                minValue: 0,
                                titlePosition: TitlePosition.top,
                                unit: '%',
                                pointerColor: Colors.blue,
                                decimalPlaces: 0,
                                isAnimate: true,
                                animationDuration: 2000,
                                size: 85,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Client 1"),
                              SimpleRadialGauge(
                                actualValue: 80,
                                maxValue: 100,
                                minValue: 0,
                                titlePosition: TitlePosition.top,
                                unit: '%',
                                pointerColor: Colors.blue,
                                decimalPlaces: 0,
                                isAnimate: true,
                                animationDuration: 2000,
                                size: 85,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Client 1"),
                              SimpleRadialGauge(
                                actualValue: 80,
                                maxValue: 100,
                                minValue: 0,
                                titlePosition: TitlePosition.top,
                                unit: '%',
                                pointerColor: Colors.blue,
                                decimalPlaces: 0,
                                isAnimate: true,
                                animationDuration: 2000,
                                size: 85,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    ));
  }
}
