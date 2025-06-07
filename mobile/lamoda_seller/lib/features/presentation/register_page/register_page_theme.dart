import 'package:flutter/material.dart';
import 'package:theme_extensions_annotation/theme_extension_annotation.dart';

part 'register_page_theme.g.dart';

@ThemeExtended()
class RegisterPageTheme with _$RegisterPageTheme{
  const factory RegisterPageTheme({
    @ThemeProperty()
    required Color pageIndicatorEnabledColor,
    @ThemeProperty()
    required Color pageIndicatorDisabledColor,
    @ThemeProperty()
    required Color pageIndicatorTextColor,
  }) = _RegisterPageTheme;
}

abstract class RegisterPageColors {
  Color get pageIndicatorEnabled;
  Color get pageIndicatorDisabled;
  Color get pageIndicatorText;
}