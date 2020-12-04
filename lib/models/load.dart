import 'package:fleet_dispatcher/models/address.dart';
import 'package:fleet_dispatcher/models/customer.dart';
import 'package:fleet_dispatcher/models/invoice.dart';
import 'package:fleet_dispatcher/models/driver.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'load.g.dart';

enum LoadStatus { NONE, DELIVERED, INVOICED, PAYMENT_RECEIVED }

@JsonSerializable(explicitToJson: true)
class Load {
  @JsonKey(ignore: true)
  String id;
  String ownerId;
  LoadStatus status;
  String invoiceId;
  String customerId;
  String driverId;
  String shipper;
  Address pickUpLocation;
  DateTime pickUpDate;
  String consignee;
  Address deliveryLocation;
  DateTime deliveryDate;
  String poNum;
  String loadNum;
  String refNum;
  String orderNum;
  double rate;
  List<LoadContact> contacts;
  List<String> conversions;

  @JsonKey(ignore: true)
  Invoice invoice;

  @JsonKey(ignore: true)
  Customer customer;

  @JsonKey(ignore: true)
  Driver driver;

  Load({
    this.id,
    this.ownerId,
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

  String getLoadRefText() {
    if (this.poNum != null && this.poNum.isNotEmpty) {
      return 'PO #$poNum';
    } else if (this.loadNum != null && this.loadNum.isNotEmpty) {
      return 'Load #$loadNum';
    } else if (this.refNum != null && this.refNum.isNotEmpty) {
      return 'Ref #$refNum';
    } else if (this.orderNum != null && this.orderNum.isNotEmpty) {
      return 'Order #$orderNum';
    }
    return '';
  }

  String getLoadStatusText() {
    if (this.status == LoadStatus.NONE) {
      return 'New';
    } else if (this.status == LoadStatus.DELIVERED) {
      return 'Delivered';
    } else if (this.status == LoadStatus.INVOICED) {
      return 'Invoiced';
    } else if (this.status == LoadStatus.PAYMENT_RECEIVED) {
      return 'Paid';
    }
    return '';
  }

  Color getLoadStatusColor() {
    if (this.status == LoadStatus.NONE) {
      return Colors.blue;
    } else if (this.status == LoadStatus.DELIVERED) {
      return Colors.brown;
    } else if (this.status == LoadStatus.INVOICED) {
      return Colors.orange;
    } else if (this.status == LoadStatus.PAYMENT_RECEIVED) {
      return Colors.green;
    }
    return Colors.blue;
  }
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
