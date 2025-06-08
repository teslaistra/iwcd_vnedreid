import 'package:flutter/material.dart';
import 'package:theme_extensions_annotation/theme_extension_annotation.dart';

part 'la_page_indicator_theme.g.dart';

@ThemeExtended()
class LaPageIndicatorTheme with _$LaPageIndicatorTheme {
  const factory LaPageIndicatorTheme({
    @ThemeProperty()
    required Color enabledColor,
    @ThemeProperty()
    required Color disabledColor,
    @ThemeProperty()
    required Color textColor,
  }) = _LaPageIndicatorTheme;
}

abstract class LaPageIndicatorColors {
  Color get laPageIndicatorEnabled;
  Color get laPageIndicatorDisabled;
  Color get laPageIndicatorText;
}