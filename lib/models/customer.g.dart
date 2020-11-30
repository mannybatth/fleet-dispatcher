// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return Customer(
    userId: json['userId'] as String,
    title: json['title'] as String,
    address: json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map<String, dynamic>),
    phone: json['phone'] as String,
    invoiceEmail: json['invoiceEmail'] as String,
  );
}

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'userId': instance.userId,
      'title': instance.title,
      'address': instance.address?.toJson(),
      'phone': instance.phone,
      'invoiceEmail': instance.invoiceEmail,
    };
