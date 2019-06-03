import 'package:cloud_firestore/cloud_firestore.dart';

class RouteRepository {
  final Firestore _db = Firestore.instance;

  Future<void> addRoute(dynamic route) {
    return _db
        .collection('routes')
        .document('AaEsfo16scWFgKXaW1haS62ZwHm1')
        .collection('routes')
        .add({'grade': route.grade});
  }
}
