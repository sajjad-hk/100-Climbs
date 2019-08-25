import 'package:built_value/standard_json_plugin.dart';
import 'package:climbing_logbook/src/models/serializers.dart';
import 'package:climbing_logbook/src/models/values.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'plugin/TimestapmsSerializer.dart';

class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _db = Firestore.instance;

  final standardSerializers = (serializers.toBuilder()
    ..addPlugin(StandardJsonPlugin())
    ..addPlugin(TimestampSerializerPlugin())
  ).build();

  Future<FirebaseUser> googleSignIn() async {

    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
    updateUserData(user);
    return user;
  }

  Stream<ClimbingLogBookUser> climbingLogBookUser(String uid) {
   return  _db.collection('users').document(uid).snapshots().map((data) => standardSerializers.deserializeWith(ClimbingLogBookUser.serializer, data.data));
  }



  void updateUserData(FirebaseUser user) async {
    DocumentReference ref = _db.collection('users').document(user.uid);

    return ref.setData(
        {'uid': user.uid, 'email': user.email, 'lastLogin': DateTime.now()},
        merge: true);
  }

  void signOut(BuildContext context) {
    _auth.signOut().catchError((_,__) => print('SOS'));
  }
}

final AuthService authService = AuthService();
