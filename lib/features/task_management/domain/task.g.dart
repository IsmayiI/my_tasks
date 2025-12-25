// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Task _$TaskFromJson(Map<String, dynamic> json) => _Task(
  id: json['id'] as String? ?? '',
  title: json['title'] as String,
  description: json['description'] as String,
  priority: json['priority'] as String,
  date: json['date'] as String,
  isComplete: json['isComplete'] as bool? ?? false,
);

Map<String, dynamic> _$TaskToJson(_Task instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'priority': instance.priority,
  'date': instance.date,
  'isComplete': instance.isComplete,
};
