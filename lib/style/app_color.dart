import 'package:flutter/material.dart';

const MaterialColor _mainColors = MaterialColor(0xff1DBACD, <int, Color>{
  50: Color(0xffe1f7fa),
  100: Color(0xffC3EFF4),
  200: Color(0xff84DEE9),
  300: Color(0xff56CCDB),
  400: Color(0xff3DC4D5),
  500: Color(0xff1DBACD),
  600: Color(0xff00ACC1),
  700: Color(0xff009FB2),
  800: Color(0xff008B9E),
  900: Color(0xff16808A)
});

const MaterialColor _accentColors = MaterialColor(0xffE05353, <int, Color>{
  50: Color(0xffF6C3C3),
  100: Color(0xffF6C3C3),
  200: Color(0xffF38F8F),
  300: Color(0xffF06F6F),
  400: Color(0xffEB5757),
  500: Color(0xffE05353),
  600: Color(0xffD34D4D),
  700: Color(0xffC63C3C),
  800: Color(0xffB63838),
  900: Color(0xffA13535)
});

const MaterialColor _secondaryColors = MaterialColor(0xffA7B1B6, <int, Color>{
  50: Color(0xffF9FBFD),
  100: Color(0xffF5F7F9),
  200: Color(0xffE4EAF1),
  300: Color(0xffD9E0E8),
  400: Color(0xffC8CFD7),
  500: Color(0xffA7B1B6),
  600: Color(0xff858C90),
  700: Color(0xff555D65),
  800: Color(0xff3B3F47),
  900: Color(0xff162533)
});

class AppColor {
  static MaterialColor mainColors = _mainColors;
  static MaterialColor accentColors = _accentColors;
  static MaterialColor secondaryColors = _secondaryColors;
}
