import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class MyChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chart Widget'),
      ),
      body: Center(
        child: charts.BarChart(
          _createSampleData(),
          animate: true,
        ),
      ),
    );
  }

  List<charts.Series<Resault, String>> _createSampleData() {
    final data = [
      Resault('Jan', 5, 10),
      Resault('Feb', 25, 15),
      Resault('Mar', 100, 20),
      Resault('Apr', 75, 25),
      Resault('May', 10, 30),
    ];

    return [
      charts.Series<Resault, String>(
        id: 'Sales 1',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (Resault sales, _) => sales.dimenssion,
        measureFn: (Resault sales, _) => sales.old_ratio,
        data: data,
      ),
      charts.Series<Resault, String>(
        id: 'Sales 2',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (Resault sales, _) => sales.dimenssion,
        measureFn: (Resault sales, _) => sales.new_ratio,
        data: data,
      ),
    ];
  }
}

class Resault {
  final String dimenssion;
  final int old_ratio;
  final int new_ratio;

  Resault(this.dimenssion, this.old_ratio, this.new_ratio);
}