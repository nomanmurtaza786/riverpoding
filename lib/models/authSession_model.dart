// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'authSession_model.g.dart';

@JsonSerializable()
class AuthSessionModel {
  final String? token;
  final String? user;
  final bool isAuthenticated;

  AuthSessionModel({
    this.token,
    this.user,
    this.isAuthenticated = false,
  });

  factory AuthSessionModel.fromJson(Map<String, dynamic> json) =>
      _$AuthSessionModelFromJson(json);
  Map<String, dynamic> toJson() => _$AuthSessionModelToJson(this);
}
