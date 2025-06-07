import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lamoda_seller/application/application_store/application_store.dart';
import 'package:lamoda_seller/application/router/app_router.dart';
import 'package:lamoda_seller/features/presentation/welcome_page/welcome_page_theme.dart';
import 'package:lamoda_seller/features/ui_kit/la_blur_container/la_blur_container.dart';
import 'package:lamoda_seller/features/ui_kit/la_button/la_button.dart';
import 'package:provider/provider.dart';

class SuccessSentScreen extends StatelessWidget {
  const SuccessSentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).welcomePageThemeExtension;
    final store = context.read<ApplicationStore>();

    return Scaffold(
      backgroundColor: Color(0xFFF2F3F5),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/success_sent_image.png', width: 200),
                  SizedBox(height: 48),
                  Text(
                    'Ваша заявка находится на модерации!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF333333),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Вы можете отследить ее статус в личном кабинете, если у нас появятся какие-то вопросы, мы зададим их вам в чате',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Color(0xA3333333),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: LaBlurContainer(
              child: SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child:  LaButton(
                    onTap: () {
                      context.router.popUntilRouteWithName(HomeRoute.name);
                      store.homePageHasBrands = true;
                    },
                    child: Text('На главную'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
