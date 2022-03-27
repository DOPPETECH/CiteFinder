// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';
SharedPreferences _prefs;

abstract class FlutterFlowTheme {
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static FlutterFlowTheme of(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? DarkModeTheme()
          : LightModeTheme();

  Color primaryColor;
  Color secondaryColor;
  Color tertiaryColor;
  Color alternate;
  Color primaryBackground;
  Color secondaryBackground;
  Color primaryText;
  Color secondaryText;
  Color themeText;

  Color grayButton;
  Color danger;
  Color pending;

  TextStyle get title1 => GoogleFonts.getFont(
        'Poppins',
        color: primaryColor,
        fontWeight: FontWeight.w600,
        fontSize: 24,
      );
  TextStyle get title2 => GoogleFonts.getFont(
        'Poppins',
        color: primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 22,
      );
  TextStyle get title3 => GoogleFonts.getFont(
        'Poppins',
        color: primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      );
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Poppins',
        color: primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      );
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Poppins',
        color: themeText,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      );
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Roboto',
        color: primaryText,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      );
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Roboto',
        color: primaryText,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      );
}

class LightModeTheme extends FlutterFlowTheme {
  Color primaryColor = const Color(0xFF584BBB);
  Color secondaryColor = const Color(0xFF5C7CDF);
  Color tertiaryColor = const Color(0xFF2C8CD6);
  Color alternate = const Color(0xFFFF5963);
  Color primaryBackground = const Color(0xFFE5E5E5);
  Color secondaryBackground = const Color(0xFFFFFFFF);
  Color primaryText = const Color(0xFF110E25);
  Color secondaryText = const Color(0xFF57636C);
  Color themeText = const Color(0xFF110E25);

  Color grayButton = Color(0xFFDAD6F0);
  Color danger = Color(0xFFDF5C5C);
  Color pending = Color(0xFFFFAA1E);
}

class DarkModeTheme extends FlutterFlowTheme {
  Color primaryColor = const Color(0xFF584BBB);
  Color secondaryColor = const Color(0xFF5C7CDF);
  Color tertiaryColor = const Color(0xFF2C8CD6);
  Color alternate = const Color(0xFFFF5963);
  Color primaryBackground = const Color(0xFF000000);
  Color secondaryBackground = const Color(0xFF000000);
  Color primaryText = const Color(0xFF110E25);
  Color secondaryText = const Color(0xFFC1C4C8);
  Color themeText = const Color(0xFFFFFFFF);

  Color grayButton = Color(0xFFDAD6F0);
  Color danger = Color(0xFFDF5C5C);
  Color pending = Color(0xFFFFAA1E);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String fontFamily,
    Color color,
    double fontSize,
    FontWeight fontWeight,
    FontStyle fontStyle,
    bool useGoogleFonts = true,
    double lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              height: lineHeight,
            );
}
