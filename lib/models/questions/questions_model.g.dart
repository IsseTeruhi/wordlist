// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Questions _$$_QuestionsFromJson(Map<String, dynamic> json) => _$_Questions(
      id: json['id'] as String,
      state: json['state'] as String,
      image: json['image'] as String,
      option:
          (json['option'] as List<dynamic>).map((e) => e as String).toList(),
      answer: json['answer'] as String,
      explain: json['explain'] as String,
      noteid: json['noteid'] as String,
    );

Map<String, dynamic> _$$_QuestionsToJson(_$_Questions instance) =>
    <String, dynamic>{
      'id': instance.id,
      'state': instance.state,
      'image': instance.image,
      'option': instance.option,
      'answer': instance.answer,
      'explain': instance.explain,
      'noteid': instance.noteid,
    };
