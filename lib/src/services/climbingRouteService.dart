import 'dart:async';

import 'package:built_value/standard_json_plugin.dart';
import 'package:climbing_logbook/src/models/serializers.dart';
import 'package:climbing_logbook/src/models/values.dart';
import 'package:climbing_logbook/src/plugin/TimestapmsSerializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// todo : not good name this is a route provider for list
class ClimbingRouteService {
  final Firestore _db = Firestore.instance;

  static final standardSerializers = (serializers.toBuilder()
    ..addPlugin(StandardJsonPlugin())
    ..addPlugin(TimestampSerializerPlugin())
  ).build();

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

  Stream<List<ClimbingRoute>> getRouteList(String uid) {
    var ref = _db.collection('routes').where('uid', isEqualTo: uid);

    return ref.snapshots().transform(streamTransformer);
  }

  Future<void> addRoute(ClimbingRoute climbingRoute) {

    dynamic climbingRouteJson = standardSerializers.serializeWith(
        ClimbingRoute.serializer, climbingRoute);
    return _db.collection('routes').add(climbingRouteJson);
  }
}

final ClimbingRouteService climbingRouteService = ClimbingRouteService();
