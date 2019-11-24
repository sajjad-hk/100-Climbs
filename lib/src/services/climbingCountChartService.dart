import 'dart:async';

import 'package:built_value/standard_json_plugin.dart';
import 'package:hundred_climbs/src/models/enums.dart';
import 'package:hundred_climbs/src/models/serializers.dart';
import 'package:hundred_climbs/src/models/values.dart';
import 'package:hundred_climbs/src/plugin/TimestapmsSerializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';

class ClimbingCountChartService {
  final Firestore _db = Firestore.instance;

  static final standardSerializers = (serializers.toBuilder()
        ..addPlugin(StandardJsonPlugin())
        ..addPlugin(TimestampSerializerPlugin()))
      .build();

  StreamTransformer<QuerySnapshot, List<Climb>>
      _jsonToClimbingRoutesTransformer = StreamTransformer.fromHandlers(
    handleData: (data, sink) {
      return sink.add(data.documents.map(
        (document) {
          return standardSerializers
              .deserializeWith(Climb.serializer, document.data)
              .rebuild((it) => it..documentId = document.documentID);
        },
      ).toList());
    },
  );

  StreamTransformer<List<Climb>, Map<String, Map<DateTime, List<Climb>>>>
      _climbingRoutesToChartTransformer =
      StreamTransformer.fromHandlers(handleData: (data, sink) {
    Map groupByMonth = groupBy(
      data.where((it) => it.outCome == OutComeEnum.success),
      (it) => it.grade,
    );
    Map<String, Map<DateTime, List<Climb>>> groupByGrade = groupByMonth.map(
      (key, values) => MapEntry(
        key,
        groupBy(
          values,
          (value) => DateTime(value.loggedDate.year, value.loggedDate.month,
              value.loggedDate.day),
        ),
      ),
    );
    return sink.add(
      groupByGrade,
    );
  });

  Stream<Map<String, Map<DateTime, List<Climb>>>> getClimbingCountChartData(
      String uid) {
    return _getClimbingRoutes(uid).transform(_climbingRoutesToChartTransformer);
  }

  Stream<List<Climb>> _getClimbingRoutes(String uid) {
    var ref = _db.collection('routes').where('uid', isEqualTo: uid);
    return ref.snapshots().transform(_jsonToClimbingRoutesTransformer);
  }
}

final ClimbingCountChartService climbingCountChartService =
    ClimbingCountChartService();
