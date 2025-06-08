// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'la_button_theme.dart';

// **************************************************************************
// ThemeExtensionGenerator
// **************************************************************************

final _LaButtonThemePrivateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `LaButtonTheme._()`. This constructor is only meant to be used by themeExtended and you are not supposed to need it nor use it.',
);

mixin _$LaButtonTheme {
  double get borderRadius => throw _LaButtonThemePrivateConstructorUsedError;
  Color get primaryStateColor =>
      throw _LaButtonThemePrivateConstructorUsedError;
  Color get primaryStateTextColor =>
      throw _LaButtonThemePrivateConstructorUsedError;
  Color get secondaryStateColor =>
      throw _LaButtonThemePrivateConstructorUsedError;
  Color get secondaryStateTextColor =>
      throw _LaButtonThemePrivateConstructorUsedError;

  LaButtonTheme copyWith({
    double? borderRadius,
    Color? primaryStateColor,
    Color? primaryStateTextColor,
    Color? secondaryStateColor,
    Color? secondaryStateTextColor,
  }) => throw _LaButtonThemePrivateConstructorUsedError;

  LaButtonTheme copyWithDecoration(LaButtonThemeDecoration? decoration) =>
      throw _LaButtonThemePrivateConstructorUsedError;
}

class _LaButtonTheme implements LaButtonTheme {
  final double borderRadius;
  final Color primaryStateColor;
  final Color primaryStateTextColor;
  final Color secondaryStateColor;
  final Color secondaryStateTextColor;

  const _LaButtonTheme({
    required this.borderRadius,
    required this.primaryStateColor,
    required this.primaryStateTextColor,
    required this.secondaryStateColor,
    required this.secondaryStateTextColor,
  });

  _LaButtonTheme copyWith({
    double? borderRadius,
    Color? primaryStateColor,
    Color? primaryStateTextColor,
    Color? secondaryStateColor,
    Color? secondaryStateTextColor,
  }) => _LaButtonTheme(
    borderRadius: borderRadius ?? this.borderRadius,
    primaryStateColor: primaryStateColor ?? this.primaryStateColor,
    primaryStateTextColor: primaryStateTextColor ?? this.primaryStateTextColor,
    secondaryStateColor: secondaryStateColor ?? this.secondaryStateColor,
    secondaryStateTextColor:
        secondaryStateTextColor ?? this.secondaryStateTextColor,
  );

  _LaButtonTheme copyWithDecoration(LaButtonThemeDecoration? decoration) =>
      decoration != null
          ? _LaButtonTheme(
            borderRadius: decoration.borderRadius ?? this.borderRadius,
            primaryStateColor:
                decoration.primaryStateColor ?? this.primaryStateColor,
            primaryStateTextColor:
                decoration.primaryStateTextColor ?? this.primaryStateTextColor,
            secondaryStateColor:
                decoration.secondaryStateColor ?? this.secondaryStateColor,
            secondaryStateTextColor:
                decoration.secondaryStateTextColor ??
                this.secondaryStateTextColor,
          )
          : this;

  static LaButtonTheme? lerp(LaButtonTheme? a, LaButtonTheme? b, double t) {
    if (a == null && b == null) return null;
    if (a == null) return b;
    if (b == null) return a;
    return LaButtonTheme(
      borderRadius: Tween<double>(
        begin: a.borderRadius,
        end: b.borderRadius,
      ).transform(t),
      primaryStateColor:
          Color.lerp(a.primaryStateColor, b.primaryStateColor, t)!,
      primaryStateTextColor:
          Color.lerp(a.primaryStateTextColor, b.primaryStateTextColor, t)!,
      secondaryStateColor:
          Color.lerp(a.secondaryStateColor, b.secondaryStateColor, t)!,
      secondaryStateTextColor:
          Color.lerp(a.secondaryStateTextColor, b.secondaryStateTextColor, t)!,
    );
  }
}

class LaButtonThemeDecoration {
  final double? borderRadius;
  final Color? primaryStateColor;
  final Color? primaryStateTextColor;
  final Color? secondaryStateColor;
  final Color? secondaryStateTextColor;

  const LaButtonThemeDecoration({
    this.borderRadius,
    this.primaryStateColor,
    this.primaryStateTextColor,
    this.secondaryStateColor,
    this.secondaryStateTextColor,
  });
}

extension LaButtonThemeThemeData on ThemeData {
  LaButtonTheme get laButtonThemeExtension =>
      this.extension<LaButtonThemeExtension>()!.theme;
}

class LaButtonThemeExtension extends ThemeExtension<LaButtonThemeExtension> {
  final LaButtonTheme theme;

  const LaButtonThemeExtension(this.theme);

  @override
  LaButtonThemeExtension copyWith({LaButtonTheme? theme}) {
    return LaButtonThemeExtension(theme ?? this.theme);
  }

  @override
  LaButtonThemeExtension lerp(LaButtonThemeExtension? other, double t) {
    if (other == null) return this;
    return LaButtonThemeExtension(_LaButtonTheme.lerp(theme, other.theme, t)!);
  }
}
