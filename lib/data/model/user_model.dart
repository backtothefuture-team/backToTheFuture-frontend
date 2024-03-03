import 'package:json_annotation/json_annotation.dart';

// @JsonSerializable 을 사용하면서 자동으로 생성된 코드가 'user_model.g.dart' 파일에 들어감.
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String name;
  final String email;
  final String password;
  final String passwordConfirm;
  final List<String> phoneNumber;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirm,
    required this.phoneNumber
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}