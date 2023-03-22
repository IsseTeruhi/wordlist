// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_screen_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ResultScreenState {
  List<Reports> get reportList => throw _privateConstructorUsedError;
  List<Questions> get quizList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResultScreenStateCopyWith<ResultScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultScreenStateCopyWith<$Res> {
  factory $ResultScreenStateCopyWith(
          ResultScreenState value, $Res Function(ResultScreenState) then) =
      _$ResultScreenStateCopyWithImpl<$Res, ResultScreenState>;
  @useResult
  $Res call({List<Reports> reportList, List<Questions> quizList});
}

/// @nodoc
class _$ResultScreenStateCopyWithImpl<$Res, $Val extends ResultScreenState>
    implements $ResultScreenStateCopyWith<$Res> {
  _$ResultScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportList = null,
    Object? quizList = null,
  }) {
    return _then(_value.copyWith(
      reportList: null == reportList
          ? _value.reportList
          : reportList // ignore: cast_nullable_to_non_nullable
              as List<Reports>,
      quizList: null == quizList
          ? _value.quizList
          : quizList // ignore: cast_nullable_to_non_nullable
              as List<Questions>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResultScreenStateCopyWith<$Res>
    implements $ResultScreenStateCopyWith<$Res> {
  factory _$$_ResultScreenStateCopyWith(_$_ResultScreenState value,
          $Res Function(_$_ResultScreenState) then) =
      __$$_ResultScreenStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Reports> reportList, List<Questions> quizList});
}

/// @nodoc
class __$$_ResultScreenStateCopyWithImpl<$Res>
    extends _$ResultScreenStateCopyWithImpl<$Res, _$_ResultScreenState>
    implements _$$_ResultScreenStateCopyWith<$Res> {
  __$$_ResultScreenStateCopyWithImpl(
      _$_ResultScreenState _value, $Res Function(_$_ResultScreenState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportList = null,
    Object? quizList = null,
  }) {
    return _then(_$_ResultScreenState(
      reportList: null == reportList
          ? _value._reportList
          : reportList // ignore: cast_nullable_to_non_nullable
              as List<Reports>,
      quizList: null == quizList
          ? _value._quizList
          : quizList // ignore: cast_nullable_to_non_nullable
              as List<Questions>,
    ));
  }
}

/// @nodoc

class _$_ResultScreenState implements _ResultScreenState {
  const _$_ResultScreenState(
      {required final List<Reports> reportList,
      required final List<Questions> quizList})
      : _reportList = reportList,
        _quizList = quizList;

  final List<Reports> _reportList;
  @override
  List<Reports> get reportList {
    if (_reportList is EqualUnmodifiableListView) return _reportList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reportList);
  }

  final List<Questions> _quizList;
  @override
  List<Questions> get quizList {
    if (_quizList is EqualUnmodifiableListView) return _quizList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quizList);
  }

  @override
  String toString() {
    return 'ResultScreenState(reportList: $reportList, quizList: $quizList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResultScreenState &&
            const DeepCollectionEquality()
                .equals(other._reportList, _reportList) &&
            const DeepCollectionEquality().equals(other._quizList, _quizList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_reportList),
      const DeepCollectionEquality().hash(_quizList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResultScreenStateCopyWith<_$_ResultScreenState> get copyWith =>
      __$$_ResultScreenStateCopyWithImpl<_$_ResultScreenState>(
          this, _$identity);
}

abstract class _ResultScreenState implements ResultScreenState {
  const factory _ResultScreenState(
      {required final List<Reports> reportList,
      required final List<Questions> quizList}) = _$_ResultScreenState;

  @override
  List<Reports> get reportList;
  @override
  List<Questions> get quizList;
  @override
  @JsonKey(ignore: true)
  _$$_ResultScreenStateCopyWith<_$_ResultScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
