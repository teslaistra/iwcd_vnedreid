import 'package:flutter/material.dart';
import 'package:lamoda_seller/application/theme/la_classic/la_classic_theme.dart';

import 'application/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: AppRouter().config(),
      theme: LaClassicTheme().theme,
    );
  }
}