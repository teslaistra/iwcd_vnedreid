import 'package:flutter/material.dart';
import 'package:theme_extensions_annotation/theme_extension_annotation.dart';

part 'la_blur_container_theme.g.dart';

@ThemeExtended()
class LaBlurContainerTheme with _$LaBlurContainerTheme {
  const factory LaBlurContainerTheme({
    @ThemeProperty()
    required double blurStrength,
    @ThemeProperty()
    required Color blurColor,
  }) = _LaBlurContainerTheme;
}

abstract class LaBlurContainerColors {
  Color get laBlurContainerBlur;
}