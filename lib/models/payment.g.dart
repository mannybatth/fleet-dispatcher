// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payment _$PaymentFromJson(Map<String, dynamic> json) {
  return Payment(
    id: json['id'] as String,
    invoiceId: json['invoiceId'] as String,
    amount: json['amount'] as int,
    receivedDate: json['receivedDate'] == null
        ? null
        : DateTime.parse(json['receivedDate'] as String),
  );
}

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
      'id': instance.id,
      'invoiceId': instance.invoiceId,
      'amount': instance.amount,
      'receivedDate': instance.receivedDate?.toIso8601String(),
    };
