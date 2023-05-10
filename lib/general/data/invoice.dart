import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'converters.dart';

part 'invoice.freezed.dart';

part 'invoice.g.dart';

@freezed
class Invoice with _$Invoice {
  static const PDF_FILE_FORMAT = "invoice_(\\d+)_(\\w+)\.pdf";

  const factory Invoice(
      int id,
      @JsonKey(name: "invoice_number") String documentNumber,
      String subject,
      @JsonKey(name: 'recipient_name') String? contactGroupName,
      @JsonKey(name: 'issue_date') @HyphenDateConverter() DateTime? issueDate,
      @JsonKey(name: 'payment_due_on') @HyphenDateConverter() DateTime? paymentDueOn,
      InvoiceBody body,
      List<DocumentItem> items) = _Invoice;

  factory Invoice.fromJson(Map<String, dynamic> json) => _$InvoiceFromJson(json);
}

@freezed
class InvoiceBody with _$InvoiceBody {
  const factory InvoiceBody(
    @DecimalConverter() @JsonKey(name: "total_amount") Decimal totalAmount,
    @DecimalConverter() @JsonKey(name: "total_amount_including_tax") Decimal totalAmountIncludingTax,
    @DecimalConverter() @JsonKey(name: "tax") Decimal tax,
  ) = _InvoiceBody;

  factory InvoiceBody.fromJson(Map<String, dynamic> json) => _$InvoiceBodyFromJson(json);
}

@freezed
class DocumentItem with _$DocumentItem {
  const factory DocumentItem({
    int? id,
    required String name,
    @JsonKey(name: "unit_price") Decimal? unitPrice,
    Decimal? quantity,
    @JsonKey(name: "price") required int price,
    @JsonKey(name: "unit_name") String? unitName,
  }) = _DocumentItem;

  factory DocumentItem.fromJson(Map<String, dynamic> json) => _$DocumentItemFromJson(json);
}
