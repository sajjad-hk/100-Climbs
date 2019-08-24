// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'values.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ClimbingRoute> _$climbingRouteSerializer =
    new _$ClimbingRouteSerializer();
Serializer<ClimbingLogBookUser> _$climbingLogBookUserSerializer =
    new _$ClimbingLogBookUserSerializer();

class _$ClimbingRouteSerializer implements StructuredSerializer<ClimbingRoute> {
  @override
  final Iterable<Type> types = const [ClimbingRoute, _$ClimbingRoute];
  @override
  final String wireName = 'ClimbingRoute';

  @override
  Iterable<Object> serialize(Serializers serializers, ClimbingRoute object,
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
    ];
    if (object.closure != null) {
      result
        ..add('closure')
        ..add(serializers.serialize(object.closure,
            specifiedType: const FullType(ClosureEnum)));
    }
    if (object.tags != null) {
      result
        ..add('tags')
        ..add(serializers.serialize(object.tags,
            specifiedType:
                const FullType(BuiltSet, const [const FullType(String)])));
    }
    return result;
  }

  @override
  ClimbingRoute deserialize(
      Serializers serializers, Iterable<Object> serialized,
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
              as BuiltSet<dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$ClimbingLogBookUserSerializer
    implements StructuredSerializer<ClimbingLogBookUser> {
  @override
  final Iterable<Type> types = const [
    ClimbingLogBookUser,
    _$ClimbingLogBookUser
  ];
  @override
  final String wireName = 'ClimbingLogBookUser';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ClimbingLogBookUser object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'uid',
      serializers.serialize(object.uid, specifiedType: const FullType(String)),
      'displayName',
      serializers.serialize(object.displayName,
          specifiedType: const FullType(String)),
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'lastLogin',
      serializers.serialize(object.lastLogin,
          specifiedType: const FullType(DateTime)),
    ];
    if (object.photoUrl != null) {
      result
        ..add('photoUrl')
        ..add(serializers.serialize(object.photoUrl,
            specifiedType: const FullType(String)));
    }
    if (object.tags != null) {
      result
        ..add('tags')
        ..add(serializers.serialize(object.tags,
            specifiedType:
                const FullType(BuiltSet, const [const FullType(String)])));
    }
    return result;
  }

  @override
  ClimbingLogBookUser deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ClimbingLogBookUserBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'displayName':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photoUrl':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'tags':
          result.tags.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltSet, const [const FullType(String)]))
              as BuiltSet<dynamic>);
          break;
        case 'lastLogin':
          result.lastLogin = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
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
              tags: _tags?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'tags';
        _tags?.build();
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

class _$ClimbingLogBookUser extends ClimbingLogBookUser {
  @override
  final String uid;
  @override
  final String displayName;
  @override
  final String photoUrl;
  @override
  final String email;
  @override
  final BuiltSet<String> tags;
  @override
  final DateTime lastLogin;

  factory _$ClimbingLogBookUser(
          [void Function(ClimbingLogBookUserBuilder) updates]) =>
      (new ClimbingLogBookUserBuilder()..update(updates)).build();

  _$ClimbingLogBookUser._(
      {this.uid,
      this.displayName,
      this.photoUrl,
      this.email,
      this.tags,
      this.lastLogin})
      : super._() {
    if (uid == null) {
      throw new BuiltValueNullFieldError('ClimbingLogBookUser', 'uid');
    }
    if (displayName == null) {
      throw new BuiltValueNullFieldError('ClimbingLogBookUser', 'displayName');
    }
    if (email == null) {
      throw new BuiltValueNullFieldError('ClimbingLogBookUser', 'email');
    }
    if (lastLogin == null) {
      throw new BuiltValueNullFieldError('ClimbingLogBookUser', 'lastLogin');
    }
  }

  @override
  ClimbingLogBookUser rebuild(
          void Function(ClimbingLogBookUserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClimbingLogBookUserBuilder toBuilder() =>
      new ClimbingLogBookUserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClimbingLogBookUser &&
        uid == other.uid &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        email == other.email &&
        tags == other.tags &&
        lastLogin == other.lastLogin;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, uid.hashCode), displayName.hashCode),
                    photoUrl.hashCode),
                email.hashCode),
            tags.hashCode),
        lastLogin.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ClimbingLogBookUser')
          ..add('uid', uid)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('email', email)
          ..add('tags', tags)
          ..add('lastLogin', lastLogin))
        .toString();
  }
}

class ClimbingLogBookUserBuilder
    implements Builder<ClimbingLogBookUser, ClimbingLogBookUserBuilder> {
  _$ClimbingLogBookUser _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _displayName;
  String get displayName => _$this._displayName;
  set displayName(String displayName) => _$this._displayName = displayName;

  String _photoUrl;
  String get photoUrl => _$this._photoUrl;
  set photoUrl(String photoUrl) => _$this._photoUrl = photoUrl;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  SetBuilder<String> _tags;
  SetBuilder<String> get tags => _$this._tags ??= new SetBuilder<String>();
  set tags(SetBuilder<String> tags) => _$this._tags = tags;

  DateTime _lastLogin;
  DateTime get lastLogin => _$this._lastLogin;
  set lastLogin(DateTime lastLogin) => _$this._lastLogin = lastLogin;

  ClimbingLogBookUserBuilder();

  ClimbingLogBookUserBuilder get _$this {
    if (_$v != null) {
      _uid = _$v.uid;
      _displayName = _$v.displayName;
      _photoUrl = _$v.photoUrl;
      _email = _$v.email;
      _tags = _$v.tags?.toBuilder();
      _lastLogin = _$v.lastLogin;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClimbingLogBookUser other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ClimbingLogBookUser;
  }

  @override
  void update(void Function(ClimbingLogBookUserBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ClimbingLogBookUser build() {
    _$ClimbingLogBookUser _$result;
    try {
      _$result = _$v ??
          new _$ClimbingLogBookUser._(
              uid: uid,
              displayName: displayName,
              photoUrl: photoUrl,
              email: email,
              tags: _tags?.build(),
              lastLogin: lastLogin);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'tags';
        _tags?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ClimbingLogBookUser', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
