import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'invoice.g.dart';

@JsonSerializable()
class Invoice {
  final String id;
  final String userId;
  final int invoiceNum;
  final String loadId;
  final DateTime sentDate;
  final DateTime dueDate;
  final int totalDue;
  final int paidAmount;
  final String itemName;
  final List<InvoiceItem> extraItems;
  Invoice(
      this.id,
      this.userId,
      this.invoiceNum,
      this.loadId,
      this.sentDate,
      this.dueDate,
      this.totalDue,
      this.paidAmount,
      this.itemName,
      this.extraItems);

  factory Invoice.fromJson(Map<String, dynamic> json) =>
      _$InvoiceFromJson(json);
  Map<String, dynamic> toJson() => _$InvoiceToJson(this);
}

@JsonSerializable()
class InvoiceItem {
  final String itemName;
  final int amount;
  InvoiceItem(this.itemName, this.amount);

  factory InvoiceItem.fromJson(Map<String, dynamic> json) =>
      _$InvoiceItemFromJson(json);
  Map<String, dynamic> toJson() => _$InvoiceItemToJson(this);
}
