import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:climbing_logbook/src/climbingRouteWizard/state/wizardState.dart';
import 'package:climbing_logbook/src/models/serializers.dart';
import 'package:climbing_logbook/src/models/values.dart';
import 'package:climbing_logbook/src/plugin/TimestapmsSerializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';

// todo : not good name this is a route provider for list
class ClimbingRouteService {
  final Firestore _db = Firestore.instance;

  static final standardSerializers = (serializers.toBuilder()
        ..addPlugin(StandardJsonPlugin())
        ..addPlugin(TimestampSerializerPlugin()))
      .build();

  StreamTransformer<QuerySnapshot, List<ClimbingRoute>> streamTransformer =
      StreamTransformer.fromHandlers(
    handleData: (data, sink) {
      return sink.add(data.documents.map(
        (document) {
          return standardSerializers.deserializeWith(
              ClimbingRoute.serializer, document.data);
        },
      ).toList());
    },
  );

  StreamTransformer<List<ClimbingRoute>, Map<DateTime, List<ClimbingRoute>>>
      transformer = StreamTransformer.fromHandlers(handleData: (data, sink) {
    return sink.add(groupBy(
        data,
        (it) => DateTime(
            it.loggedDate.year, it.loggedDate.month, it.loggedDate.day)));
  });

  Stream<List<ClimbingRoute>> getRouteList(String uid) {
    var ref = _db.collection('routes').where('uid', isEqualTo: uid);

    return ref.snapshots().transform(streamTransformer);
  }

  Stream<Map<DateTime, List<ClimbingRoute>>> getRouteListGroupByDate(
      String uid) {
    return getRouteList(uid).transform(transformer);
  }

  Future<void> addRoute(ClimbingLogBookUser user, WizardState routeFromWizard) {
    ClimbingRoute climbingRoute = ClimbingRoute(
      (route) => route
        ..uid = user.uid
        ..outCome = routeFromWizard.selectedOutCome
        ..gradingStyle = routeFromWizard.selectedGradingStyle
        ..grade = routeFromWizard.selectedClimbingGrade
        ..belayingStyle = routeFromWizard.selectedBelayStyle
        ..closure = routeFromWizard.selectedClosure
        ..tags = SetBuilder<String>(routeFromWizard.selectedTags)
        ..loggedDate = DateTime.now(),
    );

    _db.collection('users').document(climbingRoute.uid).setData({
      'tags': [...user.tags, ...routeFromWizard.selectedTags].toSet().toList()
    }, merge: true);

    dynamic climbingRouteJson = standardSerializers.serializeWith(
        ClimbingRoute.serializer, climbingRoute);
    return _db.collection('routes').add(climbingRouteJson);
  }
}

final ClimbingRouteService climbingRouteService = ClimbingRouteService();
