import 'dart:async';

import 'package:built_value/standard_json_plugin.dart';
import 'package:climbing_logbook/src/models/ClimbingRoute.dart';
import 'package:climbing_logbook/src/models/serializers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ClimbingRouteList {
  final Firestore _db = Firestore.instance;
  StreamTransformer<QuerySnapshot, List<ClimbingRoute>> streamTransformer =
      StreamTransformer.fromHandlers(
    handleData: (data, sink) {
      final standardSerializers =
          (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
      return sink.add(data.documents.map(
        (document) {
          return standardSerializers.deserializeWith(
              ClimbingRoute.serializer, document.data);
        },
      ).toList());
    },
  );

  Stream<List<ClimbingRoute>> getRouteList() {
    var ref = _db.collection('routes');

    return ref.snapshots().transform(streamTransformer);
  }

  addRoute(ClimbingRoute item) {}
}
