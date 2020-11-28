// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return Customer(
    json['id'] as String,
    json['userId'] as String,
    json['companyId'] as String,
    json['title'] as String,
    json['address'] as String,
    json['city'] as String,
    json['state'] as String,
    json['zipCode'] as String,
    json['phone'] as String,
    json['billingEmail'] as String,
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
      'billingEmail': instance.billingEmail,
    };
