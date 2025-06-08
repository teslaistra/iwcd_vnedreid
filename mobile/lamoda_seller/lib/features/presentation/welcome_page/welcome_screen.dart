import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lamoda_seller/application/router/app_router.dart';
import 'package:lamoda_seller/features/presentation/welcome_page/welcome_page_theme.dart';
import 'package:lamoda_seller/features/ui_kit/la_button/la_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).welcomePageThemeExtension;

    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 38),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/welcome.png', width: 300),
                  SizedBox(height: 48),
                  Image.asset('assets/icon.png', width: 228),
                  SizedBox(height: 16),
                  Text(
                    'Добро пожаловать!',
                    style: TextStyle(
                      fontSize: 24,
                      color: theme.welcomeTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              top: false,
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: LaButton(
                  onTap: () => context.router.replace(OnboardingRoute()),
                    child: Text('Погнали!')
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
