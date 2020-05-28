import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token_response.g.dart';

@JsonSerializable()
class TokenResponse {

  @JsonKey(name: 'access_token', required: true)
  String accessToken;

  @JsonKey(name: 'type', required: true)
  String type;

  @JsonKey(name: 'expires_in', required: true)
  int expiresIn;

  @JsonKey(name: 'refresh_token', required: true)
  String refreshToken;

  TokenResponse({
    @required this.accessToken,
    @required this.type, 
    @required this.expiresIn,
    @required this.refreshToken,
  });

  factory TokenResponse.fromJson(Map<String, dynamic> json) => _$TokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TokenResponseToJson(this);
}