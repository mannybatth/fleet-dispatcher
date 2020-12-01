import 'package:json_annotation/json_annotation.dart';

part 'driver.g.dart';

@JsonSerializable()
class Driver {
  @JsonKey(ignore: true)
  String id;
  String ownerId;
  String firstName;
  String lastName;
  String phone;
  String truckNum;
  String trailerNum;

  String get fullName {
    return '$firstName $lastName';
  }

  Driver({
    this.id,
    this.ownerId,
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
