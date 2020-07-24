import 'package:json_annotation/json_annotation.dart';

part 'Another.g.dart';

@JsonSerializable()
class Another {
  Another();

  @JsonKey(ignore: true)
  dynamic md;
  @JsonKey(name: '+1')
  int loved;
  String name;
  num age;

  factory Another.fromJson(Map<String, dynamic> json) =>
      _$AnotherFromJson(json);

  Map<String, dynamic> toJson() => _$AnotherToJson(this);

  @override
  String toString() {
    return 'Another{md: $md, loved: $loved, name: $name, age: $age}';
  }
}
