import 'package:flutter/material.dart';
import 'package:lamoda_seller/application/theme/la_classic/la_classic_colors.dart';
import 'package:lamoda_seller/features/presentation/onboarding_page/onboarding_page_theme.dart';
import 'package:lamoda_seller/features/presentation/register_page/register_page_theme.dart';
import 'package:lamoda_seller/features/presentation/welcome_page/welcome_page_theme.dart';
import 'package:lamoda_seller/features/ui_kit/la_blur_container/la_blur_container_theme.dart';
import 'package:lamoda_seller/features/ui_kit/la_button/la_button_theme.dart';

class LaClassicTheme {
  ThemeData get theme => ThemeData(
    scaffoldBackgroundColor: Colors.white, // TODO: поменять
    extensions: [
      LaBlurContainerThemeExtension(
        LaBlurContainerTheme(
            blurStrength: 4,
            blurColor: LaClassicColors().laBlurContainerBlur,
        )
      ),
      LaButtonThemeExtension(
          LaButtonTheme(
            borderRadius: 16.0,
            primaryStateColor: LaClassicColors().laButtonPrimaryState,
            primaryStateTextColor: LaClassicColors().laButtonPrimaryStateText,
            secondaryStateColor: LaClassicColors().laButtonSecondaryState,
            secondaryStateTextColor: LaClassicColors().laButtonSecondaryStateText,
          )
      ),

      WelcomePageThemeExtension(
        WelcomePageTheme(
          welcomeTextColor: LaClassicColors().welcomeText
        )
      ),
      OnboardingPageThemeExtension(
        OnboardingPageTheme(
          pageIndicatorEnabledColor: LaClassicColors().pageIndicatorEnabled,
          pageIndicatorDisabledColor: LaClassicColors().pageIndicatorDisabled,
          pageIndicatorTextColor: LaClassicColors().pageIndicatorText
        )
      ),
      RegisterPageThemeExtension(
        RegisterPageTheme(
            pageIndicatorEnabledColor: LaClassicColors().pageIndicatorEnabled,
            pageIndicatorDisabledColor: LaClassicColors().pageIndicatorDisabled,
            pageIndicatorTextColor: LaClassicColors().pageIndicatorText
        )
      )
    ]
  );
}