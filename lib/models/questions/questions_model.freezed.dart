// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'questions_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Questions _$QuestionsFromJson(Map<String, dynamic> json) {
  return _Questions.fromJson(json);
}

/// @nodoc
mixin _$Questions {
  String get id => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  List<String> get option => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;
  String get explain => throw _privateConstructorUsedError;
  String get noteid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionsCopyWith<Questions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionsCopyWith<$Res> {
  factory $QuestionsCopyWith(Questions value, $Res Function(Questions) then) =
      _$QuestionsCopyWithImpl<$Res, Questions>;
  @useResult
  $Res call(
      {String id,
      String state,
      String image,
      List<String> option,
      String answer,
      String explain,
      String noteid});
}

/// @nodoc
class _$QuestionsCopyWithImpl<$Res, $Val extends Questions>
    implements $QuestionsCopyWith<$Res> {
  _$QuestionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? state = null,
    Object? image = null,
    Object? option = null,
    Object? answer = null,
    Object? explain = null,
    Object? noteid = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      option: null == option
          ? _value.option
          : option // ignore: cast_nullable_to_non_nullable
              as List<String>,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      explain: null == explain
          ? _value.explain
          : explain // ignore: cast_nullable_to_non_nullable
              as String,
      noteid: null == noteid
          ? _value.noteid
          : noteid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionsCopyWith<$Res> implements $QuestionsCopyWith<$Res> {
  factory _$$_QuestionsCopyWith(
          _$_Questions value, $Res Function(_$_Questions) then) =
      __$$_QuestionsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String state,
      String image,
      List<String> option,
      String answer,
      String explain,
      String noteid});
}

/// @nodoc
class __$$_QuestionsCopyWithImpl<$Res>
    extends _$QuestionsCopyWithImpl<$Res, _$_Questions>
    implements _$$_QuestionsCopyWith<$Res> {
  __$$_QuestionsCopyWithImpl(
      _$_Questions _value, $Res Function(_$_Questions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? state = null,
    Object? image = null,
    Object? option = null,
    Object? answer = null,
    Object? explain = null,
    Object? noteid = null,
  }) {
    return _then(_$_Questions(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      option: null == option
          ? _value._option
          : option // ignore: cast_nullable_to_non_nullable
              as List<String>,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      explain: null == explain
          ? _value.explain
          : explain // ignore: cast_nullable_to_non_nullable
              as String,
      noteid: null == noteid
          ? _value.noteid
          : noteid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Questions implements _Questions {
  const _$_Questions(
      {required this.id,
      required this.state,
      required this.image,
      required final List<String> option,
      required this.answer,
      required this.explain,
      required this.noteid})
      : _option = option;

  factory _$_Questions.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionsFromJson(json);

  @override
  final String id;
  @override
  final String state;
  @override
  final String image;
  final List<String> _option;
  @override
  List<String> get option {
    if (_option is EqualUnmodifiableListView) return _option;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_option);
  }

  @override
  final String answer;
  @override
  final String explain;
  @override
  final String noteid;

  @override
  String toString() {
    return 'Questions(id: $id, state: $state, image: $image, option: $option, answer: $answer, explain: $explain, noteid: $noteid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Questions &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other._option, _option) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.explain, explain) || other.explain == explain) &&
            (identical(other.noteid, noteid) || other.noteid == noteid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, state, image,
      const DeepCollectionEquality().hash(_option), answer, explain, noteid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionsCopyWith<_$_Questions> get copyWith =>
      __$$_QuestionsCopyWithImpl<_$_Questions>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestionsToJson(
      this,
    );
  }
}

abstract class _Questions implements Questions {
  const factory _Questions(
      {required final String id,
      required final String state,
      required final String image,
      required final List<String> option,
      required final String answer,
      required final String explain,
      required final String noteid}) = _$_Questions;

  factory _Questions.fromJson(Map<String, dynamic> json) =
      _$_Questions.fromJson;

  @override
  String get id;
  @override
  String get state;
  @override
  String get image;
  @override
  List<String> get option;
  @override
  String get answer;
  @override
  String get explain;
  @override
  String get noteid;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionsCopyWith<_$_Questions> get copyWith =>
      throw _privateConstructorUsedError;
}
