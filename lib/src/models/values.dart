import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:climbing_logbook/src/models/enums.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'values.g.dart';

abstract class ClimbingRoute
    implements Built<ClimbingRoute, ClimbingRouteBuilder> {
  OutComeEnum get outCome;

  String get uid;

  GradingStyleEnum get gradingStyle;

  String get grade;

  BelayingStyleEnum get belayingStyle;

  @nullable
  ClosureEnum get closure;

  @nullable
  BuiltSet<String> get tags;

  ClimbingRoute._();

  factory ClimbingRoute([void Function(ClimbingRouteBuilder) updates]) =
      _$ClimbingRoute;

  static Serializer<ClimbingRoute> get serializer => _$climbingRouteSerializer;
}

abstract class ClimbingLogBookUser
    implements Built<ClimbingLogBookUser, ClimbingLogBookUserBuilder> {
  String get uid;

  String get displayName;

  @nullable
  String get photoUrl;

  String get email;

  @nullable
  BuiltSet<String> get tags;

  DateTime get lastLogin;

  ClimbingLogBookUser._();

  factory ClimbingLogBookUser(
          [void Function(ClimbingLogBookUserBuilder) updates]) =
      _$ClimbingLogBookUser;

  static Serializer<ClimbingLogBookUser> get serializer =>
      _$climbingLogBookUserSerializer;
}
