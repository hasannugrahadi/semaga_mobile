// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login _$LoginFromJson(Map<String, dynamic> json) => Login(
      message: json['message'] as String,
      access_token: json['access_token'] as String,
      token_type: json['token_type'] as String,
    );

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
      'message': instance.message,
      'access_token': instance.access_token,
      'token_type': instance.token_type,
    };
