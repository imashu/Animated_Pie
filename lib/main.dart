import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class Sales {
  int year;
  int sales;
  charts.Color color;
  Sales(this.year, this.sales, this.color);
}

class _State extends State<MyApp> {
  List<Sales> _data = [];
  List<charts.Series<Sales, int>> _chartdata = [];

  void _makeData() {
    _chartdata = <charts.Series<Sales, int>>[];
    _data = <Sales>[
      Sales(0, 100, charts.MaterialPalette.red.shadeDefault),
      Sales(1, 75, charts.MaterialPalette.blue.shadeDefault),
      Sales(2, 25, charts.MaterialPalette.green.shadeDefault),
      Sales(3, 5, charts.MaterialPalette.yellow.shadeDefault),
    ];

    _chartdata.add(charts.Series(
      id: 'Sales',
      data: _data,
      colorFn: (Sales sales, _) => sales.color,
      domainFn: (Sales sales, _) => sales.year,
      measureFn: (Sales sales, _) => sales.sales,
    ));
  }

  @override
  void initState() {
    _makeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Name here'),
      ),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              const Text('Sales Data'),
              //new Expanded(child: new charts.PieChart<Sales,int>( //old version
              Expanded(
                  child: charts.PieChart(
                //new version
                _chartdata,
                animate: true,
                animationDuration: const Duration(seconds: 3),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
