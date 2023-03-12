// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Notes _$$_NotesFromJson(Map<String, dynamic> json) => _$_Notes(
      text: json['text'] as String,
      addtime: DateTime.parse(json['addtime'] as String),
      id: json['id'] as String,
    );

Map<String, dynamic> _$$_NotesToJson(_$_Notes instance) => <String, dynamic>{
      'text': instance.text,
      'addtime': instance.addtime.toIso8601String(),
      'id': instance.id,
    };
