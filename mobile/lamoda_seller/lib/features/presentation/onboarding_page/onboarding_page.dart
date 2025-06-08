import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:lamoda_seller/features/presentation/onboarding_page/onboarding_screen.dart';

@RoutePage()
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingScreen();
  }
}
