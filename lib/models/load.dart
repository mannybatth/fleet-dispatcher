import 'package:fleet_dispatcher/models/customer.dart';
import 'package:fleet_dispatcher/models/invoice.dart';
import 'package:json_annotation/json_annotation.dart';

part 'load.g.dart';

enum LoadStatus { NONE, DELIVERED, INVOICED, PAYMENT_RECEIVED }

@JsonSerializable()
class Load {
  String id;
  String userId;
  LoadStatus status;
  String invoiceId;
  String customerId;
  String shipper;
  String pickUpLocation;
  DateTime pickUpDate;
  String consignee;
  String deliveryLocation;
  DateTime deliveryDate;
  String poNum;
  String loadNum;
  String refNum;
  String orderNum;
  int rate;
  List<LoadContact> contacts;
  List<String> conversions;

  @JsonKey(ignore: true)
  Invoice invoice;

  @JsonKey(ignore: true)
  Customer customer;

  Load({
    this.id,
    this.userId,
    this.status,
    this.invoiceId,
    this.customerId,
    this.shipper,
    this.pickUpLocation,
    this.pickUpDate,
    this.consignee,
    this.deliveryLocation,
    this.deliveryDate,
    this.poNum,
    this.loadNum,
    this.refNum,
    this.orderNum,
    this.rate,
    this.contacts,
    this.conversions,
  });

  factory Load.fromJson(String id, Map<String, dynamic> json) =>
      _$LoadFromJson(json)..id = id;
  Map<String, dynamic> toJson() => _$LoadToJson(this);
}

@JsonSerializable()
class LoadContact {
  final String name;
  final String email;
  final String phone;
  LoadContact(this.name, this.email, this.phone);

  factory LoadContact.fromJson(Map<String, dynamic> json) =>
      _$LoadContactFromJson(json);
  Map<String, dynamic> toJson() => _$LoadContactToJson(this);
}
