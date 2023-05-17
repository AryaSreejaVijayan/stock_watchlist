import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData appTheme = ThemeData(
    primaryColor: colorDarkBlue,
    scaffoldBackgroundColor:colorBackground,
    colorScheme: const ColorScheme.light(primary: colorDarkBlue),
    textSelectionTheme:  TextSelectionThemeData(
      cursorColor: colorLightBlack,
      selectionHandleColor: colorTextGrey,
    ),
    androidOverscrollIndicator: AndroidOverscrollIndicator.stretch);
