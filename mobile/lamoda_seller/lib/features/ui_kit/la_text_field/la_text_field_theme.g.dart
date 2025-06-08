// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'la_text_field_theme.dart';

// **************************************************************************
// ThemeExtensionGenerator
// **************************************************************************

final _LaTextFieldThemePrivateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `LaTextFieldTheme._()`. This constructor is only meant to be used by themeExtended and you are not supposed to need it nor use it.',
);

mixin _$LaTextFieldTheme {
  Color get backgroundColor =>
      throw _LaTextFieldThemePrivateConstructorUsedError;
  Color get borderColor => throw _LaTextFieldThemePrivateConstructorUsedError;
  Color get disabledBackgroundColor =>
      throw _LaTextFieldThemePrivateConstructorUsedError;
  Color get disabledBorderColor =>
      throw _LaTextFieldThemePrivateConstructorUsedError;
  Color get hintColor => throw _LaTextFieldThemePrivateConstructorUsedError;
  Color get textColor => throw _LaTextFieldThemePrivateConstructorUsedError;

  LaTextFieldTheme copyWith({
    Color? backgroundColor,
    Color? borderColor,
    Color? disabledBackgroundColor,
    Color? disabledBorderColor,
    Color? hintColor,
    Color? textColor,
  }) => throw _LaTextFieldThemePrivateConstructorUsedError;

  LaTextFieldTheme copyWithDecoration(LaTextFieldThemeDecoration? decoration) =>
      throw _LaTextFieldThemePrivateConstructorUsedError;
}

class _LaTextFieldTheme implements LaTextFieldTheme {
  final Color backgroundColor;
  final Color borderColor;
  final Color disabledBackgroundColor;
  final Color disabledBorderColor;
  final Color hintColor;
  final Color textColor;

  const _LaTextFieldTheme({
    required this.backgroundColor,
    required this.borderColor,
    required this.disabledBackgroundColor,
    required this.disabledBorderColor,
    required this.hintColor,
    required this.textColor,
  });

  _LaTextFieldTheme copyWith({
    Color? backgroundColor,
    Color? borderColor,
    Color? disabledBackgroundColor,
    Color? disabledBorderColor,
    Color? hintColor,
    Color? textColor,
  }) => _LaTextFieldTheme(
    backgroundColor: backgroundColor ?? this.backgroundColor,
    borderColor: borderColor ?? this.borderColor,
    disabledBackgroundColor:
        disabledBackgroundColor ?? this.disabledBackgroundColor,
    disabledBorderColor: disabledBorderColor ?? this.disabledBorderColor,
    hintColor: hintColor ?? this.hintColor,
    textColor: textColor ?? this.textColor,
  );

  _LaTextFieldTheme copyWithDecoration(
    LaTextFieldThemeDecoration? decoration,
  ) =>
      decoration != null
          ? _LaTextFieldTheme(
            backgroundColor: decoration.backgroundColor ?? this.backgroundColor,
            borderColor: decoration.borderColor ?? this.borderColor,
            disabledBackgroundColor:
                decoration.disabledBackgroundColor ??
                this.disabledBackgroundColor,
            disabledBorderColor:
                decoration.disabledBorderColor ?? this.disabledBorderColor,
            hintColor: decoration.hintColor ?? this.hintColor,
            textColor: decoration.textColor ?? this.textColor,
          )
          : this;

  static LaTextFieldTheme? lerp(
    LaTextFieldTheme? a,
    LaTextFieldTheme? b,
    double t,
  ) {
    if (a == null && b == null) return null;
    if (a == null) return b;
    if (b == null) return a;
    return LaTextFieldTheme(
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t)!,
      borderColor: Color.lerp(a.borderColor, b.borderColor, t)!,
      disabledBackgroundColor:
          Color.lerp(a.disabledBackgroundColor, b.disabledBackgroundColor, t)!,
      disabledBorderColor:
          Color.lerp(a.disabledBorderColor, b.disabledBorderColor, t)!,
      hintColor: Color.lerp(a.hintColor, b.hintColor, t)!,
      textColor: Color.lerp(a.textColor, b.textColor, t)!,
    );
  }
}

class LaTextFieldThemeDecoration {
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? disabledBackgroundColor;
  final Color? disabledBorderColor;
  final Color? hintColor;
  final Color? textColor;

  const LaTextFieldThemeDecoration({
    this.backgroundColor,
    this.borderColor,
    this.disabledBackgroundColor,
    this.disabledBorderColor,
    this.hintColor,
    this.textColor,
  });
}

extension LaTextFieldThemeThemeData on ThemeData {
  LaTextFieldTheme get laTextFieldThemeExtension =>
      this.extension<LaTextFieldThemeExtension>()!.theme;
}

class LaTextFieldThemeExtension
    extends ThemeExtension<LaTextFieldThemeExtension> {
  final LaTextFieldTheme theme;

  const LaTextFieldThemeExtension(this.theme);

  @override
  LaTextFieldThemeExtension copyWith({LaTextFieldTheme? theme}) {
    return LaTextFieldThemeExtension(theme ?? this.theme);
  }

  @override
  LaTextFieldThemeExtension lerp(LaTextFieldThemeExtension? other, double t) {
    if (other == null) return this;
    return LaTextFieldThemeExtension(
      _LaTextFieldTheme.lerp(theme, other.theme, t)!,
    );
  }
}
