// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oauth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OAuthModel _$OAuthModelFromJson(Map<String, dynamic> json) => OAuthModel(
      authorization: json['authorization'] as String,
      providerType: json['providerType'] as String,
      rolesType: json['rolesType'] as String,
      state: json['state'] as String,
    );

Map<String, dynamic> _$OAuthModelToJson(OAuthModel instance) =>
    <String, dynamic>{
      'authorization': instance.authorization,
      'providerType': instance.providerType,
      'rolesType': instance.rolesType,
      'state': instance.state,
    };
