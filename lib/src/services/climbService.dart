import 'dart:async';

import 'package:built_value/standard_json_plugin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:hundred_climbs/src/models/serializers.dart';
import 'package:hundred_climbs/src/models/values.dart';
import 'package:hundred_climbs/src/plugin/TimestapmsSerializer.dart';
import 'package:hundred_climbs/src/services/auth.dart';
import 'package:hundred_climbs/src/services/tagService.dart';
import 'package:hundred_climbs/src/services/utilService.dart';

class ClimbService {
  final Firestore _db = Firestore.instance;

  static final standardSerializers = (serializers.toBuilder()
        ..addPlugin(StandardJsonPlugin())
        ..addPlugin(TimestampSerializerPlugin()))
      .build();

  StreamTransformer<QuerySnapshot, List<Climb>> _climbTransformer =
      StreamTransformer.fromHandlers(
    handleData: (data, sink) {
      return sink.add(
        data.documents.map(
          (document) {
            return standardSerializers
                .deserializeWith(Climb.serializer, document.data)
                .rebuild((it) => it..documentId = document.documentID);
          },
        ).toList(),
      );
    },
  );

  StreamTransformer<List<Climb>, Map<DateTime, List<Climb>>>
      _dateGroupByTransformer = StreamTransformer.fromHandlers(
    handleData: (data, sink) {
      return sink.add(
        groupBy(
          data,
          (it) => utils.dateWithoutTime(it.loggedDate),
        ),
      );
    },
  );

  StreamTransformer<List<Climb>, List<DateTime>> _sessionDateTransformer =
      StreamTransformer.fromHandlers(
    handleData: (data, sink) {
      return sink.add(
        data
            .map(
              (it) => DateTime(
                  it.loggedDate.year, it.loggedDate.month, it.loggedDate.day),
            )
            .toSet()
            .toList()
              ..sort(
                (a, b) => a.compareTo(b),
              ),
      );
    },
  );

  Stream<List<Climb>> readClimbs(String uid) {
    var ref = _db.collection('climbs').where('uid', isEqualTo: uid);
    return ref.snapshots().transform(_climbTransformer);
  }

  Stream<List<Climb>> readSuccessClimbs(String uid) {
    var ref = _db
        .collection('climbs')
        .where('uid', isEqualTo: uid)
        .where('outCome', isEqualTo: 'success')
        .orderBy('loggedDate', descending: true);
    return ref.snapshots().transform(_climbTransformer);
  }

  Future<dynamic> findBestClimb(String uid) async {
    var d = await _db
        .collection('climbs')
        .where('uid', isEqualTo: uid)
        .where('outCome', isEqualTo: 'success')
        .orderBy('grade', descending: true)
        .limit(1)
        .getDocuments();
    var defaultClimb = Completer();
    defaultClimb.complete({
      'outCome': 'success',
      'grade': '4',
      'gradingStyle': 'french',
      'belayingStyle': 'lead',
      'tags': [],
      'loggedDate': DateTime.now()
    });
    if (d.documents.isEmpty) return defaultClimb.future;
    // todo when user removes all climbs no best climb
    return d.documents.first.data;
  }

  Stream<Map<DateTime, List<Climb>>> climbsGroupByDate(String uid) {
    return readClimbs(uid).transform(_dateGroupByTransformer);
  }

  Stream<List<DateTime>> climbingSessions(String uid) {
    return readClimbs(uid).transform(_sessionDateTransformer);
  }

  Future<void> deleteClimb(String climbId) async {
    String uid = (await authService.getUser).uid;
    updateClimbsCount(uid, -1);
    updateBestClimb();
    return _db.collection('climbs').document(climbId).delete();
  }

  void deleteClimbs(List<String> climbIds) async {
    String uid = (await authService.getUser).uid;
    updateClimbsCount(uid, -climbIds.length);
    for (String id in climbIds) _db.collection('climbs').document(id).delete();
    updateBestClimb();
  }

  Future<void> updateClimbsCount(String uid, int add) async {
    var ref = _db.collection('profiles').document(uid);
    AppUser user = await ref
        .snapshots()
        .where((it) => it != null)
        .map((it) =>
            standardSerializers.deserializeWith(AppUser.serializer, it.data))
        .first;
    ref.setData({'totalNumOfClimbs': user.totalNumOfClimbs + add}, merge: true);
  }

  Future<void> updateBestClimb() async {
    String uid = (await authService.getUser).uid;
    dynamic bestClimb = await findBestClimb(uid);
    var ref = _db.collection('profiles').document(uid);
    ref.setData({'bestClimb': bestClimb}, merge: true);
  }

  Future<void> addClimb(Climb climb) async {
    String uid = (await authService.getUser).uid;
    Climb climbObject = _assignUserAndDateToClimb(uid, climb);
    updateBestClimb();
    tagService.savePersonalTag(climb.tags.toList());
    updateLastClimb(climbObject);
    return saveClimb(climbObject);
  }

  Climb _assignUserAndDateToClimb(String uid, Climb climb) {
    return climb.rebuild(
      (c) => c
        ..uid = uid
        ..loggedDate = DateTime.now(),
    );
  }

  Future<void> saveClimb(Climb climbingRoute) async {
    String uid = (await authService.getUser).uid;
    updateClimbsCount(uid, 1);
    dynamic climbJson =
        standardSerializers.serializeWith(Climb.serializer, climbingRoute);
    return _db.collection('climbs').add(climbJson);
  }

  Future<void> updateLastClimb(Climb lastClimb) async {
    String uid = (await authService.getUser).uid;
    dynamic lastClimbJson =
        standardSerializers.serializeWith(Climb.serializer, lastClimb);
    return _db
        .collection('profiles')
        .document(uid)
        .setData({'lastClimb': lastClimbJson}, merge: true);
  }

  Future<void> updateClimb(Climb climb) {
    dynamic routeJson =
        standardSerializers.serializeWith(Climb.serializer, climb);
    return _db
        .collection('climbs')
        .document(climb.documentId)
        .updateData(routeJson);
  }
}

final ClimbService climbService = ClimbService();
