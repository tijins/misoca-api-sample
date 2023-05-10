import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misoca_flutter/document/invoice/invoice_pdf_provider.dart';
import 'package:misoca_flutter/document/invoice/invoice_preview_page_func.dart';
import 'package:misoca_flutter/style/app_color.dart';
import 'package:misoca_flutter/style/app_theme.dart';

import '../../general/data/invoice.dart';

class InvoicePreviewPage extends ConsumerStatefulWidget {
  static const routeName = "/invoice_preview";
  static const paramInvoice = "invoice";

  InvoicePreviewPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _InvoicePreviewPageState();
  }
}

class _InvoicePreviewPageState extends ConsumerState with InvoicePreviewPageFunc {
  _InvoicePreviewPageState();

  Invoice? _invoice;
  PDFViewController? _pdfViewController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        Map<String, dynamic>? args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
        _invoice = args![InvoicePreviewPage.paramInvoice];
        ref.read(invoicePdfProvider.notifier).download(_invoice!.id);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("プレビュー"),
          backgroundColor: AppColor.secondaryColors.shade100,
        ),
        body: Column(children: [Expanded(child: _createPdfView(context)), _createBottomLayout(_invoice!)]));
  }

  Widget _createPdfView(BuildContext context) {
    var pdfResult = ref.watch(invoicePdfProvider);
    var file = pdfResult.value;
    return file == null
        ?
        // ローディング表示などを行う
        Container(
            color: AppColor.secondaryColors.shade600,
          )
        :
        // PDF表示
        Container(
            color: AppColor.secondaryColors.shade600,
            padding: EdgeInsets.all(AppDimen.small),
            child: PDFView(
              filePath: file.path,
              enableSwipe: true,
              autoSpacing: true,
              fitPolicy: FitPolicy.BOTH,
              onViewCreated: (controller) {
                _pdfViewController = controller;
              },
            ));
  }

  Widget _createBottomLayout(Invoice invoice) {
    var pdfResult = ref.watch(invoicePdfProvider);
    var file = pdfResult.value;
    // Materialを使用してelevation(影）を付ける
    return Material(
      elevation: AppDimen.medium,
      color: Colors.white,
      child: Column(children: [
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
