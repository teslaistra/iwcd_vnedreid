import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:lamoda_seller/features/presentation/profile_common_page/profile_common_screen.dart';
import 'package:lamoda_seller/features/presentation/profile_page/profile_screen.dart';

@RoutePage()
class ProfileCommonPage extends StatelessWidget {
  const ProfileCommonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProfileCommonScreen();
  }
}
