// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'values.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ClimbingRoute> _$climbingRouteSerializer =
    new _$ClimbingRouteSerializer();

class _$ClimbingRouteSerializer implements StructuredSerializer<ClimbingRoute> {
  @override
  final Iterable<Type> types = const [ClimbingRoute, _$ClimbingRoute];
  @override
  final String wireName = 'ClimbingRoute';

  @override
  Iterable serialize(Serializers serializers, ClimbingRoute object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'outCome',
      serializers.serialize(object.outCome,
          specifiedType: const FullType(OutComeEnum)),
      'uid',
      serializers.serialize(object.uid, specifiedType: const FullType(String)),
      'gradingStyle',
      serializers.serialize(object.gradingStyle,
          specifiedType: const FullType(GradingStyleEnum)),
      'grade',
      serializers.serialize(object.grade,
          specifiedType: const FullType(String)),
      'belayingStyle',
      serializers.serialize(object.belayingStyle,
          specifiedType: const FullType(BelayingStyleEnum)),
      'tags',
      serializers.serialize(object.tags,
          specifiedType:
              const FullType(BuiltSet, const [const FullType(String)])),
    ];
    if (object.closure != null) {
      result
        ..add('closure')
        ..add(serializers.serialize(object.closure,
            specifiedType: const FullType(ClosureEnum)));
    }
    return result;
  }

  @override
  ClimbingRoute deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ClimbingRouteBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'outCome':
          result.outCome = serializers.deserialize(value,
              specifiedType: const FullType(OutComeEnum)) as OutComeEnum;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'gradingStyle':
          result.gradingStyle = serializers.deserialize(value,
                  specifiedType: const FullType(GradingStyleEnum))
              as GradingStyleEnum;
          break;
        case 'grade':
          result.grade = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'belayingStyle':
          result.belayingStyle = serializers.deserialize(value,
                  specifiedType: const FullType(BelayingStyleEnum))
              as BelayingStyleEnum;
          break;
        case 'closure':
          result.closure = serializers.deserialize(value,
              specifiedType: const FullType(ClosureEnum)) as ClosureEnum;
          break;
        case 'tags':
          result.tags.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltSet, const [const FullType(String)]))
              as BuiltSet);
          break;
      }
    }

    return result.build();
  }
}

class _$ClimbingRoute extends ClimbingRoute {
  @override
  final OutComeEnum outCome;
  @override
  final String uid;
  @override
  final GradingStyleEnum gradingStyle;
  @override
  final String grade;
  @override
  final BelayingStyleEnum belayingStyle;
  @override
  final ClosureEnum closure;
  @override
  final BuiltSet<String> tags;

  factory _$ClimbingRoute([void Function(ClimbingRouteBuilder) updates]) =>
      (new ClimbingRouteBuilder()..update(updates)).build();

  _$ClimbingRoute._(
      {this.outCome,
      this.uid,
      this.gradingStyle,
      this.grade,
      this.belayingStyle,
      this.closure,
      this.tags})
      : super._() {
    if (outCome == null) {
      throw new BuiltValueNullFieldError('ClimbingRoute', 'outCome');
    }
    if (uid == null) {
      throw new BuiltValueNullFieldError('ClimbingRoute', 'uid');
    }
    if (gradingStyle == null) {
      throw new BuiltValueNullFieldError('ClimbingRoute', 'gradingStyle');
    }
    if (grade == null) {
      throw new BuiltValueNullFieldError('ClimbingRoute', 'grade');
    }
    if (belayingStyle == null) {
      throw new BuiltValueNullFieldError('ClimbingRoute', 'belayingStyle');
    }
    if (tags == null) {
      throw new BuiltValueNullFieldError('ClimbingRoute', 'tags');
    }
  }

  @override
  ClimbingRoute rebuild(void Function(ClimbingRouteBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClimbingRouteBuilder toBuilder() => new ClimbingRouteBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClimbingRoute &&
        outCome == other.outCome &&
        uid == other.uid &&
        gradingStyle == other.gradingStyle &&
        grade == other.grade &&
        belayingStyle == other.belayingStyle &&
        closure == other.closure &&
        tags == other.tags;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, outCome.hashCode), uid.hashCode),
                        gradingStyle.hashCode),
                    grade.hashCode),
                belayingStyle.hashCode),
            closure.hashCode),
        tags.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ClimbingRoute')
          ..add('outCome', outCome)
          ..add('uid', uid)
          ..add('gradingStyle', gradingStyle)
          ..add('grade', grade)
          ..add('belayingStyle', belayingStyle)
          ..add('closure', closure)
          ..add('tags', tags))
        .toString();
  }
}

class ClimbingRouteBuilder
    implements Builder<ClimbingRoute, ClimbingRouteBuilder> {
  _$ClimbingRoute _$v;

  OutComeEnum _outCome;
  OutComeEnum get outCome => _$this._outCome;
  set outCome(OutComeEnum outCome) => _$this._outCome = outCome;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  GradingStyleEnum _gradingStyle;
  GradingStyleEnum get gradingStyle => _$this._gradingStyle;
  set gradingStyle(GradingStyleEnum gradingStyle) =>
      _$this._gradingStyle = gradingStyle;

  String _grade;
  String get grade => _$this._grade;
  set grade(String grade) => _$this._grade = grade;

  BelayingStyleEnum _belayingStyle;
  BelayingStyleEnum get belayingStyle => _$this._belayingStyle;
  set belayingStyle(BelayingStyleEnum belayingStyle) =>
      _$this._belayingStyle = belayingStyle;

  ClosureEnum _closure;
  ClosureEnum get closure => _$this._closure;
  set closure(ClosureEnum closure) => _$this._closure = closure;

  SetBuilder<String> _tags;
  SetBuilder<String> get tags => _$this._tags ??= new SetBuilder<String>();
  set tags(SetBuilder<String> tags) => _$this._tags = tags;

  ClimbingRouteBuilder();

  ClimbingRouteBuilder get _$this {
    if (_$v != null) {
      _outCome = _$v.outCome;
      _uid = _$v.uid;
      _gradingStyle = _$v.gradingStyle;
      _grade = _$v.grade;
      _belayingStyle = _$v.belayingStyle;
      _closure = _$v.closure;
      _tags = _$v.tags?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClimbingRoute other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ClimbingRoute;
  }

  @override
  void update(void Function(ClimbingRouteBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ClimbingRoute build() {
    _$ClimbingRoute _$result;
    try {
      _$result = _$v ??
          new _$ClimbingRoute._(
              outCome: outCome,
              uid: uid,
              gradingStyle: gradingStyle,
              grade: grade,
              belayingStyle: belayingStyle,
              closure: closure,
              tags: tags.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'tags';
        tags.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ClimbingRoute', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
