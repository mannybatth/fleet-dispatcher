// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return Customer(
    id: json['id'] as String,
    userId: json['userId'] as String,
    companyId: json['companyId'] as String,
    title: json['title'] as String,
    address: json['address'] as String,
    city: json['city'] as String,
    state: json['state'] as String,
    zipCode: json['zipCode'] as String,
    phone: json['phone'] as String,
    invoiceEmail: json['invoiceEmail'] as String,
  );
}

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'companyId': instance.companyId,
      'title': instance.title,
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'zipCode': instance.zipCode,
      'phone': instance.phone,
      'invoiceEmail': instance.invoiceEmail,
    };
