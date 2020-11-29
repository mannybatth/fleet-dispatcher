import 'package:json_annotation/json_annotation.dart';

part 'invoice.g.dart';

@JsonSerializable()
class Invoice {
  String id;
  String userId;
  int invoiceNum;
  String loadId;
  DateTime sentDate;
  DateTime dueDate;
  int totalDue;
  int paidAmount;
  String itemName;
  List<InvoiceItem> extraItems;
  Invoice({
    this.id,
    this.userId,
    this.invoiceNum,
    this.loadId,
    this.sentDate,
    this.dueDate,
    this.totalDue,
    this.paidAmount,
    this.itemName,
    this.extraItems,
  });

  factory Invoice.fromJson(String id, Map<String, dynamic> json) =>
      _$InvoiceFromJson(json)..id = id;
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
