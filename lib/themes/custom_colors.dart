import 'package:flutter/material.dart';

class CColors {
  // Define static constants for light theme colors
  static const Color lightPrimary = Color(0xff5565ff);
  static const Color lightSecondary = Colors.blueAccent;
  static const Color lightOverlay = Color(0xff6472fa);
  static const Color lightCard = Colors.white;
  static Color? lightSearchBar = Colors.grey[100];


  // Define static constants for dark theme colors
  static const Color darkPrimary = Color(0xFF3264C8);
  static const Color darkSecondary = Colors.cyan;
  static const Color darkText = Colors.white;
  static const Color darkOverlay = Color(0xFF4B7DD9);
  static const Color darkCard = Color(0xff111118);
  static Color? darkSearchBar = Colors.grey[900];






  // Methods to get colors based on the theme
  static Color primaryColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? darkPrimary : lightPrimary;
  }

  static Color secondaryColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? darkSecondary : lightSecondary;
  }

  static Color textColor(BuildContext context) {
    // Assuming text color only defined for dark theme; change as needed.
    return Theme.of(context).brightness == Brightness.dark ? darkText : Colors.black;
  }

  static Color overlayColor(BuildContext context) {
    // Assuming overlay color only defined for dark theme; change as needed.
    return Theme.of(context).brightness == Brightness.dark ? darkOverlay : lightOverlay;
  }

  static Color cardColor(BuildContext context) {
    // Assuming overlay color only defined for dark theme; change as needed.
    return Theme.of(context).brightness == Brightness.dark ? darkCard : lightCard;
  }

  static Color? searchBarColor(BuildContext context) {
    // Assuming overlay color only defined for dark theme; change as needed.
    return Theme.of(context).brightness == Brightness.dark ? darkSearchBar : lightSearchBar;
  }

  static Color fadeColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? Colors.black : Colors.white;
  }

}
