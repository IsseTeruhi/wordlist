// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_screen_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QuizScreenState {
  List<Reports> get reportList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuizScreenStateCopyWith<QuizScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizScreenStateCopyWith<$Res> {
  factory $QuizScreenStateCopyWith(
          QuizScreenState value, $Res Function(QuizScreenState) then) =
      _$QuizScreenStateCopyWithImpl<$Res, QuizScreenState>;
  @useResult
  $Res call({List<Reports> reportList});
}

/// @nodoc
class _$QuizScreenStateCopyWithImpl<$Res, $Val extends QuizScreenState>
    implements $QuizScreenStateCopyWith<$Res> {
  _$QuizScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportList = null,
  }) {
    return _then(_value.copyWith(
      reportList: null == reportList
          ? _value.reportList
          : reportList // ignore: cast_nullable_to_non_nullable
              as List<Reports>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuizScreenStateCopyWith<$Res>
    implements $QuizScreenStateCopyWith<$Res> {
  factory _$$_QuizScreenStateCopyWith(
          _$_QuizScreenState value, $Res Function(_$_QuizScreenState) then) =
      __$$_QuizScreenStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Reports> reportList});
}

/// @nodoc
class __$$_QuizScreenStateCopyWithImpl<$Res>
    extends _$QuizScreenStateCopyWithImpl<$Res, _$_QuizScreenState>
    implements _$$_QuizScreenStateCopyWith<$Res> {
  __$$_QuizScreenStateCopyWithImpl(
      _$_QuizScreenState _value, $Res Function(_$_QuizScreenState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportList = null,
  }) {
    return _then(_$_QuizScreenState(
      reportList: null == reportList
          ? _value._reportList
          : reportList // ignore: cast_nullable_to_non_nullable
              as List<Reports>,
    ));
  }
}

/// @nodoc

class _$_QuizScreenState implements _QuizScreenState {
  const _$_QuizScreenState({required final List<Reports> reportList})
      : _reportList = reportList;

  final List<Reports> _reportList;
  @override
  List<Reports> get reportList {
    if (_reportList is EqualUnmodifiableListView) return _reportList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reportList);
  }

  @override
  String toString() {
    return 'QuizScreenState(reportList: $reportList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuizScreenState &&
            const DeepCollectionEquality()
                .equals(other._reportList, _reportList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_reportList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuizScreenStateCopyWith<_$_QuizScreenState> get copyWith =>
      __$$_QuizScreenStateCopyWithImpl<_$_QuizScreenState>(this, _$identity);
}

abstract class _QuizScreenState implements QuizScreenState {
  const factory _QuizScreenState({required final List<Reports> reportList}) =
      _$_QuizScreenState;

  @override
  List<Reports> get reportList;
  @override
  @JsonKey(ignore: true)
  _$$_QuizScreenStateCopyWith<_$_QuizScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
