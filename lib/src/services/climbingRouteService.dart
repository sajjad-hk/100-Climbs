import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:hundred_climbs/src/climbingRouteWizard/state/wizardState.dart';
import 'package:hundred_climbs/src/models/enums.dart';
import 'package:hundred_climbs/src/models/serializers.dart';
import 'package:hundred_climbs/src/models/values.dart';
import 'package:hundred_climbs/src/plugin/TimestapmsSerializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';

class ClimbingRouteService {
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

  StreamTransformer<List<Climb>, Map<DateTime, List<Climb>>>
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

  Stream<List<Climb>> getClimbingRoutes(String uid) {
    var ref = _db.collection('routes').where('uid', isEqualTo: uid);
    return ref.snapshots().transform(_jsonToClimbingRoutesTransformer);
  }

  Stream<Map<DateTime, List<Climb>>> getClimbingRoutesGroupByDate(String uid) {
    return getClimbingRoutes(uid).transform(_dateGroupByTransformer);
  }

  Future<void> saveNewClimbingRouteAndNewTags(
      AppUser user, WizardState wizardState) {
    Climb climbingRoute =
        _getClimbingRouteFromWizardState(user.uid, wizardState);

    saveNewTagsToFirebase(user, wizardState.selectedTags);
    return saveClimbingRouteToFirebase(climbingRoute);
  }

  Climb _getClimbingRouteFromWizardState(String uid, WizardState wizardState) {
    return Climb(
      (route) => route
        ..uid = uid
        ..outCome = wizardState.selectedOutCome
        ..gradingStyle = wizardState.selectedGradingStyle
        ..grade = wizardState.selectedClimbingGrade
        ..belayingStyle = wizardState.selectedBelayStyle
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

  Future<void> saveClimbingRouteToFirebase(Climb climbingRoute) {
    dynamic climbingRouteJson =
        standardSerializers.serializeWith(Climb.serializer, climbingRoute);
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

  void removeClimbingRoutes(List<String> documentIds) {
    for (String id in documentIds)
      _db.collection('routes').document(id).delete();
  }

  Future<void> updateClimbingRoute(Climb route) {
    dynamic routeJson =
        standardSerializers.serializeWith(Climb.serializer, route);
    return _db
        .collection('routes')
        .document(route.documentId)
        .updateData(routeJson);
  }
}

final ClimbingRouteService climbingRouteService = ClimbingRouteService();
