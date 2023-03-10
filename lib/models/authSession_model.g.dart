// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authSession_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthSessionModel _$AuthSessionModelFromJson(Map<String, dynamic> json) =>
    AuthSessionModel(
      token: json['token'] as String?,
      user: json['user'] as String?,
      isAuthenticated: json['isAuthenticated'] as bool? ?? false,
    );

Map<String, dynamic> _$AuthSessionModelToJson(AuthSessionModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
      'isAuthenticated': instance.isAuthenticated,
    };
