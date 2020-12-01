// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return Customer(
    ownerId: json['ownerId'] as String,
    title: json['title'] as String,
    address: json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map<String, dynamic>),
    phone: json['phone'] as String,
    invoiceEmail: json['invoiceEmail'] as String,
  );
}

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'ownerId': instance.ownerId,
      'title': instance.title,
      'address': instance.address?.toJson(),
      'phone': instance.phone,
      'invoiceEmail': instance.invoiceEmail,
    };
