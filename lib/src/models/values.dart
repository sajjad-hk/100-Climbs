import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hundred_climbs/src/models/enums.dart';

part 'values.g.dart';

abstract class ClimbingRoute
    implements Built<ClimbingRoute, ClimbingRouteBuilder> {
  @nullable
  String get documentId;

  OutComeEnum get outCome;

  String get uid;

  GradingStyleEnum get gradingStyle;

  String get grade;

  BelayingStyleEnum get belayingStyle;

  @nullable
  ClosureEnum get closure;

  @nullable
  BuiltSet<String> get tags;

  DateTime get loggedDate;

  @nullable
  String get comment;

  ClimbingRoute._();

  factory ClimbingRoute([void Function(ClimbingRouteBuilder) updates]) =
      _$ClimbingRoute;

  static Serializer<ClimbingRoute> get serializer => _$climbingRouteSerializer;
}

abstract class Climb implements Built<Climb, ClimbBuilder> {
  @nullable
  OutComeEnum get outCome;
  String get grade;
  GradingStyleEnum get gradingStyle;
  @nullable
  BelayingStyleEnum get belayingStyle;

  Climb._();

  factory Climb([void Function(ClimbBuilder) updates]) = _$Climb;

  static Serializer<Climb> get serializer => _$climbSerializer;
}

abstract class AppUser implements Built<AppUser, AppUserBuilder> {
  String get uid;

  String get displayName;

  @nullable
  String get photoUrl;

  String get email;

  @nullable
  BuiltSet<String> get tags;

  DateTime get lastLogin;

  @nullable
  Climb get lastClimb;

  AppUser._();

  factory AppUser([void Function(AppUserBuilder) updates]) = _$AppUser;

  static Serializer<AppUser> get serializer => _$appUserSerializer;
}
