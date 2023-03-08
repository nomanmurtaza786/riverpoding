// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'passengers_model.g.dart';

@JsonSerializable()
class PassengersModel {
  final int? totalPassengers;
  final int? totalPages;
  final List<Passenger>? data;

  PassengersModel(
    this.totalPassengers,
    this.totalPages,
    this.data,
  );

  factory PassengersModel.fromJson(Map<String, dynamic> json) =>
      _$PassengersModelFromJson(json);
  Map<String, dynamic> toJson() => _$PassengersModelToJson(this);
}

@JsonSerializable()
class Passenger {
  final String? name;
  final int? trips;
  Passenger({
    this.name,
    this.trips,
  });

  factory Passenger.fromJson(Map<String, dynamic> json) =>
      _$PassengerFromJson(json);
  Map<String, dynamic> toJson() => _$PassengerToJson(this);
}
