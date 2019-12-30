// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'values.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Climb> _$climbSerializer = new _$ClimbSerializer();
Serializer<AppUser> _$appUserSerializer = new _$AppUserSerializer();

class _$ClimbSerializer implements StructuredSerializer<Climb> {
  @override
  final Iterable<Type> types = const [Climb, _$Climb];
  @override
  final String wireName = 'Climb';

  @override
  Iterable<Object> serialize(Serializers serializers, Climb object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'outCome',
      serializers.serialize(object.outCome,
          specifiedType: const FullType(OutComeEnum)),
      'gradingStyle',
      serializers.serialize(object.gradingStyle,
          specifiedType: const FullType(GradingStyleEnum)),
      'grade',
      serializers.serialize(object.grade,
          specifiedType: const FullType(String)),
      'belayingStyle',
      serializers.serialize(object.belayingStyle,
          specifiedType: const FullType(BelayingStyleEnum)),
      'loggedDate',
      serializers.serialize(object.loggedDate,
          specifiedType: const FullType(DateTime)),
    ];
    if (object.documentId != null) {
      result
        ..add('documentId')
        ..add(serializers.serialize(object.documentId,
            specifiedType: const FullType(String)));
    }
    if (object.uid != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(object.uid,
            specifiedType: const FullType(String)));
    }
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
    if (object.comment != null) {
      result
        ..add('comment')
        ..add(serializers.serialize(object.comment,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Climb deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ClimbBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'documentId':
          result.documentId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
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
        case 'loggedDate':
          result.loggedDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'comment':
          result.comment = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AppUserSerializer implements StructuredSerializer<AppUser> {
  @override
  final Iterable<Type> types = const [AppUser, _$AppUser];
  @override
  final String wireName = 'AppUser';

  @override
  Iterable<Object> serialize(Serializers serializers, AppUser object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.uid != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(object.uid,
            specifiedType: const FullType(String)));
    }
    if (object.displayName != null) {
      result
        ..add('displayName')
        ..add(serializers.serialize(object.displayName,
            specifiedType: const FullType(String)));
    }
    if (object.photoUrl != null) {
      result
        ..add('photoUrl')
        ..add(serializers.serialize(object.photoUrl,
            specifiedType: const FullType(String)));
    }
    if (object.email != null) {
      result
        ..add('email')
        ..add(serializers.serialize(object.email,
            specifiedType: const FullType(String)));
    }
    if (object.tags != null) {
      result
        ..add('tags')
        ..add(serializers.serialize(object.tags,
            specifiedType:
                const FullType(BuiltSet, const [const FullType(String)])));
    }
    if (object.lastLogin != null) {
      result
        ..add('lastLogin')
        ..add(serializers.serialize(object.lastLogin,
            specifiedType: const FullType(DateTime)));
    }
    if (object.lastClimb != null) {
      result
        ..add('lastClimb')
        ..add(serializers.serialize(object.lastClimb,
            specifiedType: const FullType(Climb)));
    }
    if (object.bestClimb != null) {
      result
        ..add('bestClimb')
        ..add(serializers.serialize(object.bestClimb,
            specifiedType: const FullType(Climb)));
    }
    if (object.totalNumOfClimbs != null) {
      result
        ..add('totalNumOfClimbs')
        ..add(serializers.serialize(object.totalNumOfClimbs,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  AppUser deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppUserBuilder();

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
        case 'lastClimb':
          result.lastClimb.replace(serializers.deserialize(value,
              specifiedType: const FullType(Climb)) as Climb);
          break;
        case 'bestClimb':
          result.bestClimb.replace(serializers.deserialize(value,
              specifiedType: const FullType(Climb)) as Climb);
          break;
        case 'totalNumOfClimbs':
          result.totalNumOfClimbs = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$Climb extends Climb {
  @override
  final String documentId;
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
  @override
  final DateTime loggedDate;
  @override
  final String comment;

  factory _$Climb([void Function(ClimbBuilder) updates]) =>
      (new ClimbBuilder()..update(updates)).build();

  _$Climb._(
      {this.documentId,
      this.outCome,
      this.uid,
      this.gradingStyle,
      this.grade,
      this.belayingStyle,
      this.closure,
      this.tags,
      this.loggedDate,
      this.comment})
      : super._() {
    if (outCome == null) {
      throw new BuiltValueNullFieldError('Climb', 'outCome');
    }
    if (gradingStyle == null) {
      throw new BuiltValueNullFieldError('Climb', 'gradingStyle');
    }
    if (grade == null) {
      throw new BuiltValueNullFieldError('Climb', 'grade');
    }
    if (belayingStyle == null) {
      throw new BuiltValueNullFieldError('Climb', 'belayingStyle');
    }
    if (loggedDate == null) {
      throw new BuiltValueNullFieldError('Climb', 'loggedDate');
    }
  }

  @override
  Climb rebuild(void Function(ClimbBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClimbBuilder toBuilder() => new ClimbBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Climb &&
        documentId == other.documentId &&
        outCome == other.outCome &&
        uid == other.uid &&
        gradingStyle == other.gradingStyle &&
        grade == other.grade &&
        belayingStyle == other.belayingStyle &&
        closure == other.closure &&
        tags == other.tags &&
        loggedDate == other.loggedDate &&
        comment == other.comment;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc($jc(0, documentId.hashCode),
                                        outCome.hashCode),
                                    uid.hashCode),
                                gradingStyle.hashCode),
                            grade.hashCode),
                        belayingStyle.hashCode),
                    closure.hashCode),
                tags.hashCode),
            loggedDate.hashCode),
        comment.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Climb')
          ..add('documentId', documentId)
          ..add('outCome', outCome)
          ..add('uid', uid)
          ..add('gradingStyle', gradingStyle)
          ..add('grade', grade)
          ..add('belayingStyle', belayingStyle)
          ..add('closure', closure)
          ..add('tags', tags)
          ..add('loggedDate', loggedDate)
          ..add('comment', comment))
        .toString();
  }
}

class ClimbBuilder implements Builder<Climb, ClimbBuilder> {
  _$Climb _$v;

  String _documentId;
  String get documentId => _$this._documentId;
  set documentId(String documentId) => _$this._documentId = documentId;

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

  DateTime _loggedDate;
  DateTime get loggedDate => _$this._loggedDate;
  set loggedDate(DateTime loggedDate) => _$this._loggedDate = loggedDate;

  String _comment;
  String get comment => _$this._comment;
  set comment(String comment) => _$this._comment = comment;

  ClimbBuilder();

  ClimbBuilder get _$this {
    if (_$v != null) {
      _documentId = _$v.documentId;
      _outCome = _$v.outCome;
      _uid = _$v.uid;
      _gradingStyle = _$v.gradingStyle;
      _grade = _$v.grade;
      _belayingStyle = _$v.belayingStyle;
      _closure = _$v.closure;
      _tags = _$v.tags?.toBuilder();
      _loggedDate = _$v.loggedDate;
      _comment = _$v.comment;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Climb other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Climb;
  }

  @override
  void update(void Function(ClimbBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Climb build() {
    _$Climb _$result;
    try {
      _$result = _$v ??
          new _$Climb._(
              documentId: documentId,
              outCome: outCome,
              uid: uid,
              gradingStyle: gradingStyle,
              grade: grade,
              belayingStyle: belayingStyle,
              closure: closure,
              tags: _tags?.build(),
              loggedDate: loggedDate,
              comment: comment);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'tags';
        _tags?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Climb', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$AppUser extends AppUser {
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
  @override
  final Climb lastClimb;
  @override
  final Climb bestClimb;
  @override
  final int totalNumOfClimbs;

  factory _$AppUser([void Function(AppUserBuilder) updates]) =>
      (new AppUserBuilder()..update(updates)).build();

  _$AppUser._(
      {this.uid,
      this.displayName,
      this.photoUrl,
      this.email,
      this.tags,
      this.lastLogin,
      this.lastClimb,
      this.bestClimb,
      this.totalNumOfClimbs})
      : super._();

  @override
  AppUser rebuild(void Function(AppUserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppUserBuilder toBuilder() => new AppUserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppUser &&
        uid == other.uid &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        email == other.email &&
        tags == other.tags &&
        lastLogin == other.lastLogin &&
        lastClimb == other.lastClimb &&
        bestClimb == other.bestClimb &&
        totalNumOfClimbs == other.totalNumOfClimbs;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, uid.hashCode), displayName.hashCode),
                                photoUrl.hashCode),
                            email.hashCode),
                        tags.hashCode),
                    lastLogin.hashCode),
                lastClimb.hashCode),
            bestClimb.hashCode),
        totalNumOfClimbs.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppUser')
          ..add('uid', uid)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('email', email)
          ..add('tags', tags)
          ..add('lastLogin', lastLogin)
          ..add('lastClimb', lastClimb)
          ..add('bestClimb', bestClimb)
          ..add('totalNumOfClimbs', totalNumOfClimbs))
        .toString();
  }
}

class AppUserBuilder implements Builder<AppUser, AppUserBuilder> {
  _$AppUser _$v;

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

  ClimbBuilder _lastClimb;
  ClimbBuilder get lastClimb => _$this._lastClimb ??= new ClimbBuilder();
  set lastClimb(ClimbBuilder lastClimb) => _$this._lastClimb = lastClimb;

  ClimbBuilder _bestClimb;
  ClimbBuilder get bestClimb => _$this._bestClimb ??= new ClimbBuilder();
  set bestClimb(ClimbBuilder bestClimb) => _$this._bestClimb = bestClimb;

  int _totalNumOfClimbs;
  int get totalNumOfClimbs => _$this._totalNumOfClimbs;
  set totalNumOfClimbs(int totalNumOfClimbs) =>
      _$this._totalNumOfClimbs = totalNumOfClimbs;

  AppUserBuilder();

  AppUserBuilder get _$this {
    if (_$v != null) {
      _uid = _$v.uid;
      _displayName = _$v.displayName;
      _photoUrl = _$v.photoUrl;
      _email = _$v.email;
      _tags = _$v.tags?.toBuilder();
      _lastLogin = _$v.lastLogin;
      _lastClimb = _$v.lastClimb?.toBuilder();
      _bestClimb = _$v.bestClimb?.toBuilder();
      _totalNumOfClimbs = _$v.totalNumOfClimbs;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppUser other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppUser;
  }

  @override
  void update(void Function(AppUserBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppUser build() {
    _$AppUser _$result;
    try {
      _$result = _$v ??
          new _$AppUser._(
              uid: uid,
              displayName: displayName,
              photoUrl: photoUrl,
              email: email,
              tags: _tags?.build(),
              lastLogin: lastLogin,
              lastClimb: _lastClimb?.build(),
              bestClimb: _bestClimb?.build(),
              totalNumOfClimbs: totalNumOfClimbs);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'tags';
        _tags?.build();

        _$failedField = 'lastClimb';
        _lastClimb?.build();
        _$failedField = 'bestClimb';
        _bestClimb?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppUser', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
