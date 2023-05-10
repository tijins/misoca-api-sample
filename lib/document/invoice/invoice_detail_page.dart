import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:misoca_flutter/document/invoice/invoice_detail_page_func.dart';
import 'package:misoca_flutter/document/invoice/invoice_pdf_provider.dart';
import 'package:misoca_flutter/gen/assets.gen.dart';
import 'package:misoca_flutter/style/app_color.dart';
import 'package:misoca_flutter/style/app_theme.dart';

import '../../general/data/invoice.dart';
import '../../util/app_logger.dart';

class InvoiceDetailPage extends ConsumerStatefulWidget {
  static const routeName = "/invoice_detail";
  static const paramInvoice = "invoice";

  InvoiceDetailPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _InvoiceDetailPageState();
  }
}

class _InvoiceDetailPageState extends ConsumerState with InvoiceDetailPageFunc {
  _InvoiceDetailPageState();

  static const pdfWidth = 72.0;
  static const pdfHeight = 102.0;

  Invoice? _invoice;
  PDFViewController? _pdfViewController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        Map<String, dynamic>? args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
        _invoice = args![InvoiceDetailPage.paramInvoice];
        ref.read(invoicePdfProvider.notifier).download(_invoice!.id);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("請求書詳細"),
        ),
        body: LayoutBuilder(builder: (context, contraints) {
          if (_invoice == null) {
            // 請求書の読み込み完了前
            return Container();
          } else {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: _createBody(context, _invoice!),
                  ),
                ),
                _createBottomLayout(_invoice!)
              ],
            );
          }
        }));
  }

  Widget _createBody(BuildContext context, Invoice invoice) {
    return Column(
      children: [
        _createHeader(context, invoice),
        Divider(
          color: AppColor.secondaryColors.shade600,
        ),
        _createItems(context, invoice.items)
      ],
    );
  }

  Widget _createHeader(BuildContext context, Invoice invoice) {
    final issueDateFormat = DateFormat("yyyy/MM/dd");
    return Container(
      padding: const EdgeInsets.only(left: AppDimen.medium, right: AppDimen.medium, top: AppDimen.small),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(invoice.documentNumber),
          _createTitle(context, invoice),
          Text(
            invoice.contactGroupName ?? "-",
            style: TextStyles.bodyS.copyWith(color: AppColor.mainColors.shade700),
          ),
          Row(
            children: [
              const Text(
                "請求日",
                style: TextStyles.s,
              ),
              Expanded(
                  child: Text(
                invoice.issueDate != null ? issueDateFormat.format(invoice.issueDate!) : "-",
                textAlign: TextAlign.right,
                style: TextStyles.m,
              )),
            ],
          ),
          Row(
            children: [
              const Text(
                "お支払い期限",
                style: TextStyles.s,
              ),
              Expanded(
                  child: Text(
                invoice.paymentDueOn != null ? issueDateFormat.format(invoice.paymentDueOn!) : "-",
                textAlign: TextAlign.right,
                style: TextStyles.m,
              )),
            ],
          ),
        ],
      ),
    );
  }

  Widget _createItems(BuildContext context, List<DocumentItem> items) {
    List<Widget> itemViews = items.map((item) => _createItem(item)).toList();
    return Column(
      children: itemViews,
    );
  }

  Widget _createItem(DocumentItem item) {
    return Container(
        padding:
            const EdgeInsets.only(right: AppDimen.medium, left: AppDimen.medium, top: AppDimen.small, bottom: AppDimen.small),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColor.secondaryColors.shade600)),
        ),
        child: Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: TextStyles.labelS.copyWith(color: AppColor.secondaryColors.shade900),
                ),
                Container(
                  margin: const EdgeInsets.only(top: AppDimen.quarter),
                  child: Text(
                      item.price != 0
                          ? "${item.unitPrice?.toString() ?? ""} x ${item.quantity?.toString() ?? ""}${item.unitName}"
                          : "",
                      style: TextStyles.labelXS),
                )
              ],
            )),
            Text(
              item.price != 0 ? "${item.price}円" : "",
              style: TextStyles.bodyM.copyWith(color: AppColor.secondaryColors.shade900),
            ),
          ],
        ));
  }

  Widget _createTitle(BuildContext context, Invoice invoice) {
    // RichTextを使用すると、Textに画像を埋め込める
    return RichText(
        text: TextSpan(
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 21),
            children: [TextSpan(text: invoice.subject), WidgetSpan(child: Assets.images.statusNotIssued.svg())]));
  }

  Widget _createBottomLayout(Invoice invoice) {
    var pdfResult = ref.watch(invoicePdfProvider);
    var file = pdfResult.value;
    // Materialを使用してelevation(影）を付ける
    return Material(
      elevation: AppDimen.medium,
      color: Colors.white,
      child: Column(children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              margin: const EdgeInsets.only(top: AppDimen.medium, left: AppDimen.medium, right: AppDimen.small),
              width: pdfWidth,
              height: pdfHeight,
              color: AppColor.secondaryColors.shade600,
              child: GestureDetector(
                  onTapDown: (_) {
                    logger.d("onTapDown");
                    openPreview(context, invoice);
                  },
                  onDoubleTap: () {
                    // GestureDetectorがイベントをハンドルする事で、PDFViewの操作を抑止できる
                    logger.d("onDoubleTap");
                  },
                  child: file == null
                      ?
                      // ローディング表示などを行う
                      Container(
                          color: AppColor.secondaryColors.shade600,
                        )
                      :
                      // PDFの表示
                      PDFView(
                          filePath: file.path,
                          gestureRecognizers: null,
                          enableSwipe: false,
                          autoSpacing: false,
                          fitPolicy: FitPolicy.BOTH,
                          onViewCreated: (controller) {
                            _pdfViewController = controller;
                          },
                        ))),
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(AppDimen.small),
            child: Column(
              children: [
                Row(children: [
                  Text(
                    "小計",
                    style: TextStyles.labelS,
                  ),
                  Expanded(
                      child: Text(
                    "${invoice.body.totalAmount}円",
                    style: TextStyles.bodyS,
                    textAlign: TextAlign.end,
                  ))
                ]),
                Row(children: [
                  Text(
                    "消費税",
                    style: TextStyles.labelS,
                  ),
                  Expanded(
                      child: Text(
                    "${invoice.body.tax}円",
                    style: TextStyles.bodyS,
                    textAlign: TextAlign.end,
                  ))
                ]),
                Divider(
                  color: AppColor.secondaryColors.shade600,
                ),
                Row(children: [
                  Text(
                    "合計",
                    style: TextStyles.labelS.copyWith(color: AppColor.secondaryColors.shade900),
                  ),
                  Expanded(
                      child: Text(
                    "${invoice.body.totalAmountIncludingTax}円",
                    style: TextStyles.m,
                    textAlign: TextAlign.end,
                  ))
                ])
              ],
            ),
          ))
        ]),
        Divider(
          height: AppDimen.small,
          color: AppColor.secondaryColors.shade600,
        ),
        // PDF共有、発行ボタン
        Row(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Flexible(
              child: Container(
            margin: const EdgeInsets.only(
                top: AppDimen.small, bottom: AppDimen.small, left: AppDimen.small, right: AppDimen.quarter),
            child: ElevatedButton(
                onPressed: () {
                  sharePdf(invoice, file);
                },
                child: const Text("PDFを共有")),
          )),
          Flexible(
              child: Container(
            margin: const EdgeInsets.only(
                top: AppDimen.small, bottom: AppDimen.small, left: AppDimen.quarter, right: AppDimen.small),
            child: ElevatedButton(
              onPressed: () {
                openIssueDialog(context);
              },
              child: const Text("発行"),
            ),
          )),
        ])
      ]),
    );
  }
}
