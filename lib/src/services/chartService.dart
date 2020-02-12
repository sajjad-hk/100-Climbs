import 'dart:async';

import 'package:collection/collection.dart';
import 'package:hundred_climbs/src/models/values.dart';
import 'package:hundred_climbs/src/services/climbService.dart';
import 'package:hundred_climbs/src/services/utilService.dart';

class ChartService {
  StreamTransformer<List<Climb>, Map<String, Map<DateTime, List<Climb>>>>
      _climbsToChartDataTransformer = StreamTransformer.fromHandlers(
    handleData: (data, sink) {
      Map<String, List<Climb>> m = Map.fromIterable(
          groupBy(data, (it) => it.grade).entries.toList()
            ..sort((a, b) => b.key.compareTo(a.key)),
          key: (i) => i.key.toString(),
          value: (i) => i.value);
      return sink.add(
        m.map(
          (key, values) => MapEntry(
            key,
            groupBy(
              values..sort((a, b) => a.loggedDate.compareTo(b.loggedDate)),
              (value) => utils.dateWithoutTime(value.loggedDate),
            ),
          ),
        ),
      );
    },
  );

  Stream<Map<String, Map<DateTime, List<Climb>>>> getClimbingCountChartData(
      String uid) {
    return climbService
        .readSuccessClimbs(uid)
        .transform(_climbsToChartDataTransformer);
  }
}

final ChartService chartService = ChartService();
