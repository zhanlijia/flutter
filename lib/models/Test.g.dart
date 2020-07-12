// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Test.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Test _$TestFromJson(Map<String, dynamic> json) {
  return Test()
    ..name = json['name'] as String
    ..father = json['father']
    ..friends = json['friends'] as List
    ..keywords = (json['keywords'] as List)?.map((e) => e as String)?.toList()
    ..age = json['age'] as num;
}

Map<String, dynamic> _$TestToJson(Test instance) => <String, dynamic>{
      'name': instance.name,
      'father': instance.father,
      'friends': instance.friends,
      'keywords': instance.keywords,
      'age': instance.age
    };
