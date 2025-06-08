import 'package:flutter/material.dart';
import 'package:theme_extensions_annotation/theme_extension_annotation.dart';

part 'la_text_field_theme.g.dart';

@ThemeExtended()
class LaTextFieldTheme with _$LaTextFieldTheme {
  const factory LaTextFieldTheme({
    @ThemeProperty() required Color backgroundColor,
    @ThemeProperty() required Color borderColor,
    @ThemeProperty() required Color disabledBackgroundColor,
    @ThemeProperty() required Color disabledBorderColor,
    @ThemeProperty() required Color hintColor,
    @ThemeProperty() required Color textColor,
  }) = _LaTextFieldTheme;
}

abstract class LaTextFieldColors {
  Color get laTextFieldBackground;
  Color get laTextFieldBorder;
  Color get laTextFieldDisabledBackground;
  Color get laTextFieldDisabledBorder;
  Color get laTextFieldHint;
  Color get laTextFieldText;
}