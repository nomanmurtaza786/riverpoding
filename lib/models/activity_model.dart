// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'activity_model.g.dart';

@JsonSerializable(createToJson: false)
class ActivityModel {
  String? activity;
  String? type;
  double? participants;
  double? price;
  String? link;
  String? key;
  double? accessibility;

  ActivityModel(
      {this.activity,
      this.type,
      this.participants,
      this.price,
      this.link,
      this.key,
      this.accessibility});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'activity': activity,
      'type': type,
      'participants': participants,
      'price': price,
      'link': link,
      'key': key,
      'accessibility': accessibility,
    };
  }

  String toJson() => json.encode(toMap());

  factory ActivityModel.fromJson(Map<String, dynamic> map) =>
      _$ActivityModelFromJson(map);
}
