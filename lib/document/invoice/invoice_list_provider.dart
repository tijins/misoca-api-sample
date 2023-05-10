import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misoca_flutter/document/invoice/invoice_list_use_case.dart';
import 'package:misoca_flutter/general/data/network_state.dart';

import '../../general/data/invoice.dart';
import '../../util/app_logger.dart';

class InvoiceListNotifier extends StateNotifier<NetworkState<List<Invoice>>> {
  InvoiceListNotifier() : super(const NetworkState(status: NetworkStatus.idle));

  void index() async {
    if (state.status == NetworkStatus.running) {
      return;
    }
    var useCase = InvoiceListUseCase();
    try {
      state = const NetworkState(status: NetworkStatus.running);
      var invoiceList = await useCase.index();
      state = NetworkState(status: NetworkStatus.success, value: invoiceList);
    } on Exception catch (e) {
      logger.d(e);
      state = NetworkState(status: NetworkStatus.failed, error: e);
      await Future.delayed(const Duration(milliseconds: 1000));
      state = NetworkState(status: NetworkStatus.idle, error: e);
    }
  }
}

final invoiceListProvider =
    StateNotifierProvider<InvoiceListNotifier, NetworkState<List<Invoice>>>((ref) => InvoiceListNotifier());
