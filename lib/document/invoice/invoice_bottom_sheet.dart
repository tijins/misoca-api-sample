import 'package:flutter/material.dart';
import 'package:misoca_flutter/general/view/FocusableContainer.dart';
import 'package:misoca_flutter/style/app_color.dart';
import 'package:misoca_flutter/style/app_theme.dart';

class InvoiceBottomSheet extends StatefulWidget {
  const InvoiceBottomSheet({Key? key}) : super(key: key);

  @override
  State<InvoiceBottomSheet> createState() => _InvoiceBottomSheetState();
}

class _InvoiceBottomSheetState extends State<InvoiceBottomSheet> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: AppColor.secondaryColors.shade100,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FocusableContainer(
                  onAction: () {
                    Navigator.pop(context, "郵送");
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: AppDimen.medium_small),
                    child: Row(
                      children: [
                        Icon(
                          Icons.delivery_dining,
                          color: AppColor.mainColors.shade700,
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 16),
                            child: Text(
                              "郵送",
                              style: TextStyles.m.copyWith(color: AppColor.secondaryColors.shade900),
                            ))
                      ],
                    ),
                  )),
              FocusableContainer(
                  onAction: () {
                    Navigator.pop(context, "メール送信");
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: AppDimen.medium_small),
                    child: Row(
                      children: [
                        Icon(
                          Icons.mail,
                          color: AppColor.mainColors.shade700,
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 16),
                            child: Text(
                              "メール送信",
                              style: TextStyles.m.copyWith(color: AppColor.secondaryColors.shade900),
                            ))
                      ],
                    ),
                  )),
              FocusableContainer(
                  onAction: () {
                    Navigator.pop(context, "共有リンク");
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: AppDimen.medium_small),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.link,
                          color: AppColor.mainColors.shade700,
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 16),
                            child: Text(
                              "共有リンク",
                              style: TextStyles.m.copyWith(color: AppColor.secondaryColors.shade900),
                            ))
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }
}
