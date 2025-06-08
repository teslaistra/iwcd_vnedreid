import 'package:auto_route/auto_route.dart';
import 'package:lamoda_seller/features/presentation/add_brand_page/add_brand_page.dart';
import 'package:lamoda_seller/features/presentation/add_item_page/add_item_page.dart';
import 'package:lamoda_seller/features/presentation/akcia_list_page/akcia_list_page.dart';
import 'package:lamoda_seller/features/presentation/akcia_page/akcia_page.dart';
import 'package:lamoda_seller/features/presentation/akcia_picker_page/akcia_picker_page.dart';
import 'package:lamoda_seller/features/presentation/brand_page/brand_page.dart';
import 'package:lamoda_seller/features/presentation/chat_page/chat_page.dart';
import 'package:lamoda_seller/features/presentation/home_page/home_page.dart';
import 'package:lamoda_seller/features/presentation/item_page/item_page.dart';
import 'package:lamoda_seller/features/presentation/notifications_page/notifications_page.dart';
import 'package:lamoda_seller/features/presentation/onboarding_page/onboarding_page.dart';
import 'package:lamoda_seller/features/presentation/profile_common_page/profile_common_page.dart';
import 'package:lamoda_seller/features/presentation/profile_page/profile_page.dart';
import 'package:lamoda_seller/features/presentation/register_page/register_page.dart';
import 'package:lamoda_seller/features/presentation/success_sent_page/success_sent_page.dart';
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
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: AddBrandRoute.page),
    AutoRoute(page: SuccessSentRoute.page),
    AutoRoute(page: AddItemRoute.page),
    AutoRoute(page: ItemRoute.page),
    AutoRoute(page: BrandRoute.page),
    AutoRoute(page: AkciaListRoute.page),
    AutoRoute(page: AkciaRoute.page),
    AutoRoute(page: AkciaPickerRoute.page),
    AutoRoute(page: ProfileRoute.page),
    AutoRoute(page: ProfileCommonRoute.page),
    AutoRoute(page: NotificationsRoute.page),
    AutoRoute(page: ChatRoute.page),
  ];
}
