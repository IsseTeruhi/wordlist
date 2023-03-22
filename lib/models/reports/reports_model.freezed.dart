// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reports_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Reports _$ReportsFromJson(Map<String, dynamic> json) {
  return _Reports.fromJson(json);
}

/// @nodoc
mixin _$Reports {
  String get id => throw _privateConstructorUsedError;
  String get noteid => throw _privateConstructorUsedError;
  String get questionid => throw _privateConstructorUsedError;
  String get selected => throw _privateConstructorUsedError;
  bool get iscorrect => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportsCopyWith<Reports> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportsCopyWith<$Res> {
  factory $ReportsCopyWith(Reports value, $Res Function(Reports) then) =
      _$ReportsCopyWithImpl<$Res, Reports>;
  @useResult
  $Res call(
      {String id,
      String noteid,
      String questionid,
      String selected,
      bool iscorrect,
      DateTime timestamp});
}

/// @nodoc
class _$ReportsCopyWithImpl<$Res, $Val extends Reports>
    implements $ReportsCopyWith<$Res> {
  _$ReportsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? noteid = null,
    Object? questionid = null,
    Object? selected = null,
    Object? iscorrect = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      noteid: null == noteid
          ? _value.noteid
          : noteid // ignore: cast_nullable_to_non_nullable
              as String,
      questionid: null == questionid
          ? _value.questionid
          : questionid // ignore: cast_nullable_to_non_nullable
              as String,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as String,
      iscorrect: null == iscorrect
          ? _value.iscorrect
          : iscorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReportsCopyWith<$Res> implements $ReportsCopyWith<$Res> {
  factory _$$_ReportsCopyWith(
          _$_Reports value, $Res Function(_$_Reports) then) =
      __$$_ReportsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String noteid,
      String questionid,
      String selected,
      bool iscorrect,
      DateTime timestamp});
}

/// @nodoc
class __$$_ReportsCopyWithImpl<$Res>
    extends _$ReportsCopyWithImpl<$Res, _$_Reports>
    implements _$$_ReportsCopyWith<$Res> {
  __$$_ReportsCopyWithImpl(_$_Reports _value, $Res Function(_$_Reports) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? noteid = null,
    Object? questionid = null,
    Object? selected = null,
    Object? iscorrect = null,
    Object? timestamp = null,
  }) {
    return _then(_$_Reports(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      noteid: null == noteid
          ? _value.noteid
          : noteid // ignore: cast_nullable_to_non_nullable
              as String,
      questionid: null == questionid
          ? _value.questionid
          : questionid // ignore: cast_nullable_to_non_nullable
              as String,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as String,
      iscorrect: null == iscorrect
          ? _value.iscorrect
          : iscorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Reports implements _Reports {
  const _$_Reports(
      {required this.id,
      required this.noteid,
      required this.questionid,
      required this.selected,
      required this.iscorrect,
      required this.timestamp});

  factory _$_Reports.fromJson(Map<String, dynamic> json) =>
      _$$_ReportsFromJson(json);

  @override
  final String id;
  @override
  final String noteid;
  @override
  final String questionid;
  @override
  final String selected;
  @override
  final bool iscorrect;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'Reports(id: $id, noteid: $noteid, questionid: $questionid, selected: $selected, iscorrect: $iscorrect, timestamp: $timestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Reports &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.noteid, noteid) || other.noteid == noteid) &&
            (identical(other.questionid, questionid) ||
                other.questionid == questionid) &&
            (identical(other.selected, selected) ||
                other.selected == selected) &&
            (identical(other.iscorrect, iscorrect) ||
                other.iscorrect == iscorrect) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, noteid, questionid, selected, iscorrect, timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReportsCopyWith<_$_Reports> get copyWith =>
      __$$_ReportsCopyWithImpl<_$_Reports>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReportsToJson(
      this,
    );
  }
}

abstract class _Reports implements Reports {
  const factory _Reports(
      {required final String id,
      required final String noteid,
      required final String questionid,
      required final String selected,
      required final bool iscorrect,
      required final DateTime timestamp}) = _$_Reports;

  factory _Reports.fromJson(Map<String, dynamic> json) = _$_Reports.fromJson;

  @override
  String get id;
  @override
  String get noteid;
  @override
  String get questionid;
  @override
  String get selected;
  @override
  bool get iscorrect;
  @override
  DateTime get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$_ReportsCopyWith<_$_Reports> get copyWith =>
      throw _privateConstructorUsedError;
}
