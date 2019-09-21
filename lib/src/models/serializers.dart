library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:climbing_logbook/src/models/enums.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'values.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  ClimbingRoute,
  AppUser,
  OutComeEnum,
  BelayingStyleEnum,
  GradingStyleEnum,
  ClosureEnum,
  Timestamp
])
final Serializers serializers = _$serializers;
