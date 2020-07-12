
import 'package:json_annotation/json_annotation.dart';

//flutter packages pub run build_runner build
//flutter packages pub run build_runner watch
part 'User.g.dart';

@JsonSerializable()

class User{
  String name;
  String email;

  User(this.name, this.email);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}