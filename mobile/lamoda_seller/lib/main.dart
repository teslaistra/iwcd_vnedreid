import 'package:auto_route/auto_route.dart';
import 'package:lamoda_seller/application/application_store/application_store.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:lamoda_seller/application/theme/la_classic/la_classic_theme.dart';

import 'application/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  RouterConfig<UrlState> router = AppRouter().config();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (BuildContext context) => ApplicationStore(),
      child: MaterialApp.router(
        title: 'Flutter Demo',
        routerConfig: router,
        theme: LaClassicTheme().theme,
      )
    );
  }
}