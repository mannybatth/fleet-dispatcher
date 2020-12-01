// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'load.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Load _$LoadFromJson(Map<String, dynamic> json) {
  return Load(
    ownerId: json['ownerId'] as String,
    status: _$enumDecodeNullable(_$LoadStatusEnumMap, json['status']),
    invoiceId: json['invoiceId'] as String,
    customerId: json['customerId'] as String,
    shipper: json['shipper'] as String,
    pickUpLocation: json['pickUpLocation'] == null
        ? null
        : Address.fromJson(json['pickUpLocation'] as Map<String, dynamic>),
    pickUpDate: json['pickUpDate'] == null
        ? null
        : DateTime.parse(json['pickUpDate'] as String),
    consignee: json['consignee'] as String,
    deliveryLocation: json['deliveryLocation'] == null
        ? null
        : Address.fromJson(json['deliveryLocation'] as Map<String, dynamic>),
    deliveryDate: json['deliveryDate'] == null
        ? null
        : DateTime.parse(json['deliveryDate'] as String),
    poNum: json['poNum'] as String,
    loadNum: json['loadNum'] as String,
    refNum: json['refNum'] as String,
    orderNum: json['orderNum'] as String,
    rate: (json['rate'] as num)?.toDouble(),
    contacts: (json['contacts'] as List)
        ?.map((e) =>
            e == null ? null : LoadContact.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    conversions:
        (json['conversions'] as List)?.map((e) => e as String)?.toList(),
  )..driverId = json['driverId'] as String;
}

Map<String, dynamic> _$LoadToJson(Load instance) => <String, dynamic>{
      'ownerId': instance.ownerId,
      'status': _$LoadStatusEnumMap[instance.status],
      'invoiceId': instance.invoiceId,
      'customerId': instance.customerId,
      'driverId': instance.driverId,
      'shipper': instance.shipper,
      'pickUpLocation': instance.pickUpLocation?.toJson(),
      'pickUpDate': instance.pickUpDate?.toIso8601String(),
      'consignee': instance.consignee,
      'deliveryLocation': instance.deliveryLocation?.toJson(),
      'deliveryDate': instance.deliveryDate?.toIso8601String(),
      'poNum': instance.poNum,
      'loadNum': instance.loadNum,
      'refNum': instance.refNum,
      'orderNum': instance.orderNum,
      'rate': instance.rate,
      'contacts': instance.contacts?.map((e) => e?.toJson())?.toList(),
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
