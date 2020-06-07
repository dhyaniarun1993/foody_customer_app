// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpRequest _$SignUpRequestFromJson(Map<String, dynamic> json) {
  $checkKeys(json,
      requiredKeys: const ['phone_number', 'email', 'first_name', 'last_name']);
  return SignUpRequest(
    phoneNumber: json['phone_number'] as String,
    email: json['email'] as String,
    firstName: json['first_name'] as String,
    lastName: json['last_name'] as String,
  );
}

Map<String, dynamic> _$SignUpRequestToJson(SignUpRequest instance) =>
    <String, dynamic>{
      'phone_number': instance.phoneNumber,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
    };
