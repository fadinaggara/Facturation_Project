import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class BarChartModel {
  String name;
  int financial;
  final charts.Color color = charts.ColorUtil.fromDartColor(Colors.blue);

  BarChartModel({
    required this.name,
    required this.financial,
  });
}
