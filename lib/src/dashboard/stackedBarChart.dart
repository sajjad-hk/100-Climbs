import 'dart:collection';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:climbing_logbook/src/assets-content/colors/AppColors.dart';
import 'package:climbing_logbook/src/models/values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StackedBarChart extends StatelessWidget {
  final List<charts.Series<ClimbingCount, DateTime>> seriesList;
  final bool animate;

  StackedBarChart(this.seriesList, {this.animate});

  /// Creates a stacked [BarChart] with sample data and no transition.
  factory StackedBarChart.withData() {
    return new StackedBarChart(
      _createData(),
      // Disable animations for image tests.
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    Map<String, Map<DateTime, List<ClimbingRoute>>> data =
        Provider.of<Map<String, Map<DateTime, List<ClimbingRoute>>>>(context);

    List<String> grades = data == null ? [] : data.keys.toList()
      ..sort();
    Map<String, List<ClimbingCount>> chartData = Map();
    grades.reversed.forEach((key) {
      if (!chartData.containsKey(key)) chartData[key] = List();
      data[key].forEach((date, it) {
        chartData[key]
            .add(ClimbingCount(date, it.length, AppColors.getGradeColor(key)));
      });
    });

    List chartSeriesData = List<charts.Series<dynamic, DateTime>>();

    chartData.forEach((key, value) {
      chartSeriesData.add(charts.Series<ClimbingCount, DateTime>(
        id: key,
        domainFn: (ClimbingCount climbs, _) => climbs.loggedDateTime,
        measureFn: (ClimbingCount climbs, _) => climbs.gradeCount,
        colorFn: (ClimbingCount climbs, _) =>
            charts.ColorUtil.fromDartColor(climbs.color),
        data: value,
      ));
    });

//    print(chartData['7a+'][0].toString());
    return new charts.TimeSeriesChart(
      chartSeriesData,
      animate: animate,
      defaultRenderer: new charts.BarRendererConfig(
        groupingType: charts.BarGroupingType.stacked,
        strokeWidthPx: 2.0,
      ),
      behaviors: [
        // Add the sliding viewport behavior to have the viewport center on the
        // domain that is currently selected.
        new charts.SlidingViewport(),
        // A pan and zoom behavior helps demonstrate the sliding viewport
        // behavior by allowing the data visible in the viewport to be adjusted
        // dynamically.
        new charts.PanAndZoomBehavior(),
      ],
      domainAxis: new charts.DateTimeAxisSpec(
        viewport: new charts.DateTimeExtents(
            start: DateTime(2018, 3), end: DateTime(2018, 10)),
        renderSpec: new charts.SmallTickRendererSpec(
          // Tick and Label styling here.
          minimumPaddingBetweenLabelsPx: 0,
          labelStyle: new charts.TextStyleSpec(
              fontSize: 14, // size in Pts.
              color: charts.MaterialPalette.white),

          // Change the line colors to match text color.
          lineStyle:
              new charts.LineStyleSpec(color: charts.MaterialPalette.white),
        ),
      ),
      primaryMeasureAxis: charts.NumericAxisSpec(
        renderSpec: new charts.GridlineRendererSpec(
          labelAnchor: charts.TickLabelAnchor.after,
          // Tick and Label styling here.
          labelStyle: new charts.TextStyleSpec(
            fontSize: 14, // size in Pts.

            color: charts.MaterialPalette.white,
          ),
          minimumPaddingBetweenLabelsPx: 10,
          // Change the line colors to match text color.
          lineStyle: new charts.LineStyleSpec(
            color: charts.MaterialPalette.white,
          ),
        ),
      ),
    );
  }

  /// Create series list with multiple series
  static List<charts.Series<ClimbingCount, DateTime>> _createData() {
//
//    print(data?.keys);
    final desktopSalesData = [
      new ClimbingCount(DateTime(2018, 3), 5, Color(0xffffe600)),
      new ClimbingCount(DateTime(2018, 4), 5, Color(0xffffe600)),
      new ClimbingCount(DateTime(2018, 5), 5, Color(0xffffe600)),
      new ClimbingCount(DateTime(2018, 6), 25, Color(0xffffe600)),
      new ClimbingCount(DateTime(2018, 7), 100, Color(0xffffe600)),
      new ClimbingCount(DateTime(2018, 8), 75, Color(0xffffe600)),
    ];

    final tableSalesData = [
      new ClimbingCount(DateTime(2018, 3), 45, Color(0xffffc400)),
      new ClimbingCount(DateTime(2018, 4), 25, Color(0xffffc400)),
      new ClimbingCount(DateTime(2018, 5), 25, Color(0xffffc400)),
      new ClimbingCount(DateTime(2018, 6), 50, Color(0xffffc400)),
      new ClimbingCount(DateTime(2018, 7), 10, Color(0xffffc400)),
      new ClimbingCount(DateTime(2018, 8), 20, Color(0xffffc400)),
    ];

    final mobileSalesData = [
      new ClimbingCount(DateTime(2018, 4), 10, Color(0xfffca138)),
      new ClimbingCount(DateTime(2018, 5), 10, Color(0xfffca138)),
      new ClimbingCount(DateTime(2018, 6), 15, Color(0xfffca138)),
      new ClimbingCount(DateTime(2018, 7), 50, Color(0xfffca138)),
      new ClimbingCount(DateTime(2018, 8), 45, Color(0xfffca138)),
    ];

    final hsetd = [
      new ClimbingCount(DateTime(2018, 7), 10, Color(0xfff96d01)),
    ];
    final hsetd2 = [
      new ClimbingCount(DateTime(2018, 3), 16, Color(0xffff4534)),
      new ClimbingCount(DateTime(2018, 7), 6, Color(0xffff4534)),
    ];

    return [
      new charts.Series<ClimbingCount, DateTime>(
        id: 'Desktop',
        domainFn: (ClimbingCount sales, _) => sales.loggedDateTime,
        measureFn: (ClimbingCount sales, _) => sales.gradeCount,
        colorFn: (ClimbingCount sales, _) =>
            charts.ColorUtil.fromDartColor(sales.color),
        data: desktopSalesData,
      ),
      new charts.Series<ClimbingCount, DateTime>(
        id: 'Tablet',
        domainFn: (ClimbingCount sales, _) => sales.loggedDateTime,
        measureFn: (ClimbingCount sales, _) => sales.gradeCount,
        colorFn: (ClimbingCount sales, _) =>
            charts.ColorUtil.fromDartColor(sales.color),
        data: tableSalesData,
      ),
      new charts.Series<ClimbingCount, DateTime>(
        id: 'Mobile',
        domainFn: (ClimbingCount sales, _) => sales.loggedDateTime,
        measureFn: (ClimbingCount sales, _) => sales.gradeCount,
        colorFn: (ClimbingCount sales, _) =>
            charts.ColorUtil.fromDartColor(sales.color),
        data: mobileSalesData,
      ),
      charts.Series<ClimbingCount, DateTime>(
        id: 'h',
        domainFn: (ClimbingCount sales, _) => sales.loggedDateTime,
        measureFn: (ClimbingCount sales, _) => sales.gradeCount,
        colorFn: (ClimbingCount sales, _) =>
            charts.ColorUtil.fromDartColor(sales.color),
        data: hsetd,
      ),
      charts.Series<ClimbingCount, DateTime>(
        id: 'h2',
        domainFn: (ClimbingCount sales, _) => sales.loggedDateTime,
        measureFn: (ClimbingCount sales, _) => sales.gradeCount,
        colorFn: (ClimbingCount sales, _) =>
            charts.ColorUtil.fromDartColor(sales.color),
        data: hsetd2,
      )
    ].reversed.toList();
  }
}

/// Sample ordinal data type.
class ClimbingCount {
  final DateTime loggedDateTime;
  final int gradeCount;
  Color color;

  ClimbingCount(this.loggedDateTime, this.gradeCount, this.color);
}
