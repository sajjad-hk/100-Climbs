import 'package:charts_flutter/flutter.dart' as charts;
import 'package:hundred_climbs/src/models/values.dart';
import 'package:hundred_climbs/src/screens/screens.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class StackedBarChart extends StatelessWidget {
  final bool animate;
  final numberOfBarViewPort = 7;

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

    List<DateTime> sessions = Provider.of<List<DateTime>>(context);

    Map<String, List<ClimbingCount>> chartData = data?.map((grade, value) {
      List<ClimbingCount> climbingCounts = List();
      sessions?.forEach((date) => climbingCounts.add(ClimbingCount(
          date,
          value[date] == null ? 0 : value[date].length,
          grade,
          AppColors.getGradeColor(grade))));
      return MapEntry(grade, climbingCounts);
    });

    List chartSeriesData = List<charts.Series<dynamic, String>>();

    String start = '';

    if (sessions != null && sessions.length > 6) {
      start = DateFormat.MMMd()
          .format(sessions[sessions.length - numberOfBarViewPort]);
    }

    chartData?.forEach((key, value) {
      chartSeriesData.add(charts.Series<ClimbingCount, String>(
        id: key,
        domainFn: (ClimbingCount climbs, _) =>
            DateFormat.MMMd().format(climbs.loggedDateTime),
        measureFn: (ClimbingCount climbs, _) => climbs.gradeCount,
        colorFn: (ClimbingCount climbs, _) => climbs.gradeCount == 0
            ? charts.ColorUtil.fromDartColor(Colors.transparent)
            : charts.ColorUtil.fromDartColor(climbs.color),
        labelAccessorFn: (ClimbingCount climbs, _) => climbs.grade,
        data: value,
      ));
    });

    if ((sessions ?? []).isNotEmpty)
      return charts.BarChart(
        chartSeriesData,
        animate: animate,
        defaultInteractions: true,
        defaultRenderer: charts.BarRendererConfig(
          groupingType: charts.BarGroupingType.stacked,
          strokeWidthPx: 2.0,
        ),
        behaviors: [
          charts.PanBehavior(),
          charts.SlidingViewport(),
        ],
        domainAxis: charts.OrdinalAxisSpec(
          renderSpec: charts.SmallTickRendererSpec(
            // Tick and Label styling here.
            minimumPaddingBetweenLabelsPx: 20,
            labelStyle: charts.TextStyleSpec(
              fontSize: 9, // size in Pts.
              color: charts.ColorUtil.fromDartColor(AppColors.greyIsh),
            ),
            labelAnchor: charts.TickLabelAnchor.centered,
            labelRotation: 45,
            labelJustification: charts.TickLabelJustification.outside,
            // Change the line colors to match text color.
            lineStyle: charts.LineStyleSpec(
              color: charts.ColorUtil.fromDartColor(Colors.transparent),
            ),
          ),
          viewport: charts.OrdinalViewport(start, numberOfBarViewPort),
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
    else
      return Container();
  }
}

class ClimbingCount {
  final DateTime loggedDateTime;
  final int gradeCount;
  String grade;
  Color color;

  ClimbingCount(this.loggedDateTime, this.gradeCount, this.grade, this.color);
}
