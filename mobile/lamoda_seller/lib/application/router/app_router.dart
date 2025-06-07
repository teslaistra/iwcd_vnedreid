import 'package:auto_route/auto_route.dart';
import 'package:lamoda_seller/features/presentation/onboarding_page/onboarding_page.dart';
import 'package:lamoda_seller/features/presentation/register_page/register_page.dart';
import 'package:lamoda_seller/features/presentation/welcome_page/welcome_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: WelcomeRoute.page, initial: true),
    AutoRoute(page: OnboardingRoute.page),
    AutoRoute(page: RegisterRoute.page),
  ];
}
