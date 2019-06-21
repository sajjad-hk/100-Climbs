// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enums.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const OutComeEnum _$success = const OutComeEnum._('success');
const OutComeEnum _$failure = const OutComeEnum._('failure');

OutComeEnum _$valueOfOutCome(String name) {
  switch (name) {
    case 'success':
      return _$success;
    case 'failure':
      return _$failure;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<OutComeEnum> _$outComeValues =
    new BuiltSet<OutComeEnum>(const <OutComeEnum>[
  _$success,
  _$failure,
]);

const GradingStyleEnum _$french = const GradingStyleEnum._('french');
const GradingStyleEnum _$polish = const GradingStyleEnum._('polish');

GradingStyleEnum _$valueOfGradingStyle(String name) {
  switch (name) {
    case 'french':
      return _$french;
    case 'polish':
      return _$polish;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<GradingStyleEnum> _$gradingStyleValues =
    new BuiltSet<GradingStyleEnum>(const <GradingStyleEnum>[
  _$french,
  _$polish,
]);

const BelayingStyleEnum _$lead = const BelayingStyleEnum._('lead');
const BelayingStyleEnum _$auto = const BelayingStyleEnum._('auto');
const BelayingStyleEnum _$toprope = const BelayingStyleEnum._('toprope');

BelayingStyleEnum _$valueOfBelayingStyle(String name) {
  switch (name) {
    case 'lead':
      return _$lead;
    case 'auto':
      return _$auto;
    case 'toprope':
      return _$toprope;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<BelayingStyleEnum> _$belayingStyleValues =
    new BuiltSet<BelayingStyleEnum>(const <BelayingStyleEnum>[
  _$lead,
  _$auto,
  _$toprope,
]);

const ClosureEnum _$onsight = const ClosureEnum._('onsight');
const ClosureEnum _$flash = const ClosureEnum._('flash');

ClosureEnum _$valueOfClosure(String name) {
  switch (name) {
    case 'onsight':
      return _$onsight;
    case 'flash':
      return _$flash;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<ClosureEnum> _$closureValues =
    new BuiltSet<ClosureEnum>(const <ClosureEnum>[
  _$onsight,
  _$flash,
]);

Serializer<OutComeEnum> _$outComeEnumSerializer = new _$OutComeEnumSerializer();
Serializer<GradingStyleEnum> _$gradingStyleEnumSerializer =
    new _$GradingStyleEnumSerializer();
Serializer<BelayingStyleEnum> _$belayingStyleEnumSerializer =
    new _$BelayingStyleEnumSerializer();
Serializer<ClosureEnum> _$closureEnumSerializer = new _$ClosureEnumSerializer();

class _$OutComeEnumSerializer implements PrimitiveSerializer<OutComeEnum> {
  @override
  final Iterable<Type> types = const <Type>[OutComeEnum];
  @override
  final String wireName = 'OutComeEnum';

  @override
  Object serialize(Serializers serializers, OutComeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  OutComeEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      OutComeEnum.valueOf(serialized as String);
}

class _$GradingStyleEnumSerializer
    implements PrimitiveSerializer<GradingStyleEnum> {
  @override
  final Iterable<Type> types = const <Type>[GradingStyleEnum];
  @override
  final String wireName = 'GradingStyleEnum';

  @override
  Object serialize(Serializers serializers, GradingStyleEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  GradingStyleEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      GradingStyleEnum.valueOf(serialized as String);
}

class _$BelayingStyleEnumSerializer
    implements PrimitiveSerializer<BelayingStyleEnum> {
  @override
  final Iterable<Type> types = const <Type>[BelayingStyleEnum];
  @override
  final String wireName = 'BelayingStyleEnum';

  @override
  Object serialize(Serializers serializers, BelayingStyleEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  BelayingStyleEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      BelayingStyleEnum.valueOf(serialized as String);
}

class _$ClosureEnumSerializer implements PrimitiveSerializer<ClosureEnum> {
  @override
  final Iterable<Type> types = const <Type>[ClosureEnum];
  @override
  final String wireName = 'ClosureEnum';

  @override
  Object serialize(Serializers serializers, ClosureEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  ClosureEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ClosureEnum.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
