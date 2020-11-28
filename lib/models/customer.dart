import 'package:json_annotation/json_annotation.dart';

part 'customer.g.dart';

@JsonSerializable()
class Customer {
  final String id;
  final String userId;
  final String companyId;
  final String title;
  final String address;
  final String city;
  final String state;
  final String zipCode;
  final String phone;
  final String billingEmail;
  Customer(this.id, this.userId, this.companyId, this.title, this.address,
      this.city, this.state, this.zipCode, this.phone, this.billingEmail);

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}
