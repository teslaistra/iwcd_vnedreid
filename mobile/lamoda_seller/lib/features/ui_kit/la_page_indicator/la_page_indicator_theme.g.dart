// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'la_page_indicator_theme.dart';

// **************************************************************************
// ThemeExtensionGenerator
// **************************************************************************

final _LaPageIndicatorThemePrivateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `LaPageIndicatorTheme._()`. This constructor is only meant to be used by themeExtended and you are not supposed to need it nor use it.',
);

mixin _$LaPageIndicatorTheme {
  Color get enabledColor =>
      throw _LaPageIndicatorThemePrivateConstructorUsedError;
  Color get disabledColor =>
      throw _LaPageIndicatorThemePrivateConstructorUsedError;
  Color get textColor => throw _LaPageIndicatorThemePrivateConstructorUsedError;

  LaPageIndicatorTheme copyWith({
    Color? enabledColor,
    Color? disabledColor,
    Color? textColor,
  }) => throw _LaPageIndicatorThemePrivateConstructorUsedError;

  LaPageIndicatorTheme copyWithDecoration(
    LaPageIndicatorThemeDecoration? decoration,
  ) => throw _LaPageIndicatorThemePrivateConstructorUsedError;
}

class _LaPageIndicatorTheme implements LaPageIndicatorTheme {
  final Color enabledColor;
  final Color disabledColor;
  final Color textColor;

  const _LaPageIndicatorTheme({
    required this.enabledColor,
    required this.disabledColor,
    required this.textColor,
  });

  _LaPageIndicatorTheme copyWith({
    Color? enabledColor,
    Color? disabledColor,
    Color? textColor,
  }) => _LaPageIndicatorTheme(
    enabledColor: enabledColor ?? this.enabledColor,
    disabledColor: disabledColor ?? this.disabledColor,
    textColor: textColor ?? this.textColor,
  );

  _LaPageIndicatorTheme copyWithDecoration(
    LaPageIndicatorThemeDecoration? decoration,
  ) =>
      decoration != null
          ? _LaPageIndicatorTheme(
            enabledColor: decoration.enabledColor ?? this.enabledColor,
            disabledColor: decoration.disabledColor ?? this.disabledColor,
            textColor: decoration.textColor ?? this.textColor,
          )
          : this;

  static LaPageIndicatorTheme? lerp(
    LaPageIndicatorTheme? a,
    LaPageIndicatorTheme? b,
    double t,
  ) {
    if (a == null && b == null) return null;
    if (a == null) return b;
    if (b == null) return a;
    return LaPageIndicatorTheme(
      enabledColor: Color.lerp(a.enabledColor, b.enabledColor, t)!,
      disabledColor: Color.lerp(a.disabledColor, b.disabledColor, t)!,
      textColor: Color.lerp(a.textColor, b.textColor, t)!,
    );
  }
}

class LaPageIndicatorThemeDecoration {
  final Color? enabledColor;
  final Color? disabledColor;
  final Color? textColor;

  const LaPageIndicatorThemeDecoration({
    this.enabledColor,
    this.disabledColor,
    this.textColor,
  });
}

extension LaPageIndicatorThemeThemeData on ThemeData {
  LaPageIndicatorTheme get laPageIndicatorThemeExtension =>
      this.extension<LaPageIndicatorThemeExtension>()!.theme;
}

class LaPageIndicatorThemeExtension
    extends ThemeExtension<LaPageIndicatorThemeExtension> {
  final LaPageIndicatorTheme theme;

  const LaPageIndicatorThemeExtension(this.theme);

  @override
  LaPageIndicatorThemeExtension copyWith({LaPageIndicatorTheme? theme}) {
    return LaPageIndicatorThemeExtension(theme ?? this.theme);
  }

  @override
  LaPageIndicatorThemeExtension lerp(
    LaPageIndicatorThemeExtension? other,
    double t,
  ) {
    if (other == null) return this;
    return LaPageIndicatorThemeExtension(
      _LaPageIndicatorTheme.lerp(theme, other.theme, t)!,
    );
  }
}
