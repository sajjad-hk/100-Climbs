import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:climbing_logbook/src/climbingRouteWizard/state/wizardState.dart';
import 'package:climbing_logbook/src/models/enums.dart';
import 'package:climbing_logbook/src/models/serializers.dart';
import 'package:climbing_logbook/src/models/values.dart';
import 'package:climbing_logbook/src/plugin/TimestapmsSerializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';

class ClimbingRouteService {
  final Firestore _db = Firestore.instance;

  static final standardSerializers = (serializers.toBuilder()
        ..addPlugin(StandardJsonPlugin())
        ..addPlugin(TimestampSerializerPlugin()))
      .build();

  StreamTransformer<QuerySnapshot, List<ClimbingRoute>>
      _jsonToClimbingRoutesTransformer = StreamTransformer.fromHandlers(
    handleData: (data, sink) {
      return sink.add(data.documents.map(
        (document) {
          return standardSerializers
              .deserializeWith(ClimbingRoute.serializer, document.data)
              .rebuild((it) => it..documentId = document.documentID);
        },
      ).toList());
    },
  );

  StreamTransformer<List<ClimbingRoute>, Map<DateTime, List<ClimbingRoute>>>
      _dateGroupByTransformer = StreamTransformer.fromHandlers(
    handleData: (data, sink) {
      return sink.add(
        groupBy(
          data,
          (it) => DateTime(
            it.loggedDate.year,
            it.loggedDate.month,
            it.loggedDate.day,
          ),
        ),
      );
    },
  );

  Stream<List<ClimbingRoute>> getClimbingRoutes(String uid) {
    var ref = _db.collection('routes').where('uid', isEqualTo: uid);
    return ref.snapshots().transform(_jsonToClimbingRoutesTransformer);
  }

  Stream<Map<DateTime, List<ClimbingRoute>>> getClimbingRoutesGroupByDate(
      String uid) {
    return getClimbingRoutes(uid).transform(_dateGroupByTransformer);
  }

  Future<void> saveNewClimbingRouteAndNewTags(
      AppUser user, WizardState wizardState) {
    ClimbingRoute climbingRoute =
        _getClimbingRouteFromWizardState(user.uid, wizardState);
    Climb lastClimb =
        _createLastClimb(climbingRoute.grade, climbingRoute.gradingStyle);
    saveNewTagsToFirebase(user, wizardState.selectedTags);
    saveLastClimb(user, lastClimb);
    return saveClimbingRouteToFirebase(climbingRoute);
  }

  ClimbingRoute _getClimbingRouteFromWizardState(
      String uid, WizardState wizardState) {
    return ClimbingRoute(
      (route) => route
        ..uid = uid
        ..outCome = wizardState.selectedOutCome
        ..gradingStyle = wizardState.selectedGradingStyle
        ..grade = wizardState.selectedClimbingGrade
        ..belayingStyle = wizardState.selectedBelayStyle
        ..closure = wizardState.selectedClosure
        ..tags = SetBuilder<String>(wizardState.selectedTags)
        ..loggedDate = DateTime.now(),
    );
  }

  Climb _createLastClimb(String grade, GradingStyleEnum gradingStyle) {
    return Climb((c) => c
      ..grade = grade
      ..gradingStyle = gradingStyle);
  }

  Future<void> saveNewTagsToFirebase(AppUser user, List<String> tags) {
    List<String> distinctTags = [...user.tags, ...tags].toSet().toList();
    return _db
        .collection('users')
        .document(user.uid)
        .setData({'tags': distinctTags}, merge: true);
  }

  Future<void> saveClimbingRouteToFirebase(ClimbingRoute climbingRoute) {
    dynamic climbingRouteJson = standardSerializers.serializeWith(
        ClimbingRoute.serializer, climbingRoute);
    return _db.collection('routes').add(climbingRouteJson);
  }

  Future<void> saveLastClimb(AppUser user, Climb lastClimb) {
    dynamic lastClimbJson =
        standardSerializers.serializeWith(Climb.serializer, lastClimb);
    return _db
        .collection('users')
        .document(user.uid)
        .setData({'lastClimb': lastClimbJson}, merge: true);
  }

  Future<void> removeClimbingRoute(String documentId) {
    return _db.collection('routes').document(documentId).delete();
  }

  Future<void> updateClimbingRoute(ClimbingRoute route) {
    dynamic routeJson =
        standardSerializers.serializeWith(ClimbingRoute.serializer, route);
    return _db
        .collection('routes')
        .document(route.documentId)
        .updateData(routeJson);
  }
}

final ClimbingRouteService climbingRouteService = ClimbingRouteService();
