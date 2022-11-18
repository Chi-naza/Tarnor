// import 'package:flutter/material.dart';
// // import 'package:charts_flutter/flutter.dart' as charts;


// import 'mychartmodel.dart';

// class mainchartdisplaywidget extends StatelessWidget {

//   final List<ChartData> data;

//   const mainchartdisplaywidget({ Key? key, required this.data }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     List<charts.Series<ChartData, String>> series = [
//       charts.Series(data: data,
//       id: "nanocodeschart",
//       domainFn: (ChartData series, _) => series.timeframe,
//       measureFn: (ChartData series, _) => series.amount,
//         colorFn: (ChartData series, _) => series.barColor
//       )
//     ];
//     return charts.BarChart(series, animate: true);
//   }
// }