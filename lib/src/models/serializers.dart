library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:climbing_logbook/src/models/enums.dart';

import 'ClimbingRoute.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  ClimbingRoute,
  OutComeEnum,
  BelayingStyleEnum,
  GradingStyleEnum,
  ClosureEnum
])
final Serializers serializers = _$serializers;
