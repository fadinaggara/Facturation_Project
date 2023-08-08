import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:last/models/Client.dart';
import 'package:last/same.dart';

class Diagram extends StatefulWidget {
  List<ClientModel>? clients;

  Diagram({Key? key, required this.clients}) : super(key: key);

  @override
  State<Diagram> createState() => _DiagramState();
}

class _DiagramState extends State<Diagram> {
  int i = 0;
  List<BarChartModel> data = [];
  double? g=0;

  @override
  void initState() {
    super.initState();

    if (widget.clients != null) {
      widget.clients!.sort((a, b) => b.chiffreAffaire!.compareTo(a.chiffreAffaire!));

      for (var e in widget.clients!) {
        if (i < 5 && e.chiff != null) {
          g = double.parse(e.chiff!);
          data.add(BarChartModel(
            name: e.prenom!.replaceFirst(e.prenom![i], e.prenom![i].toUpperCase()),
            financial: g!,
          ));
          i++;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final Size size = mediaQuery.size;
    String title = 'Top 10 Clients';
    List<charts.Series<BarChartModel, String>> series = [
      charts.Series(
        id: "Financial",
        data: data.reversed.toList(),
        domainFn: (BarChartModel series, _) => series.name,
        measureFn: (BarChartModel series, _) => series.financial ?? 0.0,
        colorFn: (BarChartModel series, _) => series.color,
        labelAccessorFn: ((BarChartModel b, _) => '\$${b.financial.toString()}'),
      ),
    ];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 15.0, // soften the shadow
              spreadRadius: 5.0, //extend the shadow
              offset: Offset(
                5.0, // Move to right 5  horizontally
                5.0, // Move to bottom 5 Vertically
              ),
            )
          ],
        ),
        alignment: Alignment.center,
        width: size.width * 1,
        height: size.height * 0.5,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: Stack(
          children: [
            charts.BarChart(
              domainAxis: const charts.OrdinalAxisSpec(),
              series,
              animate: true,
            ),
            Container(alignment: Alignment.topCenter, child: Text(title)),
          ],
        ),
      ),
    );
  }
}
