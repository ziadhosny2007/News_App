import 'package:flutter/material.dart';

class AppTheme {
  //
  static ThemeData dark = ThemeData(
    scaffoldBackgroundColor: Color(0xff202020),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Color(0xff1877F2),
      titleTextStyle: TextStyle(
        fontWeight: .bold,
        fontSize: 22,
        color: Color(0xffffffff),
      ),
    ),
    primaryTextTheme: TextTheme(
      bodySmall: TextStyle(
        color: Color(0xffB0B3B8),
        fontWeight: .w400,
        fontSize: 13,
      ),
      bodyMedium: TextStyle(
        color: Color(0xffE4E6EB),
        fontWeight: .w400,
        fontSize: 16,
      ),
      bodyLarge: TextStyle(
        fontWeight: .w400,
        fontSize: 24,
        color: Color(0xffE4E6EB),
      ),
      displayMedium: TextStyle(
        color: Color(0xffDADBDD),
        fontWeight: .w400,
        fontSize: 16,
      ),
    ),
  );
}
