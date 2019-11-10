import 'package:charts_flutter/flutter.dart' as charts;
import 'package:hundred_climbs/src/assets-content/colors/AppColors.dart';
import 'package:hundred_climbs/src/models/values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StackedBarChart extends StatelessWidget {
  final bool animate;

  StackedBarChart({this.animate});
  factory StackedBarChart.withData() {
    return new StackedBarChart(
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
        chartData[key].add(
          ClimbingCount(
            date,
            it.length,
            key,
            AppColors.getGradeColor(key),
          ),
        );
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
        labelAccessorFn: (ClimbingCount climbs, _) => climbs.grade,
        data: value,
      ));
    });

    return charts.TimeSeriesChart(
      chartSeriesData,
      animate: animate,
      defaultInteractions: true,
      defaultRenderer: charts.BarRendererConfig(
        groupingType: charts.BarGroupingType.groupedStacked,
        strokeWidthPx: 2.0,
      ),
      behaviors: [
//        charts.Slider(),
        charts.PanAndZoomBehavior(),
//        charts.PanBehavior(),
        charts.SlidingViewport(),
      ],
      domainAxis: charts.DateTimeAxisSpec(
        tickProviderSpec: charts.AutoDateTimeTickProviderSpec(
          includeTime: false,
        ),
        tickFormatterSpec: new charts.AutoDateTimeTickFormatterSpec(
          month: charts.TimeFormatterSpec(
            format: 'dd, MMM',
            transitionFormat: 'MMM yy',
          ),
        ),
        viewport: charts.DateTimeExtents(
          start: DateTime.now().add(
            Duration(days: -90),
          ),
          end: DateTime.now().add(
            Duration(days: 90),
          ),
        ),
        renderSpec: charts.SmallTickRendererSpec(
          // Tick and Label styling here.
          minimumPaddingBetweenLabelsPx: 10,
          labelStyle: charts.TextStyleSpec(
            fontSize: 14, // size in Pts.
            color: charts.ColorUtil.fromDartColor(AppColors.greyish),
          ),
          labelAnchor: charts.TickLabelAnchor.centered,
          labelRotation: 40,
          labelJustification: charts.TickLabelJustification.outside,
          // Change the line colors to match text color.
          lineStyle: charts.LineStyleSpec(
            color: charts.ColorUtil.fromDartColor(Colors.transparent),
          ),
        ),
      ),
      primaryMeasureAxis: charts.NumericAxisSpec(
        renderSpec: charts.GridlineRendererSpec(
          labelAnchor: charts.TickLabelAnchor.after,
          // Tick and Label styling here.
          labelStyle: charts.TextStyleSpec(
            fontSize: 14, // size in Pts.
            color: charts.ColorUtil.fromDartColor(AppColors.white),
          ),
          // Change the line colors to match text color.
          lineStyle: charts.LineStyleSpec(
            color: charts.ColorUtil.fromDartColor(AppColors.iceBlue28),
          ),
        ),
      ),
    );
  }
}

/// Sample ordinal data type.
class ClimbingCount {
  final DateTime loggedDateTime;
  final int gradeCount;
  String grade;
  Color color;

  ClimbingCount(this.loggedDateTime, this.gradeCount, this.grade, this.color);
}
