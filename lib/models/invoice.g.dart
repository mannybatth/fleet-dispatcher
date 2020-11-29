// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Invoice _$InvoiceFromJson(Map<String, dynamic> json) {
  return Invoice(
    id: json['id'] as String,
    userId: json['userId'] as String,
    invoiceNum: json['invoiceNum'] as int,
    loadId: json['loadId'] as String,
    sentDate: json['sentDate'] == null
        ? null
        : DateTime.parse(json['sentDate'] as String),
    dueDate: json['dueDate'] == null
        ? null
        : DateTime.parse(json['dueDate'] as String),
    totalDue: json['totalDue'] as int,
    paidAmount: json['paidAmount'] as int,
    itemName: json['itemName'] as String,
    extraItems: (json['extraItems'] as List)
        ?.map((e) =>
            e == null ? null : InvoiceItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$InvoiceToJson(Invoice instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'invoiceNum': instance.invoiceNum,
      'loadId': instance.loadId,
      'sentDate': instance.sentDate?.toIso8601String(),
      'dueDate': instance.dueDate?.toIso8601String(),
      'totalDue': instance.totalDue,
      'paidAmount': instance.paidAmount,
      'itemName': instance.itemName,
      'extraItems': instance.extraItems,
    };

InvoiceItem _$InvoiceItemFromJson(Map<String, dynamic> json) {
  return InvoiceItem(
    json['itemName'] as String,
    json['amount'] as int,
  );
}

Map<String, dynamic> _$InvoiceItemToJson(InvoiceItem instance) =>
    <String, dynamic>{
      'itemName': instance.itemName,
      'amount': instance.amount,
    };
