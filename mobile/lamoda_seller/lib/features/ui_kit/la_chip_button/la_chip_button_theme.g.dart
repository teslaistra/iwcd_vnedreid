// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'la_chip_button_theme.dart';

// **************************************************************************
// ThemeExtensionGenerator
// **************************************************************************

final _LaChipButtonThemePrivateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `LaChipButtonTheme._()`. This constructor is only meant to be used by themeExtended and you are not supposed to need it nor use it.',
);

mixin _$LaChipButtonTheme {
  Color get enabledColor => throw _LaChipButtonThemePrivateConstructorUsedError;
  Color get disabledColor =>
      throw _LaChipButtonThemePrivateConstructorUsedError;
  Color get enabledTextColor =>
      throw _LaChipButtonThemePrivateConstructorUsedError;
  Color get disabledTextColor =>
      throw _LaChipButtonThemePrivateConstructorUsedError;

  LaChipButtonTheme copyWith({
    Color? enabledColor,
    Color? disabledColor,
    Color? enabledTextColor,
    Color? disabledTextColor,
  }) => throw _LaChipButtonThemePrivateConstructorUsedError;

  LaChipButtonTheme copyWithDecoration(
    LaChipButtonThemeDecoration? decoration,
  ) => throw _LaChipButtonThemePrivateConstructorUsedError;
}

class _LaChipButtonTheme implements LaChipButtonTheme {
  final Color enabledColor;
  final Color disabledColor;
  final Color enabledTextColor;
  final Color disabledTextColor;

  const _LaChipButtonTheme({
    required this.enabledColor,
    required this.disabledColor,
    required this.enabledTextColor,
    required this.disabledTextColor,
  });

  _LaChipButtonTheme copyWith({
    Color? enabledColor,
    Color? disabledColor,
    Color? enabledTextColor,
    Color? disabledTextColor,
  }) => _LaChipButtonTheme(
    enabledColor: enabledColor ?? this.enabledColor,
    disabledColor: disabledColor ?? this.disabledColor,
    enabledTextColor: enabledTextColor ?? this.enabledTextColor,
    disabledTextColor: disabledTextColor ?? this.disabledTextColor,
  );

  _LaChipButtonTheme copyWithDecoration(
    LaChipButtonThemeDecoration? decoration,
  ) =>
      decoration != null
          ? _LaChipButtonTheme(
            enabledColor: decoration.enabledColor ?? this.enabledColor,
            disabledColor: decoration.disabledColor ?? this.disabledColor,
            enabledTextColor:
                decoration.enabledTextColor ?? this.enabledTextColor,
            disabledTextColor:
                decoration.disabledTextColor ?? this.disabledTextColor,
          )
          : this;

  static LaChipButtonTheme? lerp(
    LaChipButtonTheme? a,
    LaChipButtonTheme? b,
    double t,
  ) {
    if (a == null && b == null) return null;
    if (a == null) return b;
    if (b == null) return a;
    return LaChipButtonTheme(
      enabledColor: Color.lerp(a.enabledColor, b.enabledColor, t)!,
      disabledColor: Color.lerp(a.disabledColor, b.disabledColor, t)!,
      enabledTextColor: Color.lerp(a.enabledTextColor, b.enabledTextColor, t)!,
      disabledTextColor:
          Color.lerp(a.disabledTextColor, b.disabledTextColor, t)!,
    );
  }
}

class LaChipButtonThemeDecoration {
  final Color? enabledColor;
  final Color? disabledColor;
  final Color? enabledTextColor;
  final Color? disabledTextColor;

  const LaChipButtonThemeDecoration({
    this.enabledColor,
    this.disabledColor,
    this.enabledTextColor,
    this.disabledTextColor,
  });
}

extension LaChipButtonThemeThemeData on ThemeData {
  LaChipButtonTheme get laChipButtonThemeExtension =>
      this.extension<LaChipButtonThemeExtension>()!.theme;
}

class LaChipButtonThemeExtension
    extends ThemeExtension<LaChipButtonThemeExtension> {
  final LaChipButtonTheme theme;

  const LaChipButtonThemeExtension(this.theme);

  @override
  LaChipButtonThemeExtension copyWith({LaChipButtonTheme? theme}) {
    return LaChipButtonThemeExtension(theme ?? this.theme);
  }

  @override
  LaChipButtonThemeExtension lerp(LaChipButtonThemeExtension? other, double t) {
    if (other == null) return this;
    return LaChipButtonThemeExtension(
      _LaChipButtonTheme.lerp(theme, other.theme, t)!,
    );
  }
}
