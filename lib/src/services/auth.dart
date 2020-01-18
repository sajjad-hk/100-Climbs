import 'dart:async';

import 'package:built_value/standard_json_plugin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hundred_climbs/src/models/serializers.dart';
import 'package:hundred_climbs/src/models/values.dart';

import '../plugin/TimestapmsSerializer.dart';

class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _db = Firestore.instance;

  Future<FirebaseUser> get getUser => _auth.currentUser();

  Stream<FirebaseUser> get user => _auth.onAuthStateChanged;

  static final standardSerializers = (serializers.toBuilder()
        ..addPlugin(StandardJsonPlugin())
        ..addPlugin(TimestampSerializerPlugin()))
      .build();

  Future<FirebaseUser> googleSignIn() async {
    try {
      GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      final FirebaseUser user =
          (await _auth.signInWithCredential(credential)).user;

      return user;
    } catch (error) {
      print(error);
      return null;
    }
  }

  Stream<AppUser> userInfo(String uid) {
    return _db
        .collection('users')
        .document(uid)
        .snapshots()
        .where((it) => it != null)
        .map((data) {
      return standardSerializers.deserializeWith(AppUser.serializer, data.data);
    });
  }

  Future<void> signOut() {
    return _auth.signOut();
  }
}

final AuthService authService = AuthService();
