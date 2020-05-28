// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenByOtpRequest _$TokenByOtpRequestFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['phone_number', 'otp', 'grant_type']);
  return TokenByOtpRequest(
    phoneNumber: json['phone_number'] as String,
    otp: json['otp'] as String,
    grantType: json['grant_type'] as String,
  );
}

Map<String, dynamic> _$TokenByOtpRequestToJson(TokenByOtpRequest instance) =>
    <String, dynamic>{
      'phone_number': instance.phoneNumber,
      'otp': instance.otp,
      'grant_type': instance.grantType,
    };

TokenByRefreshTokenRequest _$TokenByRefreshTokenRequestFromJson(
    Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['refreshToken', 'grant_type']);
  return TokenByRefreshTokenRequest(
    refreshToken: json['refreshToken'] as String,
    grantType: json['grant_type'] as String,
  );
}

Map<String, dynamic> _$TokenByRefreshTokenRequestToJson(
        TokenByRefreshTokenRequest instance) =>
    <String, dynamic>{
      'refreshToken': instance.refreshToken,
      'grant_type': instance.grantType,
    };
