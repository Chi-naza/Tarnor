// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// class ChartData {
//   late final String timeframe;
//   late final int amount;
//   late final charts.Color barColor;
//   final String mytimestamp;

//   ChartData({
//     required this.timeframe,
//     required this.amount,
//     required this.barColor,
//     this.mytimestamp = "day",
//   });
//   static setAndPopulateData(mytimestamp) {
//     var items = [];
//     List<ChartData> myprocessedlist = [];
//     for (var item in items) {
//       myprocessedlist.add(ChartData(
//         timeframe: item.timeframe,
//         amount: item.amount,
//         barColor: charts.ColorUtil.fromDartColor(Colors.green),
//       ));
//     }
//      List<charts.Series<ChartData, String>> series = [
//       charts.Series(data: myprocessedlist,
//       id: "nanocodeschart",
//       domainFn: (ChartData series, _) => series.timeframe,
//       measureFn: (ChartData series, _) => series.amount,
//         colorFn: (ChartData series, _) => series.barColor
//       )
//     ];
//     return charts.BarChart(series, animate: true);
//   }
   
//   }

 
