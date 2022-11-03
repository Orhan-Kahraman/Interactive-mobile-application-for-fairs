import 'package:flutter/material.dart';

class LightTheme {
  late ThemeData theme;
  final double _appbarRadius = 15;
  final double _appbarTextSize = 22;

  LightTheme() {
    theme = ThemeData(
      colorScheme: ColorScheme.light(primary: _LightColors()._cristmasBlue),
      appBarTheme: AppBarTheme(
          titleTextStyle:
              TextStyle(fontSize: _appbarTextSize, fontWeight: FontWeight.w400),
          centerTitle: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(_appbarRadius))),
          elevation: 5,
          iconTheme: IconThemeData(color: _LightColors()._appbarIconColor)),
      //fontFamily: 'Montserrat',
      textTheme: TextTheme(
        subtitle1: ThemeData.light().textTheme.subtitle1?.copyWith(
              color: _LightColors()._subtitle1Color,
            ),
        headline3: ThemeData.light().textTheme.headline2?.copyWith(
              color: _LightColors()._cristmasBlue,
              //fontFamily: 'Montserrat',
            ),
      ),
      scaffoldBackgroundColor: _LightColors()._scaffoldBackColor,
    );
  }
}

class _LightColors {
  final Color _cristmasBlue = const Color.fromRGBO(47, 141, 188, 0.8);
  final Color _subtitle1Color = Colors.white;
  final Color _appbarIconColor = Colors.black38;
  final Color _scaffoldBackColor = Colors.white;
}
