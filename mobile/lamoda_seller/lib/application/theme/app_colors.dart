import 'package:lamoda_seller/features/presentation/onboarding_page/onboarding_page_theme.dart';
import 'package:lamoda_seller/features/presentation/register_page/register_page_theme.dart';
import 'package:lamoda_seller/features/presentation/welcome_page/welcome_page_theme.dart';
import 'package:lamoda_seller/features/ui_kit/la_blur_container/la_blur_container_theme.dart';
import 'package:lamoda_seller/features/ui_kit/la_button/la_button_theme.dart';

abstract class AppColors implements LaBlurContainerColors, LaButtonColors, WelcomePageColors, OnboardingPageColors, RegisterPageColors {
  const AppColors();
}