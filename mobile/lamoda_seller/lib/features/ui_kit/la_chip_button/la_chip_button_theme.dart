import 'package:flutter/material.dart';
import 'package:theme_extensions_annotation/theme_extension_annotation.dart';

part 'la_chip_button_theme.g.dart';

@ThemeExtended()
class LaChipButtonTheme with _$LaChipButtonTheme {
  const factory LaChipButtonTheme({
    @ThemeProperty()
    required Color enabledColor,
    @ThemeProperty()
    required Color disabledColor,
    @ThemeProperty()
    required Color enabledTextColor,
    @ThemeProperty()
    required Color disabledTextColor,
  }) = _LaChipButtonTheme;
}

abstract class LaChipButtonColors {
  Color get laChipButtonEnabled;
  Color get laChipButtonDisabled;
  Color get laChipButtonEnabledText;
  Color get laChipButtonDisabledText;
}