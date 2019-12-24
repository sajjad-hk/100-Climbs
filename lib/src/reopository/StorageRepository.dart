import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hundred_climbs/src/services/StorageProvider.dart';

class StorageRepository {
  final _store = StorageProvider(flutterSecureStorage: FlutterSecureStorage());

  Future<void> setEmail(String email) => _store.setEmail(email);

  Future<void> clearEmail() => _store.clearEmail();

  Future<String> getEmail() => _store.getEmail();
}
