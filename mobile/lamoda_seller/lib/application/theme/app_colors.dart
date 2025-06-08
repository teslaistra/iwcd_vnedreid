import 'package:lamoda_seller/features/presentation/welcome_page/welcome_page_theme.dart';
import 'package:lamoda_seller/features/ui_kit/la_blur_container/la_blur_container_theme.dart';
import 'package:lamoda_seller/features/ui_kit/la_button/la_button_theme.dart';
import 'package:lamoda_seller/features/ui_kit/la_chip/la_chip_theme.dart';
import 'package:lamoda_seller/features/ui_kit/la_chip_button/la_chip_button.dart';
import 'package:lamoda_seller/features/ui_kit/la_chip_button/la_chip_button_theme.dart';
import 'package:lamoda_seller/features/ui_kit/la_page_indicator/la_page_indicator_theme.dart';
import 'package:lamoda_seller/features/ui_kit/la_text_field/la_text_field_theme.dart';

abstract class AppColors implements LaBlurContainerColors, LaButtonColors, LaPageIndicatorColors, LaTextFieldColors, LaChipColors, LaChipButtonColors, WelcomePageColors {
  const AppColors();
}