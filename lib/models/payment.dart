import 'package:cloud_firestore/cloud_firestore.dart';

class Payment {
  final String id;
  final String invoiceId;
  final int amount;
  final DateTime receivedDate;
  Payment({
    this.id,
    this.invoiceId,
    this.amount,
    this.receivedDate,
  });
}
