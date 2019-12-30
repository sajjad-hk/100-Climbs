import 'package:built_collection/built_collection.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:hundred_climbs/src/models/enums.dart';
import 'package:hundred_climbs/src/models/serializers.dart';
import 'package:hundred_climbs/src/models/values.dart';
import 'package:hundred_climbs/src/states/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../plugin/TimestapmsSerializer.dart';

class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _db = Firestore.instance;

  final standardSerializers = (serializers.toBuilder()
        ..addPlugin(StandardJsonPlugin())
        ..addPlugin(TimestampSerializerPlugin()))
      .build();

  Future<FirebaseUser> googleSignIn() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    return user;
  }

  Stream<AppUser> hundredClimbsUser(String uid) {
    return _db
        .collection('users')
        .document(uid)
        .snapshots()
        .where((it) => it != null)
        .map((data) {
      return standardSerializers.deserializeWith(AppUser.serializer, data.data);
    });
  }

  void signOut(BuildContext context) {
    _auth.signOut();
  }
}

final AuthService authService = AuthService();
