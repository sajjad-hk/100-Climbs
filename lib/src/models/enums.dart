import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'enums.g.dart';

class OutComeEnum extends EnumClass {
  static Serializer<OutComeEnum> get serializer => _$outComeEnumSerializer;

  static const OutComeEnum success = _$success;
  static const OutComeEnum failure = _$failure;

  const OutComeEnum._(String name) : super(name);

  static BuiltSet<OutComeEnum> get values => _$outComeValues;
  static OutComeEnum valueOf(String name) => _$valueOfOutCome(name);
}

class GradingStyleEnum extends EnumClass {
  static Serializer<GradingStyleEnum> get serializer =>
      _$gradingStyleEnumSerializer;

  static const GradingStyleEnum french = _$french;
  static const GradingStyleEnum polish = _$polish;

  const GradingStyleEnum._(String name) : super(name);

  static BuiltSet<GradingStyleEnum> get values => _$gradingStyleValues;
  static GradingStyleEnum valueOf(String name) => _$valueOfGradingStyle(name);
}

class BelayingStyleEnum extends EnumClass {
  static Serializer<BelayingStyleEnum> get serializer =>
      _$belayingStyleEnumSerializer;

  static const BelayingStyleEnum lead = _$lead;
  static const BelayingStyleEnum auto = _$auto;
  static const BelayingStyleEnum toprope = _$toprope;

  const BelayingStyleEnum._(String name) : super(name);

  static BuiltSet<BelayingStyleEnum> get values => _$belayingStyleValues;
  static BelayingStyleEnum valueOf(String name) => _$valueOfBelayingStyle(name);
}

class ClosureEnum extends EnumClass {
  static Serializer<ClosureEnum> get serializer => _$closureEnumSerializer;

  static const ClosureEnum onsight = _$onsight;
  static const ClosureEnum flash = _$flash;

  const ClosureEnum._(String name) : super(name);

  static BuiltSet<ClosureEnum> get values => _$closureValues;
  static ClosureEnum valueOf(String name) => _$valueOfClosure(name);
}
