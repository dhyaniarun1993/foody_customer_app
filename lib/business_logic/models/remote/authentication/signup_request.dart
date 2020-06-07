import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'signup_request.g.dart';

@JsonSerializable()
class SignUpRequest {

  @JsonKey(name: 'phone_number', required: true)
  String phoneNumber;

  @JsonKey(name: 'email', required: true)
  String email;

  @JsonKey(name: 'first_name', required: true)
  String firstName;

  @JsonKey(name: 'last_name', required: true)
  String lastName;

  SignUpRequest({
    @required this.phoneNumber,
    @required this.email,
    @required this.firstName,
    @required this.lastName,
  });

  factory SignUpRequest.fromJson(Map<String, dynamic> json) => _$SignUpRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);
}