import 'package:flutter_echarts/flutter_echarts.dart';
import 'package:hundred_climbs/src/models/enums.dart';
import 'package:hundred_climbs/src/models/values.dart';
import 'package:hundred_climbs/src/screens/screens.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:hundred_climbs/src/screens/layout-utils/chart-style.dart';

class StackedBarChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, Map<DateTime, List<Climb>>> data =
        Provider.of<Map<String, Map<DateTime, List<Climb>>>>(context);
    List<DateTime> sessions = Provider.of<List<DateTime>>(context);

    if (sessions == null || data == null)
      return Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.lightNavy, AppColors.dark],
          ),
        ),
      );

    List<String> newList = data.values.map((b) {
      List<int> successes = [];
      List<int> failures = [];
      sessions.forEach((session) {
        if (b.containsKey(session)) {
          successes.add(b[session]
              .where((it) => it.outCome == OutComeEnum.success)
              .length);
          failures.add(b[session]
              .where((it) => it.outCome == OutComeEnum.failure)
              .length);
        } else {
          successes.add(0);
          failures.add(0);
        }
      });
      String grade = b.values.toList().first.first.grade;
      return ChartStyle.getSeriesTemp(grade, successes, failures);
    }).toList();

    List<String> formattedSessions = sessions
        .map((i) => "'${DateFormat.MMMd().format(i).toString()}'")
        .toList();

    return Echarts(
        option: generateChartOption(formattedSessions, newList.toString()));
  }

  generateChartOption(List<String> sessions, String successData) {
    return '''
     {
          grid: ${ChartStyle.grid},
          backgroundColor: ${ChartStyle.backgroundColor},
          dataZoom: ${ChartStyle.getDataZoom(sessions)},
          xAxis: ${ChartStyle.getXAxis(sessions.toString())},
          yAxis: ${ChartStyle.yAxis},
          series: $successData,
     }
  ''';
  }
}
