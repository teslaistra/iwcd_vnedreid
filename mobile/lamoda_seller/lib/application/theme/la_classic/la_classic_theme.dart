import 'package:flutter/material.dart';
import 'package:lamoda_seller/application/theme/la_classic/la_classic_colors.dart';
import 'package:lamoda_seller/features/presentation/welcome_page/welcome_page_theme.dart';
import 'package:lamoda_seller/features/ui_kit/la_blur_container/la_blur_container_theme.dart';
import 'package:lamoda_seller/features/ui_kit/la_button/la_button_theme.dart';
import 'package:lamoda_seller/features/ui_kit/la_page_indicator/la_page_indicator_theme.dart';
import 'package:lamoda_seller/features/ui_kit/la_text_field/la_text_field_theme.dart';

class LaClassicTheme {
  ThemeData get theme => ThemeData(
    scaffoldBackgroundColor: Colors.white, // TODO: поменять
    extensions: [
      LaBlurContainerThemeExtension(
        LaBlurContainerTheme(
            blurStrength: 8,
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
      LaPageIndicatorThemeExtension(
        LaPageIndicatorTheme(
          enabledColor: LaClassicColors().laPageIndicatorEnabled,
          disabledColor: LaClassicColors().laPageIndicatorDisabled,
          textColor: LaClassicColors().laPageIndicatorText
        )
      ),

      LaTextFieldThemeExtension(
        LaTextFieldTheme(
          backgroundColor: LaClassicColors().laTextFieldBackground,
          borderColor: LaClassicColors().laTextFieldBorder,
          disabledBackgroundColor: LaClassicColors().laTextFieldDisabledBackground,
          disabledBorderColor: LaClassicColors().laTextFieldDisabledBorder,
          hintColor: LaClassicColors().laTextFieldHint,
          textColor: LaClassicColors().laTextFieldText
        )
      )
    ]
  );
}