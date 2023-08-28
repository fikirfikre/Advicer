import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static final  _lightprimaryColor= Colors.blueGrey.shade50;
  static final _lightPrimaryVariantColor =  Colors.blueGrey.shade800;
  static final _lightOnPrimaryColor =Colors.blueGrey.shade200;
  static const _lightTextColorPrimary = Colors.black;
  static const _appbarColorLight = Color.fromARGB(255, 119, 185, 239);


  static final _darkPrimaryColor = Colors.blueGrey.shade900;
  static const _darkPrimaryVariantColor = Colors.black;
  static final _darkOnPrimaryColor = Colors.blueGrey.shade300;
  static const _darkTextColorPrimary = Colors.white;
  static final _appbarColorDark = Colors.blueGrey.shade800;


  static const _iconColor= Colors.white;
  static const _accentColor = Color.fromRGBO(74, 217, 217, 1);
 

  static const TextStyle _lightHeadingText = TextStyle(
    color: _lightTextColorPrimary,
    fontFamily: "Rubik",
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );



  static const TextStyle _lightBodyText = TextStyle(
    color: _lightTextColorPrimary,
    fontFamily: "Rubik",
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.bold,
    fontSize: 16
  );

  static const TextTheme _lightTextTheme = TextTheme(
    displayLarge: _lightHeadingText,
    bodyLarge: _lightBodyText
  );

  static final TextStyle _darkThemeHeadingTextStyle = _lightHeadingText.copyWith(color: _darkTextColorPrimary);
  static final TextStyle _darkThemeBodyTextStyle = _lightBodyText.copyWith(color: _darkTextColorPrimary);

  static final TextTheme _darkTextTheme = TextTheme(
    displayLarge: _darkThemeHeadingTextStyle,
    bodyLarge: _darkThemeBodyTextStyle
  );

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: _lightOnPrimaryColor,
    appBarTheme:const AppBarTheme(
      color: _appbarColorLight,
      iconTheme: IconThemeData(color: _iconColor),

    ),
    colorScheme: ColorScheme.light(
      primary: _lightprimaryColor,
      onPrimary: _lightOnPrimaryColor,
      secondary: _accentColor,
      primaryContainer: _lightPrimaryVariantColor
    ),
    textTheme: _lightTextTheme,
    bottomAppBarTheme:const BottomAppBarTheme(color: _appbarColorLight)
);
  static final ThemeData darkTheme = ThemeData(
     scaffoldBackgroundColor: _darkPrimaryColor,
     appBarTheme: AppBarTheme(
      color: _appbarColorDark,
      iconTheme: IconThemeData(color: _iconColor)
     ),
     colorScheme: ColorScheme.dark(
      primary: _darkPrimaryColor,
      onPrimary: _darkOnPrimaryColor,
      secondary: _accentColor,
      primaryContainer: _darkPrimaryVariantColor
     ),
     textTheme: _darkTextTheme,
     bottomAppBarTheme: BottomAppBarTheme(color: _appbarColorDark)
      );
}
