import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/material.dart';
import 'package:lamoda_seller/application/application_store/application_store.dart';
import 'package:lamoda_seller/application/router/app_router.dart';
import 'package:lamoda_seller/application/theme/la_classic/la_classic_theme.dart';
import 'package:provider/provider.dart';
class DemoEntrypoint extends StatefulWidget {
  const DemoEntrypoint({super.key});

  @override
  State<DemoEntrypoint> createState() => _DemoEntrypointState();
}

class _DemoEntrypointState extends State<DemoEntrypoint> {
  RouterConfig<UrlState> router = AppRouter().config();

  @override
  Widget build(BuildContext context) {
    final bool needPreview = MediaQuery.of(context).size.width >= MediaQuery.of(context).size.height;

    return DevicePreview(
      isToolbarVisible: false,
      enabled: needPreview,
      backgroundColor: Colors.white,
      builder: (_) => Provider(
          create: (BuildContext context) => ApplicationStore(),
          child: MaterialApp.router(
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            title: 'Flutter Demo',
            routerConfig: router,
            debugShowCheckedModeBanner: false,
            scrollBehavior: MyCustomScrollBehavior(),
            theme: LaClassicTheme().theme,
          )
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}