// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'la_chip_theme.dart';

// **************************************************************************
// ThemeExtensionGenerator
// **************************************************************************

final _LaChipThemePrivateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `LaChipTheme._()`. This constructor is only meant to be used by themeExtended and you are not supposed to need it nor use it.',
);

mixin _$LaChipTheme {
  Color get color => throw _LaChipThemePrivateConstructorUsedError;
  Color get textColor => throw _LaChipThemePrivateConstructorUsedError;

  LaChipTheme copyWith({Color? color, Color? textColor}) =>
      throw _LaChipThemePrivateConstructorUsedError;

  LaChipTheme copyWithDecoration(LaChipThemeDecoration? decoration) =>
      throw _LaChipThemePrivateConstructorUsedError;
}

class _LaChipTheme implements LaChipTheme {
  final Color color;
  final Color textColor;

  const _LaChipTheme({required this.color, required this.textColor});

  _LaChipTheme copyWith({Color? color, Color? textColor}) => _LaChipTheme(
    color: color ?? this.color,
    textColor: textColor ?? this.textColor,
  );

  _LaChipTheme copyWithDecoration(LaChipThemeDecoration? decoration) =>
      decoration != null
          ? _LaChipTheme(
            color: decoration.color ?? this.color,
            textColor: decoration.textColor ?? this.textColor,
          )
          : this;

  static LaChipTheme? lerp(LaChipTheme? a, LaChipTheme? b, double t) {
    if (a == null && b == null) return null;
    if (a == null) return b;
    if (b == null) return a;
    return LaChipTheme(
      color: Color.lerp(a.color, b.color, t)!,
      textColor: Color.lerp(a.textColor, b.textColor, t)!,
    );
  }
}

class LaChipThemeDecoration {
  final Color? color;
  final Color? textColor;

  const LaChipThemeDecoration({this.color, this.textColor});
}

extension LaChipThemeThemeData on ThemeData {
  LaChipTheme get laChipThemeExtension =>
      this.extension<LaChipThemeExtension>()!.theme;
}

class LaChipThemeExtension extends ThemeExtension<LaChipThemeExtension> {
  final LaChipTheme theme;

  const LaChipThemeExtension(this.theme);

  @override
  LaChipThemeExtension copyWith({LaChipTheme? theme}) {
    return LaChipThemeExtension(theme ?? this.theme);
  }

  @override
  LaChipThemeExtension lerp(LaChipThemeExtension? other, double t) {
    if (other == null) return this;
    return LaChipThemeExtension(_LaChipTheme.lerp(theme, other.theme, t)!);
  }
}
