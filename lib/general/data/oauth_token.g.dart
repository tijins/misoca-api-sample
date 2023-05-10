// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oauth_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OauthToken _$$_OauthTokenFromJson(Map<String, dynamic> json) =>
    _$_OauthToken(
      json['access_token'] as String,
      json['refresh_token'] as String,
      json['scope'] as String,
      json['token_type'] as String,
      json['expires_in'] as int,
      json['created_at'] as int,
    );

Map<String, dynamic> _$$_OauthTokenToJson(_$_OauthToken instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'scope': instance.scope,
      'token_type': instance.tokenType,
      'expires_in': instance.expiresIn,
      'created_at': instance.createdAt,
    };
