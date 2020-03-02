import 'package:flutter/material.dart';
import 'package:thingszilla/constants.dart';

class AppTheme {
  static const TextStyle display1 = TextStyle(
    fontFamily: kFontPrimary,
    color: kPrimaryColor,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 2,
  );

  static const TextStyle display2 = TextStyle(
    fontFamily: kFontPrimary,
    color: kPrimaryColor,
    fontSize: 32,
    fontWeight: FontWeight.normal,
    letterSpacing: 1.1,
  );

  static final TextStyle heading = TextStyle(
    fontFamily: kFontPrimary,
    fontWeight: FontWeight.w900,
    fontSize: 34,
    color: kPrimaryColor.withOpacity(0.8),
    letterSpacing: 1.2,
  );

  static final TextStyle subHeading = TextStyle(
    inherit: true,
    fontFamily: kFontPrimary,
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: kSecondaryColor
  );
}