// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) {
  return Company(
    title: json['title'] as String,
    email: json['email'] as String,
    address: json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map<String, dynamic>),
    phone: json['phone'] as String,
    lastInvoiceNum: json['lastInvoiceNum'] as int,
  );
}

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'title': instance.title,
      'email': instance.email,
      'address': instance.address?.toJson(),
      'phone': instance.phone,
      'lastInvoiceNum': instance.lastInvoiceNum,
    };
