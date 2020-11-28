// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'load.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Load _$LoadFromJson(Map<String, dynamic> json) {
  return Load(
    json['id'] as String,
    json['userId'] as String,
    _$enumDecodeNullable(_$LoadStatusEnumMap, json['status']),
    json['invoiceId'] as String,
    json['customerId'] as String,
    json['shipper'] as String,
    json['pickUpLocation'] as String,
    json['pickUpDate'] == null
        ? null
        : DateTime.parse(json['pickUpDate'] as String),
    json['consignee'] as String,
    json['deliveryLocation'] as String,
    json['deliveryDate'] == null
        ? null
        : DateTime.parse(json['deliveryDate'] as String),
    json['poNum'] as String,
    json['loadNum'] as String,
    json['refNum'] as String,
    json['orderNum'] as String,
    json['rate'] as int,
    (json['contacts'] as List)
        ?.map((e) =>
            e == null ? null : LoadContact.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['conversions'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$LoadToJson(Load instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'status': _$LoadStatusEnumMap[instance.status],
      'invoiceId': instance.invoiceId,
      'customerId': instance.customerId,
      'shipper': instance.shipper,
      'pickUpLocation': instance.pickUpLocation,
      'pickUpDate': instance.pickUpDate?.toIso8601String(),
      'consignee': instance.consignee,
      'deliveryLocation': instance.deliveryLocation,
      'deliveryDate': instance.deliveryDate?.toIso8601String(),
      'poNum': instance.poNum,
      'loadNum': instance.loadNum,
      'refNum': instance.refNum,
      'orderNum': instance.orderNum,
      'rate': instance.rate,
      'contacts': instance.contacts,
      'conversions': instance.conversions,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$LoadStatusEnumMap = {
  LoadStatus.NONE: 'NONE',
  LoadStatus.DELIVERED: 'DELIVERED',
  LoadStatus.INVOICED: 'INVOICED',
  LoadStatus.PAYMENT_RECEIVED: 'PAYMENT_RECEIVED',
};

LoadContact _$LoadContactFromJson(Map<String, dynamic> json) {
  return LoadContact(
    json['name'] as String,
    json['email'] as String,
    json['phone'] as String,
  );
}

Map<String, dynamic> _$LoadContactToJson(LoadContact instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
    };
