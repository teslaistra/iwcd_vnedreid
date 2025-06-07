import 'package:flutter/material.dart';
import 'package:theme_extensions_annotation/theme_extension_annotation.dart';

part 'welcome_page_theme.g.dart';

@ThemeExtended()
class WelcomePageTheme with _$WelcomePageTheme {
  const factory WelcomePageTheme({
    @ThemeProperty()
    required Color welcomeTextColor,
  }) = _WelcomePageTheme;
}

abstract class WelcomePageColors {
  Color get welcomeText;
}