import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:hundred_climbs/src/assets-content/colors/AppColors.dart';
import 'package:hundred_climbs/src/models/enums.dart';
import 'package:hundred_climbs/src/models/values.dart';
import 'package:intl/intl.dart';
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
    Map<String, Map<DateTime, List<Climb>>> data =
        Provider.of<Map<String, Map<DateTime, List<Climb>>>>(context);
    Map<DateTime, List<Climb>> dataByDate =
        Provider.of<Map<DateTime, List<Climb>>>(context);
    List<DateTime> allDates = dataByDate == null ? [] : dataByDate.keys.toList()
      ..sort();

    dataByDate?.forEach((key, value) {
      if (value.where((i) => i.outCome == OutComeEnum.success).isEmpty)
        allDates.remove(key);
    });

    List<String> grades = data == null ? [] : data.keys.toList()
      ..sort();
    Map<String, List<ClimbingCount>> chartData = Map();
    grades.reversed.forEach((key) {
      if (!chartData.containsKey(key)) chartData[key] = List();
      List<DateTime> keys = data[key].keys.toList()..sort();
      allDates.forEach((date) {
        chartData[key].add(
          ClimbingCount(
            date,
            data[key][date] == null ? 0 : data[key][date].length,
            key,
            AppColors.getGradeColor(key),
          ),
        );
      });
    });

    List chartSeriesData = List<charts.Series<dynamic, String>>();

    chartData.forEach((key, value) {
      chartSeriesData.add(charts.Series<ClimbingCount, String>(
        id: key,
        domainFn: (ClimbingCount climbs, _) =>
            DateFormat.MEd().format(climbs.loggedDateTime),
        measureFn: (ClimbingCount climbs, _) => climbs.gradeCount,
        colorFn: (ClimbingCount climbs, _) => climbs.gradeCount == 0
            ? charts.ColorUtil.fromDartColor(Colors.transparent)
            : charts.ColorUtil.fromDartColor(climbs.color),
        labelAccessorFn: (ClimbingCount climbs, _) => climbs.grade,
        data: value,
      ));
    });

    return charts.BarChart(
      chartSeriesData,
      animate: animate,
      defaultInteractions: true,
      defaultRenderer: charts.BarRendererConfig(
        groupingType: charts.BarGroupingType.stacked,
        strokeWidthPx: 2.0,
      ),
      behaviors: [
        charts.PanAndZoomBehavior(),
        charts.SlidingViewport(),
        charts.InitialSelection(selectedDataConfig: [
          new charts.SeriesDatumConfig<String>('5a+', 'Thu, 11/7')
        ])
      ],
      domainAxis: charts.AxisSpec<String>(
        renderSpec: charts.SmallTickRendererSpec(
          // Tick and Label styling here.
          minimumPaddingBetweenLabelsPx: 10,
          labelStyle: charts.TextStyleSpec(
            fontSize: 11, // size in Pts.
            color: charts.ColorUtil.fromDartColor(AppColors.greyIsh),
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
