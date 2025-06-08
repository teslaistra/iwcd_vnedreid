// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'la_blur_container_theme.dart';

// **************************************************************************
// ThemeExtensionGenerator
// **************************************************************************

final _LaBlurContainerThemePrivateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `LaBlurContainerTheme._()`. This constructor is only meant to be used by themeExtended and you are not supposed to need it nor use it.',
);

mixin _$LaBlurContainerTheme {
  double get blurStrength =>
      throw _LaBlurContainerThemePrivateConstructorUsedError;
  Color get blurColor => throw _LaBlurContainerThemePrivateConstructorUsedError;

  LaBlurContainerTheme copyWith({double? blurStrength, Color? blurColor}) =>
      throw _LaBlurContainerThemePrivateConstructorUsedError;

  LaBlurContainerTheme copyWithDecoration(
    LaBlurContainerThemeDecoration? decoration,
  ) => throw _LaBlurContainerThemePrivateConstructorUsedError;
}

class _LaBlurContainerTheme implements LaBlurContainerTheme {
  final double blurStrength;
  final Color blurColor;

  const _LaBlurContainerTheme({
    required this.blurStrength,
    required this.blurColor,
  });

  _LaBlurContainerTheme copyWith({double? blurStrength, Color? blurColor}) =>
      _LaBlurContainerTheme(
        blurStrength: blurStrength ?? this.blurStrength,
        blurColor: blurColor ?? this.blurColor,
      );

  _LaBlurContainerTheme copyWithDecoration(
    LaBlurContainerThemeDecoration? decoration,
  ) =>
      decoration != null
          ? _LaBlurContainerTheme(
            blurStrength: decoration.blurStrength ?? this.blurStrength,
            blurColor: decoration.blurColor ?? this.blurColor,
          )
          : this;

  static LaBlurContainerTheme? lerp(
    LaBlurContainerTheme? a,
    LaBlurContainerTheme? b,
    double t,
  ) {
    if (a == null && b == null) return null;
    if (a == null) return b;
    if (b == null) return a;
    return LaBlurContainerTheme(
      blurStrength: Tween<double>(
        begin: a.blurStrength,
        end: b.blurStrength,
      ).transform(t),
      blurColor: Color.lerp(a.blurColor, b.blurColor, t)!,
    );
  }
}

class LaBlurContainerThemeDecoration {
  final double? blurStrength;
  final Color? blurColor;

  const LaBlurContainerThemeDecoration({this.blurStrength, this.blurColor});
}

extension LaBlurContainerThemeThemeData on ThemeData {
  LaBlurContainerTheme get laBlurContainerThemeExtension =>
      this.extension<LaBlurContainerThemeExtension>()!.theme;
}

class LaBlurContainerThemeExtension
    extends ThemeExtension<LaBlurContainerThemeExtension> {
  final LaBlurContainerTheme theme;

  const LaBlurContainerThemeExtension(this.theme);

  @override
  LaBlurContainerThemeExtension copyWith({LaBlurContainerTheme? theme}) {
    return LaBlurContainerThemeExtension(theme ?? this.theme);
  }

  @override
  LaBlurContainerThemeExtension lerp(
    LaBlurContainerThemeExtension? other,
    double t,
  ) {
    if (other == null) return this;
    return LaBlurContainerThemeExtension(
      _LaBlurContainerTheme.lerp(theme, other.theme, t)!,
    );
  }
}
