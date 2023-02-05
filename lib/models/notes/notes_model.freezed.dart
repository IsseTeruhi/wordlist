// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notes_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Notes {
  String get text => throw _privateConstructorUsedError;
  DateTime get addtime => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  List<Questions> get qlist => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotesCopyWith<Notes> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotesCopyWith<$Res> {
  factory $NotesCopyWith(Notes value, $Res Function(Notes) then) =
      _$NotesCopyWithImpl<$Res, Notes>;
  @useResult
  $Res call({String text, DateTime addtime, String id, List<Questions> qlist});
}

/// @nodoc
class _$NotesCopyWithImpl<$Res, $Val extends Notes>
    implements $NotesCopyWith<$Res> {
  _$NotesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? addtime = null,
    Object? id = null,
    Object? qlist = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      addtime: null == addtime
          ? _value.addtime
          : addtime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      qlist: null == qlist
          ? _value.qlist
          : qlist // ignore: cast_nullable_to_non_nullable
              as List<Questions>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotesCopyWith<$Res> implements $NotesCopyWith<$Res> {
  factory _$$_NotesCopyWith(_$_Notes value, $Res Function(_$_Notes) then) =
      __$$_NotesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, DateTime addtime, String id, List<Questions> qlist});
}

/// @nodoc
class __$$_NotesCopyWithImpl<$Res> extends _$NotesCopyWithImpl<$Res, _$_Notes>
    implements _$$_NotesCopyWith<$Res> {
  __$$_NotesCopyWithImpl(_$_Notes _value, $Res Function(_$_Notes) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? addtime = null,
    Object? id = null,
    Object? qlist = null,
  }) {
    return _then(_$_Notes(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      addtime: null == addtime
          ? _value.addtime
          : addtime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      qlist: null == qlist
          ? _value._qlist
          : qlist // ignore: cast_nullable_to_non_nullable
              as List<Questions>,
    ));
  }
}

/// @nodoc

class _$_Notes implements _Notes {
  const _$_Notes(
      {required this.text,
      required this.addtime,
      required this.id,
      required final List<Questions> qlist})
      : _qlist = qlist;

  @override
  final String text;
  @override
  final DateTime addtime;
  @override
  final String id;
  final List<Questions> _qlist;
  @override
  List<Questions> get qlist {
    if (_qlist is EqualUnmodifiableListView) return _qlist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_qlist);
  }

  @override
  String toString() {
    return 'Notes(text: $text, addtime: $addtime, id: $id, qlist: $qlist)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Notes &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.addtime, addtime) || other.addtime == addtime) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._qlist, _qlist));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text, addtime, id,
      const DeepCollectionEquality().hash(_qlist));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotesCopyWith<_$_Notes> get copyWith =>
      __$$_NotesCopyWithImpl<_$_Notes>(this, _$identity);
}

abstract class _Notes implements Notes {
  const factory _Notes(
      {required final String text,
      required final DateTime addtime,
      required final String id,
      required final List<Questions> qlist}) = _$_Notes;

  @override
  String get text;
  @override
  DateTime get addtime;
  @override
  String get id;
  @override
  List<Questions> get qlist;
  @override
  @JsonKey(ignore: true)
  _$$_NotesCopyWith<_$_Notes> get copyWith =>
      throw _privateConstructorUsedError;
}
