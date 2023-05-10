import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_plus/share_plus.dart';

import '../../general/data/invoice.dart';
import 'invoice_bottom_sheet.dart';

mixin InvoicePreviewPageFunc {
  void sharePdf(Invoice invoice, File? file) {
    if (file != null) {
      Share.shareFiles([file.path], subject: invoice.subject, mimeTypes: ["application/pdf"]);
    }
  }

  void openIssueDialog(BuildContext context) async {
    var result = await showModalBottomSheet(context: context, builder: (_) => InvoiceBottomSheet());
    if (result != null) {
      Fluttertoast.showToast(
        msg: "$resultを選択しました",
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }
}
