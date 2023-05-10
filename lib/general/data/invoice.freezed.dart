// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Invoice _$InvoiceFromJson(Map<String, dynamic> json) {
  return _Invoice.fromJson(json);
}

/// @nodoc
mixin _$Invoice {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "invoice_number")
  String get documentNumber => throw _privateConstructorUsedError;
  String get subject => throw _privateConstructorUsedError;
  @JsonKey(name: 'recipient_name')
  String? get contactGroupName => throw _privateConstructorUsedError;
  @JsonKey(name: 'issue_date')
  @HyphenDateConverter()
  DateTime? get issueDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_due_on')
  @HyphenDateConverter()
  DateTime? get paymentDueOn => throw _privateConstructorUsedError;
  InvoiceBody get body => throw _privateConstructorUsedError;
  List<DocumentItem> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvoiceCopyWith<Invoice> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceCopyWith<$Res> {
  factory $InvoiceCopyWith(Invoice value, $Res Function(Invoice) then) =
      _$InvoiceCopyWithImpl<$Res, Invoice>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "invoice_number")
          String documentNumber,
      String subject,
      @JsonKey(name: 'recipient_name')
          String? contactGroupName,
      @JsonKey(name: 'issue_date')
      @HyphenDateConverter()
          DateTime? issueDate,
      @JsonKey(name: 'payment_due_on')
      @HyphenDateConverter()
          DateTime? paymentDueOn,
      InvoiceBody body,
      List<DocumentItem> items});

  $InvoiceBodyCopyWith<$Res> get body;
}

/// @nodoc
class _$InvoiceCopyWithImpl<$Res, $Val extends Invoice>
    implements $InvoiceCopyWith<$Res> {
  _$InvoiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? documentNumber = null,
    Object? subject = null,
    Object? contactGroupName = freezed,
    Object? issueDate = freezed,
    Object? paymentDueOn = freezed,
    Object? body = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      documentNumber: null == documentNumber
          ? _value.documentNumber
          : documentNumber // ignore: cast_nullable_to_non_nullable
              as String,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      contactGroupName: freezed == contactGroupName
          ? _value.contactGroupName
          : contactGroupName // ignore: cast_nullable_to_non_nullable
              as String?,
      issueDate: freezed == issueDate
          ? _value.issueDate
          : issueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      paymentDueOn: freezed == paymentDueOn
          ? _value.paymentDueOn
          : paymentDueOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as InvoiceBody,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<DocumentItem>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $InvoiceBodyCopyWith<$Res> get body {
    return $InvoiceBodyCopyWith<$Res>(_value.body, (value) {
      return _then(_value.copyWith(body: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_InvoiceCopyWith<$Res> implements $InvoiceCopyWith<$Res> {
  factory _$$_InvoiceCopyWith(
          _$_Invoice value, $Res Function(_$_Invoice) then) =
      __$$_InvoiceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "invoice_number")
          String documentNumber,
      String subject,
      @JsonKey(name: 'recipient_name')
          String? contactGroupName,
      @JsonKey(name: 'issue_date')
      @HyphenDateConverter()
          DateTime? issueDate,
      @JsonKey(name: 'payment_due_on')
      @HyphenDateConverter()
          DateTime? paymentDueOn,
      InvoiceBody body,
      List<DocumentItem> items});

  @override
  $InvoiceBodyCopyWith<$Res> get body;
}

/// @nodoc
class __$$_InvoiceCopyWithImpl<$Res>
    extends _$InvoiceCopyWithImpl<$Res, _$_Invoice>
    implements _$$_InvoiceCopyWith<$Res> {
  __$$_InvoiceCopyWithImpl(_$_Invoice _value, $Res Function(_$_Invoice) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? documentNumber = null,
    Object? subject = null,
    Object? contactGroupName = freezed,
    Object? issueDate = freezed,
    Object? paymentDueOn = freezed,
    Object? body = null,
    Object? items = null,
  }) {
    return _then(_$_Invoice(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == documentNumber
          ? _value.documentNumber
          : documentNumber // ignore: cast_nullable_to_non_nullable
              as String,
      null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == contactGroupName
          ? _value.contactGroupName
          : contactGroupName // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == issueDate
          ? _value.issueDate
          : issueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      freezed == paymentDueOn
          ? _value.paymentDueOn
          : paymentDueOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as InvoiceBody,
      null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<DocumentItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Invoice implements _Invoice {
  const _$_Invoice(
      this.id,
      @JsonKey(name: "invoice_number") this.documentNumber,
      this.subject,
      @JsonKey(name: 'recipient_name') this.contactGroupName,
      @JsonKey(name: 'issue_date') @HyphenDateConverter() this.issueDate,
      @JsonKey(name: 'payment_due_on') @HyphenDateConverter() this.paymentDueOn,
      this.body,
      final List<DocumentItem> items)
      : _items = items;

  factory _$_Invoice.fromJson(Map<String, dynamic> json) =>
      _$$_InvoiceFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: "invoice_number")
  final String documentNumber;
  @override
  final String subject;
  @override
  @JsonKey(name: 'recipient_name')
  final String? contactGroupName;
  @override
  @JsonKey(name: 'issue_date')
  @HyphenDateConverter()
  final DateTime? issueDate;
  @override
  @JsonKey(name: 'payment_due_on')
  @HyphenDateConverter()
  final DateTime? paymentDueOn;
  @override
  final InvoiceBody body;
  final List<DocumentItem> _items;
  @override
  List<DocumentItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'Invoice(id: $id, documentNumber: $documentNumber, subject: $subject, contactGroupName: $contactGroupName, issueDate: $issueDate, paymentDueOn: $paymentDueOn, body: $body, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Invoice &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.documentNumber, documentNumber) ||
                other.documentNumber == documentNumber) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.contactGroupName, contactGroupName) ||
                other.contactGroupName == contactGroupName) &&
            (identical(other.issueDate, issueDate) ||
                other.issueDate == issueDate) &&
            (identical(other.paymentDueOn, paymentDueOn) ||
                other.paymentDueOn == paymentDueOn) &&
            (identical(other.body, body) || other.body == body) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      documentNumber,
      subject,
      contactGroupName,
      issueDate,
      paymentDueOn,
      body,
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InvoiceCopyWith<_$_Invoice> get copyWith =>
      __$$_InvoiceCopyWithImpl<_$_Invoice>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InvoiceToJson(
      this,
    );
  }
}

abstract class _Invoice implements Invoice {
  const factory _Invoice(
      final int id,
      @JsonKey(name: "invoice_number")
          final String documentNumber,
      final String subject,
      @JsonKey(name: 'recipient_name')
          final String? contactGroupName,
      @JsonKey(name: 'issue_date')
      @HyphenDateConverter()
          final DateTime? issueDate,
      @JsonKey(name: 'payment_due_on')
      @HyphenDateConverter()
          final DateTime? paymentDueOn,
      final InvoiceBody body,
      final List<DocumentItem> items) = _$_Invoice;

  factory _Invoice.fromJson(Map<String, dynamic> json) = _$_Invoice.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: "invoice_number")
  String get documentNumber;
  @override
  String get subject;
  @override
  @JsonKey(name: 'recipient_name')
  String? get contactGroupName;
  @override
  @JsonKey(name: 'issue_date')
  @HyphenDateConverter()
  DateTime? get issueDate;
  @override
  @JsonKey(name: 'payment_due_on')
  @HyphenDateConverter()
  DateTime? get paymentDueOn;
  @override
  InvoiceBody get body;
  @override
  List<DocumentItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$_InvoiceCopyWith<_$_Invoice> get copyWith =>
      throw _privateConstructorUsedError;
}

InvoiceBody _$InvoiceBodyFromJson(Map<String, dynamic> json) {
  return _InvoiceBody.fromJson(json);
}

/// @nodoc
mixin _$InvoiceBody {
  @DecimalConverter()
  @JsonKey(name: "total_amount")
  Decimal get totalAmount => throw _privateConstructorUsedError;
  @DecimalConverter()
  @JsonKey(name: "total_amount_including_tax")
  Decimal get totalAmountIncludingTax => throw _privateConstructorUsedError;
  @DecimalConverter()
  @JsonKey(name: "tax")
  Decimal get tax => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvoiceBodyCopyWith<InvoiceBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceBodyCopyWith<$Res> {
  factory $InvoiceBodyCopyWith(
          InvoiceBody value, $Res Function(InvoiceBody) then) =
      _$InvoiceBodyCopyWithImpl<$Res, InvoiceBody>;
  @useResult
  $Res call(
      {@DecimalConverter()
      @JsonKey(name: "total_amount")
          Decimal totalAmount,
      @DecimalConverter()
      @JsonKey(name: "total_amount_including_tax")
          Decimal totalAmountIncludingTax,
      @DecimalConverter()
      @JsonKey(name: "tax")
          Decimal tax});
}

/// @nodoc
class _$InvoiceBodyCopyWithImpl<$Res, $Val extends InvoiceBody>
    implements $InvoiceBodyCopyWith<$Res> {
  _$InvoiceBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalAmount = null,
    Object? totalAmountIncludingTax = null,
    Object? tax = null,
  }) {
    return _then(_value.copyWith(
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as Decimal,
      totalAmountIncludingTax: null == totalAmountIncludingTax
          ? _value.totalAmountIncludingTax
          : totalAmountIncludingTax // ignore: cast_nullable_to_non_nullable
              as Decimal,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as Decimal,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InvoiceBodyCopyWith<$Res>
    implements $InvoiceBodyCopyWith<$Res> {
  factory _$$_InvoiceBodyCopyWith(
          _$_InvoiceBody value, $Res Function(_$_InvoiceBody) then) =
      __$$_InvoiceBodyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@DecimalConverter()
      @JsonKey(name: "total_amount")
          Decimal totalAmount,
      @DecimalConverter()
      @JsonKey(name: "total_amount_including_tax")
          Decimal totalAmountIncludingTax,
      @DecimalConverter()
      @JsonKey(name: "tax")
          Decimal tax});
}

/// @nodoc
class __$$_InvoiceBodyCopyWithImpl<$Res>
    extends _$InvoiceBodyCopyWithImpl<$Res, _$_InvoiceBody>
    implements _$$_InvoiceBodyCopyWith<$Res> {
  __$$_InvoiceBodyCopyWithImpl(
      _$_InvoiceBody _value, $Res Function(_$_InvoiceBody) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalAmount = null,
    Object? totalAmountIncludingTax = null,
    Object? tax = null,
  }) {
    return _then(_$_InvoiceBody(
      null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as Decimal,
      null == totalAmountIncludingTax
          ? _value.totalAmountIncludingTax
          : totalAmountIncludingTax // ignore: cast_nullable_to_non_nullable
              as Decimal,
      null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as Decimal,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_InvoiceBody implements _InvoiceBody {
  const _$_InvoiceBody(
      @DecimalConverter()
      @JsonKey(name: "total_amount")
          this.totalAmount,
      @DecimalConverter()
      @JsonKey(name: "total_amount_including_tax")
          this.totalAmountIncludingTax,
      @DecimalConverter()
      @JsonKey(name: "tax")
          this.tax);

  factory _$_InvoiceBody.fromJson(Map<String, dynamic> json) =>
      _$$_InvoiceBodyFromJson(json);

  @override
  @DecimalConverter()
  @JsonKey(name: "total_amount")
  final Decimal totalAmount;
  @override
  @DecimalConverter()
  @JsonKey(name: "total_amount_including_tax")
  final Decimal totalAmountIncludingTax;
  @override
  @DecimalConverter()
  @JsonKey(name: "tax")
  final Decimal tax;

  @override
  String toString() {
    return 'InvoiceBody(totalAmount: $totalAmount, totalAmountIncludingTax: $totalAmountIncludingTax, tax: $tax)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InvoiceBody &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(
                    other.totalAmountIncludingTax, totalAmountIncludingTax) ||
                other.totalAmountIncludingTax == totalAmountIncludingTax) &&
            (identical(other.tax, tax) || other.tax == tax));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, totalAmount, totalAmountIncludingTax, tax);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InvoiceBodyCopyWith<_$_InvoiceBody> get copyWith =>
      __$$_InvoiceBodyCopyWithImpl<_$_InvoiceBody>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InvoiceBodyToJson(
      this,
    );
  }
}

abstract class _InvoiceBody implements InvoiceBody {
  const factory _InvoiceBody(
      @DecimalConverter()
      @JsonKey(name: "total_amount")
          final Decimal totalAmount,
      @DecimalConverter()
      @JsonKey(name: "total_amount_including_tax")
          final Decimal totalAmountIncludingTax,
      @DecimalConverter()
      @JsonKey(name: "tax")
          final Decimal tax) = _$_InvoiceBody;

  factory _InvoiceBody.fromJson(Map<String, dynamic> json) =
      _$_InvoiceBody.fromJson;

  @override
  @DecimalConverter()
  @JsonKey(name: "total_amount")
  Decimal get totalAmount;
  @override
  @DecimalConverter()
  @JsonKey(name: "total_amount_including_tax")
  Decimal get totalAmountIncludingTax;
  @override
  @DecimalConverter()
  @JsonKey(name: "tax")
  Decimal get tax;
  @override
  @JsonKey(ignore: true)
  _$$_InvoiceBodyCopyWith<_$_InvoiceBody> get copyWith =>
      throw _privateConstructorUsedError;
}

DocumentItem _$DocumentItemFromJson(Map<String, dynamic> json) {
  return _DocumentItem.fromJson(json);
}

/// @nodoc
mixin _$DocumentItem {
  int? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "unit_price")
  Decimal? get unitPrice => throw _privateConstructorUsedError;
  Decimal? get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: "price")
  int get price => throw _privateConstructorUsedError;
  @JsonKey(name: "unit_name")
  String? get unitName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DocumentItemCopyWith<DocumentItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentItemCopyWith<$Res> {
  factory $DocumentItemCopyWith(
          DocumentItem value, $Res Function(DocumentItem) then) =
      _$DocumentItemCopyWithImpl<$Res, DocumentItem>;
  @useResult
  $Res call(
      {int? id,
      String name,
      @JsonKey(name: "unit_price") Decimal? unitPrice,
      Decimal? quantity,
      @JsonKey(name: "price") int price,
      @JsonKey(name: "unit_name") String? unitName});
}

/// @nodoc
class _$DocumentItemCopyWithImpl<$Res, $Val extends DocumentItem>
    implements $DocumentItemCopyWith<$Res> {
  _$DocumentItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? unitPrice = freezed,
    Object? quantity = freezed,
    Object? price = null,
    Object? unitName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      unitPrice: freezed == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as Decimal?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as Decimal?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      unitName: freezed == unitName
          ? _value.unitName
          : unitName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DocumentItemCopyWith<$Res>
    implements $DocumentItemCopyWith<$Res> {
  factory _$$_DocumentItemCopyWith(
          _$_DocumentItem value, $Res Function(_$_DocumentItem) then) =
      __$$_DocumentItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String name,
      @JsonKey(name: "unit_price") Decimal? unitPrice,
      Decimal? quantity,
      @JsonKey(name: "price") int price,
      @JsonKey(name: "unit_name") String? unitName});
}

/// @nodoc
class __$$_DocumentItemCopyWithImpl<$Res>
    extends _$DocumentItemCopyWithImpl<$Res, _$_DocumentItem>
    implements _$$_DocumentItemCopyWith<$Res> {
  __$$_DocumentItemCopyWithImpl(
      _$_DocumentItem _value, $Res Function(_$_DocumentItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? unitPrice = freezed,
    Object? quantity = freezed,
    Object? price = null,
    Object? unitName = freezed,
  }) {
    return _then(_$_DocumentItem(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      unitPrice: freezed == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as Decimal?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as Decimal?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      unitName: freezed == unitName
          ? _value.unitName
          : unitName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DocumentItem implements _DocumentItem {
  const _$_DocumentItem(
      {this.id,
      required this.name,
      @JsonKey(name: "unit_price") this.unitPrice,
      this.quantity,
      @JsonKey(name: "price") required this.price,
      @JsonKey(name: "unit_name") this.unitName});

  factory _$_DocumentItem.fromJson(Map<String, dynamic> json) =>
      _$$_DocumentItemFromJson(json);

  @override
  final int? id;
  @override
  final String name;
  @override
  @JsonKey(name: "unit_price")
  final Decimal? unitPrice;
  @override
  final Decimal? quantity;
  @override
  @JsonKey(name: "price")
  final int price;
  @override
  @JsonKey(name: "unit_name")
  final String? unitName;

  @override
  String toString() {
    return 'DocumentItem(id: $id, name: $name, unitPrice: $unitPrice, quantity: $quantity, price: $price, unitName: $unitName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DocumentItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.unitName, unitName) ||
                other.unitName == unitName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, unitPrice, quantity, price, unitName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DocumentItemCopyWith<_$_DocumentItem> get copyWith =>
      __$$_DocumentItemCopyWithImpl<_$_DocumentItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DocumentItemToJson(
      this,
    );
  }
}

abstract class _DocumentItem implements DocumentItem {
  const factory _DocumentItem(
      {final int? id,
      required final String name,
      @JsonKey(name: "unit_price") final Decimal? unitPrice,
      final Decimal? quantity,
      @JsonKey(name: "price") required final int price,
      @JsonKey(name: "unit_name") final String? unitName}) = _$_DocumentItem;

  factory _DocumentItem.fromJson(Map<String, dynamic> json) =
      _$_DocumentItem.fromJson;

  @override
  int? get id;
  @override
  String get name;
  @override
  @JsonKey(name: "unit_price")
  Decimal? get unitPrice;
  @override
  Decimal? get quantity;
  @override
  @JsonKey(name: "price")
  int get price;
  @override
  @JsonKey(name: "unit_name")
  String? get unitName;
  @override
  @JsonKey(ignore: true)
  _$$_DocumentItemCopyWith<_$_DocumentItem> get copyWith =>
      throw _privateConstructorUsedError;
}
