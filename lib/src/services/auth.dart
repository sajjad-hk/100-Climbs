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
    updateUserData(user);
    return user;
  }

  Stream<AppUser> hundredClimbsUser(String uid) {
    if (uid != null)
      return _db.collection('users').document(uid).snapshots().map((data) =>
          standardSerializers.deserializeWith(AppUser.serializer, data.data));
  }

  void updateUserData(FirebaseUser user) async {
    DocumentReference ref = _db.collection('users').document(user.uid);

    Climb lastClimb = Climb((c) => c
      ..outCome = OutComeEnum.success
      ..gradingStyle = GradingStyleEnum.french
      ..grade = Constants.grades[c.gradingStyle][0]
      ..belayingStyle = BelayingStyleEnum.lead);

    // todo if user exists we should merge it with this data
    SetBuilder<String> tags = SetBuilder(Constants.defaultTags);

    AppUser appUser = AppUser((u) => u
      ..uid = user.uid
      ..displayName = user.displayName
      ..photoUrl = user.photoUrl
      ..email = user.email
      ..lastLogin = DateTime.now()
      ..lastClimb = lastClimb.toBuilder()
      ..tags = tags);

    dynamic appUserJson =
        standardSerializers.serializeWith(AppUser.serializer, appUser);

    return ref.setData(appUserJson, merge: true);
  }

  void signOut(BuildContext context) {
    _auth.signOut();
  }
}

final AuthService authService = AuthService();
