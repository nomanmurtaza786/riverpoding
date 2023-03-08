// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passengers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PassengersModel _$PassengersModelFromJson(Map<String, dynamic> json) =>
    PassengersModel(
      json['totalPassengers'] as int?,
      json['totalPages'] as int?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => Passenger.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PassengersModelToJson(PassengersModel instance) =>
    <String, dynamic>{
      'totalPassengers': instance.totalPassengers,
      'totalPages': instance.totalPages,
      'data': instance.data,
    };

Passenger _$PassengerFromJson(Map<String, dynamic> json) => Passenger(
      name: json['name'] as String?,
      trips: json['trips'] as int?,
    );

Map<String, dynamic> _$PassengerToJson(Passenger instance) => <String, dynamic>{
      'name': instance.name,
      'trips': instance.trips,
    };
