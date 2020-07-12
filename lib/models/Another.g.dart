// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Another.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Another _$AnotherFromJson(Map<String, dynamic> json) {
  return Another()
    ..loved = json['+1'] as int
    ..name = json['name'] as String
    ..age = json['age'] as num;
}

Map<String, dynamic> _$AnotherToJson(Another instance) => <String, dynamic>{
      '+1': instance.loved,
      'name': instance.name,
      'age': instance.age
    };
