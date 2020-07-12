import 'package:json_annotation/json_annotation.dart';
import "user.dart";
part 'Test.g.dart';

@JsonSerializable()
class Test {
    Test();

    String name;
    User father;
    List<User> friends;
    List<String> keywords;
    num age;
    
    factory Test.fromJson(Map<String,dynamic> json) => _$TestFromJson(json);
    Map<String, dynamic> toJson() => _$TestToJson(this);
}
