import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../general/data/invoice.dart';
import '../../login/login_page.dart';
import 'invoice_detail_page.dart';
import 'invoice_list_provider.dart';
import 'invoice_list_use_case.dart';

mixin InvoiceListPageFunc {
  Future<void> onRefreshList(WidgetRef ref) async {
    // インジケータが消えるまでの時間
    ref.read(invoiceListProvider.notifier).index();
    return Future.delayed(const Duration(seconds: 1));
  }

  void onSelectItem(BuildContext context, Invoice invoice) {
    Navigator.of(context).pushNamed(InvoiceDetailPage.routeName, arguments: {InvoiceDetailPage.paramInvoice: invoice});
  }

  void logout(BuildContext context) {
    final useCase = InvoiceListUseCase();
    useCase.logout();
    Navigator.of(context).pushNamedAndRemoveUntil(LoginPage.routeName, (_) => false);
  }
}
