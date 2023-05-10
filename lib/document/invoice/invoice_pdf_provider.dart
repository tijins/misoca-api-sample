import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misoca_flutter/document/invoice/invoice_list_use_case.dart';
import 'package:misoca_flutter/util/app_logger.dart';

import '../../general/data/network_state.dart';

class InvoicePdfNotifier extends StateNotifier<NetworkState<File>> {
  InvoicePdfNotifier() : super(const NetworkState(status: NetworkStatus.idle));

  void download(int id) async {
    if (state.status == NetworkStatus.running) {
      return;
    }
    try {
      state = const NetworkState(status: NetworkStatus.running);
      var pdfFile = await InvoiceListUseCase().downloadPdf(id);
      state = NetworkState(status: NetworkStatus.success, value: pdfFile);
    } on Exception catch (e) {
      logger.d(e);
      state = NetworkState(status: NetworkStatus.failed, error: e);
    }
  }
}

final invoicePdfProvider = StateNotifierProvider<InvoicePdfNotifier, NetworkState<File>>((ref) => InvoicePdfNotifier());
