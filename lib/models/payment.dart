import 'package:json_annotation/json_annotation.dart';

part 'payment.g.dart';

@JsonSerializable()
class Payment {
  String id;
  String invoiceId;
  int amount;
  DateTime receivedDate;
  Payment({
    this.id,
    this.invoiceId,
    this.amount,
    this.receivedDate,
  });

  factory Payment.fromJson(String id, Map<String, dynamic> json) =>
      _$PaymentFromJson(json)..id = id;
  Map<String, dynamic> toJson() => _$PaymentToJson(this);
}
