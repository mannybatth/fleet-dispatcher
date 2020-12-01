import 'package:fleet_dispatcher/models/address.dart';
import 'package:json_annotation/json_annotation.dart';

part 'customer.g.dart';

@JsonSerializable(explicitToJson: true)
class Customer {
  @JsonKey(ignore: true)
  String id;
  String ownerId;
  String title;
  Address address;
  String phone;
  String invoiceEmail;
  Customer({
    this.id,
    this.ownerId,
    this.title,
    this.address,
    this.phone,
    this.invoiceEmail,
  });

  factory Customer.fromJson(String id, Map<String, dynamic> json) =>
      _$CustomerFromJson(json)..id = id;
  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}
