import 'package:fleet_dispatcher/models/address.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

@JsonSerializable(explicitToJson: true)
class Company {
  @JsonKey(ignore: true)
  String id;
  String title;
  String email;
  Address address;
  String phone;
  int lastInvoiceNum;
  Company({
    this.id,
    this.title,
    this.email,
    this.address,
    this.phone,
    this.lastInvoiceNum,
  });

  factory Company.fromJson(String id, Map<String, dynamic> json) =>
      _$CompanyFromJson(json)..id = id;
  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
