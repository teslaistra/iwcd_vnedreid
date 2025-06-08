import 'package:flutter/material.dart';
import 'package:theme_extensions_annotation/theme_extension_annotation.dart';

part 'la_chip_theme.g.dart';

@ThemeExtended()
class LaChipTheme with _$LaChipTheme {
  const factory LaChipTheme({
    @ThemeProperty()
    required Color color,
    @ThemeProperty()
    required Color textColor,
  }) = _LaChipTheme;
}

abstract class LaChipColors {
  Color get laChipEnabled;
  Color get laChipText;
}