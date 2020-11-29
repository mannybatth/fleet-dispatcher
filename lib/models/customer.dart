import 'package:json_annotation/json_annotation.dart';

part 'customer.g.dart';

@JsonSerializable()
class Customer {
  String id;
  String userId;
  String title;
  String address;
  String city;
  String state;
  String zipCode;
  String phone;
  String invoiceEmail;
  Customer({
    this.id,
    this.userId,
    this.title,
    this.address,
    this.city,
    this.state,
    this.zipCode,
    this.phone,
    this.invoiceEmail,
  });

  factory Customer.fromJson(String id, Map<String, dynamic> json) =>
      _$CustomerFromJson(json)..id = id;
  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}
