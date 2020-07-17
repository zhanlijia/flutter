import 'package:json_annotation/json_annotation.dart';

part 'AnotherTest.g.dart';

@JsonSerializable()
class AnotherTest {
  String properties1;

  AnotherTest(this.properties1);

  factory AnotherTest.fromJson(Map<String, dynamic> json) =>
      _$AnotherTestFromJson(json);

  Map<String, dynamic> toJson() => _$AnotherTestToJson(this);
}
