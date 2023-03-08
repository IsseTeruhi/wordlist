// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_quiz_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddQuizState {
  int get currentIndex => throw _privateConstructorUsedError;
  List<Questions> get quizList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddQuizStateCopyWith<AddQuizState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddQuizStateCopyWith<$Res> {
  factory $AddQuizStateCopyWith(
          AddQuizState value, $Res Function(AddQuizState) then) =
      _$AddQuizStateCopyWithImpl<$Res, AddQuizState>;
  @useResult
  $Res call({int currentIndex, List<Questions> quizList});
}

/// @nodoc
class _$AddQuizStateCopyWithImpl<$Res, $Val extends AddQuizState>
    implements $AddQuizStateCopyWith<$Res> {
  _$AddQuizStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentIndex = null,
    Object? quizList = null,
  }) {
    return _then(_value.copyWith(
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      quizList: null == quizList
          ? _value.quizList
          : quizList // ignore: cast_nullable_to_non_nullable
              as List<Questions>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddQuizStateCopyWith<$Res>
    implements $AddQuizStateCopyWith<$Res> {
  factory _$$_AddQuizStateCopyWith(
          _$_AddQuizState value, $Res Function(_$_AddQuizState) then) =
      __$$_AddQuizStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int currentIndex, List<Questions> quizList});
}

/// @nodoc
class __$$_AddQuizStateCopyWithImpl<$Res>
    extends _$AddQuizStateCopyWithImpl<$Res, _$_AddQuizState>
    implements _$$_AddQuizStateCopyWith<$Res> {
  __$$_AddQuizStateCopyWithImpl(
      _$_AddQuizState _value, $Res Function(_$_AddQuizState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentIndex = null,
    Object? quizList = null,
  }) {
    return _then(_$_AddQuizState(
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      quizList: null == quizList
          ? _value._quizList
          : quizList // ignore: cast_nullable_to_non_nullable
              as List<Questions>,
    ));
  }
}

/// @nodoc

class _$_AddQuizState implements _AddQuizState {
  const _$_AddQuizState(
      {required this.currentIndex, required final List<Questions> quizList})
      : _quizList = quizList;

  @override
  final int currentIndex;
  final List<Questions> _quizList;
  @override
  List<Questions> get quizList {
    if (_quizList is EqualUnmodifiableListView) return _quizList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quizList);
  }

  @override
  String toString() {
    return 'AddQuizState(currentIndex: $currentIndex, quizList: $quizList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddQuizState &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex) &&
            const DeepCollectionEquality().equals(other._quizList, _quizList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentIndex,
      const DeepCollectionEquality().hash(_quizList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddQuizStateCopyWith<_$_AddQuizState> get copyWith =>
      __$$_AddQuizStateCopyWithImpl<_$_AddQuizState>(this, _$identity);
}

abstract class _AddQuizState implements AddQuizState {
  const factory _AddQuizState(
      {required final int currentIndex,
      required final List<Questions> quizList}) = _$_AddQuizState;

  @override
  int get currentIndex;
  @override
  List<Questions> get quizList;
  @override
  @JsonKey(ignore: true)
  _$$_AddQuizStateCopyWith<_$_AddQuizState> get copyWith =>
      throw _privateConstructorUsedError;
}
