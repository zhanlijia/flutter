import 'package:json_annotation/json_annotation.dart';

part 'TestDel.g.dart';

@JsonSerializable()
class TestDel {
    TestDel();

    String property;
    
    factory TestDel.fromJson(Map<String,dynamic> json) => _$TestDelFromJson(json);
    Map<String, dynamic> toJson() => _$TestDelToJson(this);
}
