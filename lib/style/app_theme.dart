import 'package:flutter/material.dart';

import 'app_color.dart';

var appTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.light,
      primarySwatch: AppColor.mainColors,
      accentColor: AppColor.accentColors,
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(backgroundColor: AppColor.mainColors.shade700),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.mainColors.shade700,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(2))),
            minimumSize: const Size.fromHeight(48),
            foregroundColor: Colors.white)),
    cardTheme: const CardTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
    ),
    snackBarTheme: SnackBarThemeData(backgroundColor: AppColor.secondaryColors[900], behavior: SnackBarBehavior.floating));

const styleTextXL = TextStyle(inherit: true, fontSize: 16);
const styleTextL = TextStyle(inherit: true, fontSize: 14);
const styleTextM = TextStyle(inherit: true, fontSize: 12);

class TextStyles {
  static const xl = TextStyle(fontSize: 21);
  static const l = TextStyle(fontSize: 18);
  static const m = TextStyle(fontSize: 16);
  static const s = TextStyle(fontSize: 14);
  static const xs = TextStyle(fontSize: 12);
  static final titleXL = xl.copyWith(color: AppColor.secondaryColors.shade900);
  static final labelXS = xs.copyWith(color: AppColor.secondaryColors.shade600);
  static final labelS = s.copyWith(color: AppColor.secondaryColors.shade600);
  static final bodyS = s.copyWith(color: AppColor.secondaryColors.shade600);
  static final bodyM = m.copyWith(color: AppColor.secondaryColors.shade600);
}

class AppDimen {
  static const quarter = 4.0;
  static const small = 8.0;
  static const medium_small = 12.0;
  static const medium = 16.0;
}
