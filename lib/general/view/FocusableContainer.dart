import 'package:flutter/material.dart';

class FocusableContainer extends StatelessWidget {
  const FocusableContainer({Key? super.key, this.child, this.onAction});

  final Widget? child;
  final Function? onAction;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onAction?.call();
      },
      child: child,
    );
  }
}
