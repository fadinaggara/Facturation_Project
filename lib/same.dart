import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class BarChartModel {
  String name;
  double financial;
  final charts.Color color = charts.ColorUtil.fromDartColor(Color(0xFFFF5400));

  BarChartModel({
    required this.name,
    required this.financial,
  });
}
