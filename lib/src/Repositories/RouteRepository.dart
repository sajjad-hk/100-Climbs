import 'package:cloud_firestore/cloud_firestore.dart';

class RouteRepository {
  final Firestore _db = Firestore.instance;

  Future<void> addRoute(dynamic route) {
    return _db.collection('routes').add(route);
  }
}

final RouteRepository routeRepository = RouteRepository();
