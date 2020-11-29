import 'package:json_annotation/json_annotation.dart';

part 'driver.g.dart';

@JsonSerializable()
class Driver {
  String id;
  String userId;
  String firstName;
  String lastName;
  String phone;
  String truckNum;
  String trailerNum;
  Driver({
    this.id,
    this.userId,
    this.firstName,
    this.lastName,
    this.phone,
    this.trailerNum,
    this.truckNum,
  });

  factory Driver.fromJson(String id, Map<String, dynamic> json) =>
      _$DriverFromJson(json)..id = id;
  Map<String, dynamic> toJson() => _$DriverToJson(this);
}
