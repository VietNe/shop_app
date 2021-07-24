import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

ThemeData theme() {
  return ThemeData(
    appBarTheme: appBarTheme(),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Muli',
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
  );
}

TextTheme textTheme() {
  return const TextTheme(
    bodyText1: TextStyle(
      color: kTextColor,
    ),
    bodyText2: TextStyle(
      color: kTextColor,
    ),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
      color: Colors.white,
      elevation: 0,
      // systemOverlayStyle: SystemUiOverlayStyle.light,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
          color: Color(0XFF8B8B8B),
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'Muli'));
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder({Color borderColor = kTextColor}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: BorderSide(color: borderColor),
        gapPadding: 10,
      );

  return InputDecorationTheme(
    errorStyle: const TextStyle(height: 0),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    floatingLabelStyle: const TextStyle(
      color: kPrimaryColor,
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder(),
    focusedBorder: outlineInputBorder(),
    border: outlineInputBorder(),
    focusedErrorBorder: outlineInputBorder(borderColor: kWarningColor),
  );
}
