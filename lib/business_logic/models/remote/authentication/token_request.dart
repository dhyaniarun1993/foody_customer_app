import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token_request.g.dart';

@JsonSerializable()
class TokenByOtpRequest {

  @JsonKey(name: 'phone_number', required: true)
  String phoneNumber;

  @JsonKey(name: 'otp', required: true)
  String otp;

  @JsonKey(name: 'grant_type', required: true)
  String grantType;

  TokenByOtpRequest({
    @required this.phoneNumber,
    @required this.otp,
    @required this.grantType}
  );

  factory TokenByOtpRequest.fromJson(Map<String, dynamic> json) =>  _$TokenByOtpRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TokenByOtpRequestToJson(this);
}

@JsonSerializable()
class TokenByRefreshTokenRequest {

  @JsonKey(name: 'refreshToken', required: true)
  String refreshToken;

  @JsonKey(name: 'grant_type', required: true)
  String grantType;

  TokenByRefreshTokenRequest({
    @required this.refreshToken,
    @required this.grantType}
  );

  factory TokenByRefreshTokenRequest.fromJson(Map<String, dynamic> json) =>  _$TokenByRefreshTokenRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TokenByRefreshTokenRequestToJson(this);
}

