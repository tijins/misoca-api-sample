import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:misoca_flutter/document/invoice/invoice_list_page_func.dart';
import 'package:misoca_flutter/document/invoice/invoice_list_provider.dart';
import 'package:misoca_flutter/general/data/network_state.dart';
import 'package:misoca_flutter/general/view/FocusableContainer.dart';
import 'package:misoca_flutter/style/app_color.dart';
import 'package:misoca_flutter/style/app_theme.dart';

import '../../general/data/invoice.dart';

class InvoiceListPage extends ConsumerStatefulWidget {
  static const routeName = "/invoice_list";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return InvoiceListState();
  }
}

class InvoiceListState extends ConsumerState<InvoiceListPage> with InvoiceListPageFunc {
  Exception? lastError;
  final _dueFormat = DateFormat("yyyy/MM/dd");
  final _priceFormat = NumberFormat("#,###");

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(invoiceListProvider.notifier).index();
    });
  }

  @override
  Widget build(BuildContext context) {
    var result = ref.watch(invoiceListProvider);
    ref.listen(invoiceListProvider, (previous, next) {
      if (next.status == NetworkStatus.failed) {
        showError(context, next.error!);
      }
    });
    var refreshIndicator = RefreshIndicator(
        onRefresh: () => onRefreshList(ref),
        child: LayoutBuilder(builder: (context, constrains) {
          var invoiceList = result.value ?? [];
          return ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: invoiceList.length,
              itemBuilder: (BuildContext context, int index) {
                return createRow(context, invoiceList[index]);
              });
        }));

    return Scaffold(
        appBar: AppBar(
          title: const Text("請求書"),
          actions: [
            PopupMenuButton<int>(
              onSelected: (item) => logout(context),
              itemBuilder: (context) => [
                PopupMenuItem<int>(value: 0, child: Text('Logout')),
              ],
            ),
          ],
        ),
        body: refreshIndicator);
  }

  Widget createRow(BuildContext context, Invoice invoice) {
    var subjectId = ConstraintId("subject");
    var contactId = ConstraintId("contact");
    var expiresId = ConstraintId("expires");
    var menuId = ConstraintId("menu");
    var amountId = ConstraintId("amount");

    return FocusableContainer(
        onAction: () {
          onSelectItem(context, invoice);
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: AppColor.secondaryColors.shade600)),
          ),
          child: ConstraintLayout(
            children: [
              Text(
                invoice.subject,
                style: styleTextL.copyWith(color: AppColor.secondaryColors.shade900, fontWeight: FontWeight.w500),
              ).applyConstraint(
                id: subjectId,
                topLeftTo: parent,
              ),
              Text(
                invoice.contactGroupName ?? "",
                style: styleTextM.copyWith(color: AppColor.secondaryColors.shade600),
              ).applyConstraint(id: contactId, top: subjectId.bottom, left: parent.left, margin: EdgeInsets.only(top: 3)),
              Text(
                invoice.paymentDueOn != null ? _dueFormat.format(invoice.paymentDueOn!) : "-",
                style: styleTextM.copyWith(color: AppColor.secondaryColors.shade600),
              ).applyConstraint(id: expiresId, top: contactId.bottom, left: parent.left, margin: EdgeInsets.only(top: 5)),
              PopupMenuButton<String>(
                itemBuilder: (context) {
                  return ["編集", "請求済みにする", "削除"].map((String t) => PopupMenuItem<String>(child: Text(t), value: t)).toList();
                },
              ).applyConstraint(topRightTo: parent),
              Text(
                "${_priceFormat.format(invoice.body.totalAmount.toDouble())}円",
                style: styleTextXL.copyWith(color: AppColor.secondaryColors.shade900, fontWeight: FontWeight.w700),
              ).applyConstraint(bottomRightTo: parent)
            ],
          ),
        ));
  }

  void showError(BuildContext context, Exception e) {
    if (lastError != e) {
      lastError = e;
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        var snackBar = SnackBar(content: Text(e.toString()));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }
  }
}
