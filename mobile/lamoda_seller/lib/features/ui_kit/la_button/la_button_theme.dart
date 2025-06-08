import 'package:flutter/material.dart';
import 'package:theme_extensions_annotation/theme_extension_annotation.dart';

part 'la_button_theme.g.dart';

@ThemeExtended()
class LaButtonTheme with _$LaButtonTheme {
  const factory LaButtonTheme({
    @ThemeProperty()
    required double borderRadius,
    @ThemeProperty()
    required Color primaryStateColor,
    @ThemeProperty()
    required Color primaryStateTextColor,
    @ThemeProperty()
    required Color secondaryStateColor,
    @ThemeProperty()
    required Color secondaryStateTextColor,
  }) = _LaButtonTheme;
}

abstract class LaButtonColors {
  Color get laButtonPrimaryState;
  Color get laButtonPrimaryStateText;
  Color get laButtonSecondaryState;
  Color get laButtonSecondaryStateText;
}