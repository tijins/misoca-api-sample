// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Invoice _$$_InvoiceFromJson(Map<String, dynamic> json) => _$_Invoice(
      json['id'] as int,
      json['invoice_number'] as String,
      json['subject'] as String,
      json['recipient_name'] as String?,
      _$JsonConverterFromJson<String, DateTime>(
          json['issue_date'], const HyphenDateConverter().fromJson),
      _$JsonConverterFromJson<String, DateTime>(
          json['payment_due_on'], const HyphenDateConverter().fromJson),
      InvoiceBody.fromJson(json['body'] as Map<String, dynamic>),
      (json['items'] as List<dynamic>)
          .map((e) => DocumentItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_InvoiceToJson(_$_Invoice instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invoice_number': instance.documentNumber,
      'subject': instance.subject,
      'recipient_name': instance.contactGroupName,
      'issue_date': _$JsonConverterToJson<String, DateTime>(
          instance.issueDate, const HyphenDateConverter().toJson),
      'payment_due_on': _$JsonConverterToJson<String, DateTime>(
          instance.paymentDueOn, const HyphenDateConverter().toJson),
      'body': instance.body,
      'items': instance.items,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

_$_InvoiceBody _$$_InvoiceBodyFromJson(Map<String, dynamic> json) =>
    _$_InvoiceBody(
      const DecimalConverter().fromJson(json['total_amount'] as String),
      const DecimalConverter()
          .fromJson(json['total_amount_including_tax'] as String),
      const DecimalConverter().fromJson(json['tax'] as String),
    );

Map<String, dynamic> _$$_InvoiceBodyToJson(_$_InvoiceBody instance) =>
    <String, dynamic>{
      'total_amount': const DecimalConverter().toJson(instance.totalAmount),
      'total_amount_including_tax':
          const DecimalConverter().toJson(instance.totalAmountIncludingTax),
      'tax': const DecimalConverter().toJson(instance.tax),
    };

_$_DocumentItem _$$_DocumentItemFromJson(Map<String, dynamic> json) =>
    _$_DocumentItem(
      id: json['id'] as int?,
      name: json['name'] as String,
      unitPrice: json['unit_price'] == null
          ? null
          : Decimal.fromJson(json['unit_price'] as String),
      quantity: json['quantity'] == null
          ? null
          : Decimal.fromJson(json['quantity'] as String),
      price: json['price'] as int,
      unitName: json['unit_name'] as String?,
    );

Map<String, dynamic> _$$_DocumentItemToJson(_$_DocumentItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'unit_price': instance.unitPrice,
      'quantity': instance.quantity,
      'price': instance.price,
      'unit_name': instance.unitName,
    };
