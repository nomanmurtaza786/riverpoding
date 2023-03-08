import 'package:json_annotation/json_annotation.dart';

part 'activity_model.g.dart';

@JsonSerializable(createToJson: false)
class ActivityModel {
  final String? activity;
  String? type;
  num? participants;
  num? price;
  String? link;
  String? key;
  num? accessibility;
  ActivityModel({
    this.activity,
    this.type,
    this.participants,
    this.price,
    this.link,
    this.key,
    this.accessibility,
  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityModelFromJson(json);
}
