import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:climbing_logbook/src/models/enums.dart';

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

  DateTime get loggedDate;

  ClimbingRoute._();

  factory ClimbingRoute([void Function(ClimbingRouteBuilder) updates]) =
      _$ClimbingRoute;

  static Serializer<ClimbingRoute> get serializer => _$climbingRouteSerializer;
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

  AppUser._();

  factory AppUser([void Function(AppUserBuilder) updates]) = _$AppUser;

  static Serializer<AppUser> get serializer => _$appUserSerializer;
}
