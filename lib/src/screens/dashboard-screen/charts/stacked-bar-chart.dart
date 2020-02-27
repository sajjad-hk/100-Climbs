import 'package:flutter_echarts/flutter_echarts.dart';
import 'package:hundred_climbs/src/models/values.dart';
import 'package:hundred_climbs/src/screens/screens.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class StackedBarChart extends StatelessWidget {
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

    if ((sessions ?? []).isNotEmpty)
      return Echarts(option: '''{}''');
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
