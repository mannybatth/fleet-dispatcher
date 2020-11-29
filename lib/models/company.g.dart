// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) {
  return Company(
    id: json['id'] as String,
    title: json['title'] as String,
    email: json['email'] as String,
    address: json['address'] as String,
    city: json['city'] as String,
    state: json['state'] as String,
    zipCode: json['zipCode'] as String,
    phone: json['phone'] as String,
    lastInvoiceNum: json['lastInvoiceNum'] as int,
  );
}

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'email': instance.email,
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'zipCode': instance.zipCode,
      'phone': instance.phone,
      'lastInvoiceNum': instance.lastInvoiceNum,
    };
