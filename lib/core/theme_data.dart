import 'package:flutter/material.dart';

import 'constants/text_style.dart';

ThemeData themeData(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: const Color(0xFFE5E5E5),
    primaryColor: Colors.red,
    appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0.9,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        titleTextStyle: Style.textStyle18.copyWith(color: Colors.black)),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: Theme.of(context).textTheme.titleMedium,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(2.0),
        borderSide: const BorderSide(
          color: Colors.grey,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: const BorderSide(
          color: Colors.grey,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: const BorderSide(
          color: Colors.grey,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: const BorderSide(
          color: Colors.red,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: const BorderSide(
          color: Colors.red,
        ),
      ),
    ),
  );
}
