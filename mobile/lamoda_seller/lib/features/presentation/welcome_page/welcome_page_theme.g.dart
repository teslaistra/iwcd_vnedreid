// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'welcome_page_theme.dart';

// **************************************************************************
// ThemeExtensionGenerator
// **************************************************************************

final _WelcomePageThemePrivateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `WelcomePageTheme._()`. This constructor is only meant to be used by themeExtended and you are not supposed to need it nor use it.',
);

mixin _$WelcomePageTheme {
  Color get welcomeTextColor =>
      throw _WelcomePageThemePrivateConstructorUsedError;

  WelcomePageTheme copyWith({Color? welcomeTextColor}) =>
      throw _WelcomePageThemePrivateConstructorUsedError;

  WelcomePageTheme copyWithDecoration(WelcomePageThemeDecoration? decoration) =>
      throw _WelcomePageThemePrivateConstructorUsedError;
}

class _WelcomePageTheme implements WelcomePageTheme {
  final Color welcomeTextColor;

  const _WelcomePageTheme({required this.welcomeTextColor});

  _WelcomePageTheme copyWith({Color? welcomeTextColor}) => _WelcomePageTheme(
    welcomeTextColor: welcomeTextColor ?? this.welcomeTextColor,
  );

  _WelcomePageTheme copyWithDecoration(
    WelcomePageThemeDecoration? decoration,
  ) =>
      decoration != null
          ? _WelcomePageTheme(
            welcomeTextColor:
                decoration.welcomeTextColor ?? this.welcomeTextColor,
          )
          : this;

  static WelcomePageTheme? lerp(
    WelcomePageTheme? a,
    WelcomePageTheme? b,
    double t,
  ) {
    if (a == null && b == null) return null;
    if (a == null) return b;
    if (b == null) return a;
    return WelcomePageTheme(
      welcomeTextColor: Color.lerp(a.welcomeTextColor, b.welcomeTextColor, t)!,
    );
  }
}

class WelcomePageThemeDecoration {
  final Color? welcomeTextColor;

  const WelcomePageThemeDecoration({this.welcomeTextColor});
}

extension WelcomePageThemeThemeData on ThemeData {
  WelcomePageTheme get welcomePageThemeExtension =>
      this.extension<WelcomePageThemeExtension>()!.theme;
}

class WelcomePageThemeExtension
    extends ThemeExtension<WelcomePageThemeExtension> {
  final WelcomePageTheme theme;

  const WelcomePageThemeExtension(this.theme);

  @override
  WelcomePageThemeExtension copyWith({WelcomePageTheme? theme}) {
    return WelcomePageThemeExtension(theme ?? this.theme);
  }

  @override
  WelcomePageThemeExtension lerp(WelcomePageThemeExtension? other, double t) {
    if (other == null) return this;
    return WelcomePageThemeExtension(
      _WelcomePageTheme.lerp(theme, other.theme, t)!,
    );
  }
}
