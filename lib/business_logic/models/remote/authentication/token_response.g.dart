// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenResponse _$TokenResponseFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const [
    'access_token',
    'type',
    'expires_in',
    'refresh_token'
  ]);
  return TokenResponse(
    accessToken: json['access_token'] as String,
    type: json['type'] as String,
    expiresIn: json['expires_in'] as int,
    refreshToken: json['refresh_token'] as String,
  );
}

Map<String, dynamic> _$TokenResponseToJson(TokenResponse instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'type': instance.type,
      'expires_in': instance.expiresIn,
      'refresh_token': instance.refreshToken,
    };
