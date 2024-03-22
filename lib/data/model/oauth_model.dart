import 'package:json_annotation/json_annotation.dart';

part 'oauth_model.g.dart';

@JsonSerializable()
class OAuthModel {
  final String authorization;
  final String providerType;
  final String rolesType;
  final String state;

  OAuthModel({
    required this.authorization,
    required this.providerType,
    required this.rolesType,
    required this.state
  });

  factory OAuthModel.fromJson(Map<String, dynamic> json) => _$OAuthModelFromJson(json);
  Map<String, dynamic> toJson() => _$OAuthModelToJson(this);
}
