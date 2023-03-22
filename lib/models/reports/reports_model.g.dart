// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reports_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Reports _$$_ReportsFromJson(Map<String, dynamic> json) => _$_Reports(
      id: json['id'] as String,
      noteid: json['noteid'] as String,
      questionid: json['questionid'] as String,
      selected: json['selected'] as String,
      iscorrect: json['iscorrect'] as bool,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$_ReportsToJson(_$_Reports instance) =>
    <String, dynamic>{
      'id': instance.id,
      'noteid': instance.noteid,
      'questionid': instance.questionid,
      'selected': instance.selected,
      'iscorrect': instance.iscorrect,
      'timestamp': instance.timestamp.toIso8601String(),
    };
