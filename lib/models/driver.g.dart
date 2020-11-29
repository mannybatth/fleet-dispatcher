// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Driver _$DriverFromJson(Map<String, dynamic> json) {
  return Driver(
    userId: json['userId'] as String,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    phone: json['phone'] as String,
    trailerNum: json['trailerNum'] as String,
    truckNum: json['truckNum'] as String,
  );
}

Map<String, dynamic> _$DriverToJson(Driver instance) => <String, dynamic>{
      'userId': instance.userId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phone': instance.phone,
      'truckNum': instance.truckNum,
      'trailerNum': instance.trailerNum,
    };
