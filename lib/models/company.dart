import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

@JsonSerializable()
class Company {
  @JsonKey(ignore: true)
  String id;
  String title;
  String email;
  String address;
  String city;
  String state;
  String zipCode;
  String phone;
  int lastInvoiceNum;
  Company({
    this.id,
    this.title,
    this.email,
    this.address,
    this.city,
    this.state,
    this.zipCode,
    this.phone,
    this.lastInvoiceNum,
  });

  factory Company.fromJson(String id, Map<String, dynamic> json) =>
      _$CompanyFromJson(json)..id = id;
  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
