import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lamoda_seller/application/application_store/application_store.dart';
import 'package:lamoda_seller/application/router/app_router.dart';
import 'package:lamoda_seller/features/presentation/home_page/widgets/akcia_alert.dart';
import 'package:lamoda_seller/features/presentation/home_page/widgets/brand_card.dart';
import 'package:lamoda_seller/features/presentation/home_page/widgets/item_card.dart';
import 'package:lamoda_seller/features/presentation/home_page/widgets/moderation_alert.dart';
import 'package:lamoda_seller/features/ui_kit/la_blur_container/la_blur_container.dart';
import 'package:lamoda_seller/features/ui_kit/la_button/la_button.dart';
import 'package:lamoda_seller/features/ui_kit/la_chip/la_chip.dart';
import 'package:lamoda_seller/features/ui_kit/la_chip_button/la_chip_button.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    final store = context.read<ApplicationStore>();

    return Scaffold(
      backgroundColor: Color(0xFFF2F3F5),
      body: Observer(
        builder:
            (_) => Stack(
              children: [
                SafeArea(
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 12),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: GestureDetector(
                                onTap: () => context.router.push(ProfileRoute()),
                                child:  Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                      height: 32,
                                      width: 32,
                                    ),
                                    SizedBox(width: 12),
                                    Text(
                                      'Тестовая компания',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Spacer(),
                                    Image.asset(
                                      'assets/exit_icon.png',
                                      width: 16,
                                    ),
                                  ],
                                ),
                              )
                            ),
                            SizedBox(height: 24),
                            if (store.homePageModerationAlert)
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: ModerationAlert(
                                  onClose: () {}
                                      // () =>
                                      //     store.homePageModerationAlert = false,
                                ),
                              ),
                            if (store.homePageModerationAlert)
                              SizedBox(height: 20),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  Text(
                                    'Ваш кабинет',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Spacer(),
                                  Image.asset(
                                    'assets/search_icon.png',
                                    height: 24,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            if (store.homePageAkciaAlert)
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: GestureDetector(
                                  onTap: () => context.router.push(AkciaListRoute()),
                                  child: AkciaAlert(),
                                ),
                              ),
                            if (store.homePageAkciaAlert)
                              SizedBox(height: 20),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: SizedBox(
                                width: double.infinity,
                                child: CupertinoSlidingSegmentedControl<int>(
                                  backgroundColor: Color(0xFFE7E8E9),
                                  thumbColor: Colors.white,
                                  onValueChanged: (int? value) {setState(() {
                                    currentPage = value ?? currentPage;
                                  });},
                                  groupValue: currentPage,
                                  children: <int, Widget>{
                                    0: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                      child: Text(
                                        'Бренды',
                                        style: currentPage == 0 ? TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ) : TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        )
                                      ),
                                    ),
                                    1: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                      child: Text(
                                        'Товары',
                                        style: currentPage == 1 ? TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ) : TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        )
                                      ),
                                    ),
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            SizedBox(
                              height: 32,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.only(left: 16),
                                children: [
                                  LaChipButton(child: Text('Бренд')),
                                  SizedBox(width: 12),
                                  LaChipButton(child: Text('Статус')),
                                  SizedBox(width: 12),
                                  LaChipButton(child: Text('Категория')),
                                  SizedBox(width: 12),
                                  LaChipButton(child: Text('Качество')),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      switch (currentPage) {
                      0 => switch (store.homePageHasBrands) {
                        true => SliverList(
                          delegate: SliverChildListDelegate([
                            SizedBox(height: 24),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: GestureDetector(
                                onTap: () => context.router.push(BrandRoute()),
                                child: BrandCard(
                                  title: 'Бренд 2345',
                                  count: 1000,
                                  image: Image.asset(
                                    'assets/home_asset_1.png',
                                    height: 90,
                                  ),
                                  badge: LaChip(child: Text('На модерации')),
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: GestureDetector(
                                  onTap: () => context.router.push(BrandRoute()),
                                child: BrandCard(
                                  title: 'Бренд 2345',
                                  count: 1000,
                                  image: Image.asset(
                                    'assets/home_asset_2.png',
                                    height: 90,
                                  ),
                                  badge: LaChip(child: Text('На модерации')),
                                ),
                              )
                            ),
                            SizedBox(height: 16),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: GestureDetector(
                                onTap: () => context.router.push(BrandRoute()),
                                child: BrandCard(
                                  title: 'Бренд 2345',
                                  count: 1000,
                                  image: Image.asset(
                                    'assets/home_asset_3.png',
                                    height: 90,
                                  ),
                                  badge: LaChip(child: Text('На модерации')),
                                ),
                              )
                            ),
                            SizedBox(height: 16),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: GestureDetector(
                                  onTap: () => context.router.push(BrandRoute()),
                                child:  BrandCard(
                                  title: 'Бренд 2345',
                                  count: 1000,
                                  image: Image.asset(
                                    'assets/home_asset_4.png',
                                    height: 90,
                                  ),
                                  badge: LaChip(child: Text('На модерации')),
                                ),
                              )
                            ),
                            SizedBox(height: 100),
                          ]),
                        ),
                        false => SliverFillRemaining(
                          hasScrollBody: false,
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/home_empty.png',
                                    height: 140,
                                  ),
                                  SizedBox(height: 34),
                                  Text(
                                    'Добавьте свой бренд',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 27,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    'Чтобы начать продажи, загрузите основную информацию о бренде и его товарах',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xA3333333),
                                    ),
                                  ),
                                  SizedBox(height: 60),
                                ],
                              ),
                            ),
                          ),
                        ),
                      },
                      1 => switch (store.homePageHasItems) {
                        true => SliverPadding(
                          padding: EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 100),
                          sliver: SliverGrid(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 4/5, crossAxisSpacing: 16, mainAxisSpacing: 16),
                            delegate: SliverChildListDelegate([
                              GestureDetector(
                                onTap: () => context.router.push(ItemRoute()),
                                child:  ItemCard(
                                  title: 'Брюки',
                                  count: 1000,
                                  image: Image.asset(
                                    'assets/home_asset_1.png',
                                    height: 90,
                                  ),
                                  badge: LaChip(child: Text('На модерации')),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => context.router.push(ItemRoute()),
                                child: ItemCard(
                                  title: 'Кеды',
                                  count: 1000,
                                  image: Image.asset(
                                    'assets/home_asset_2.png',
                                    height: 90,
                                  ),
                                  badge: LaChip(child: Text('На модерации')),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => context.router.push(ItemRoute()),
                                child: ItemCard(
                                  title: 'Спортивные',
                                  count: 1000,
                                  image: Image.asset(
                                    'assets/home_asset_3.png',
                                    height: 90,
                                  ),
                                  badge: LaChip(child: Text('На модерации')),
                                ),
                              ),
                              GestureDetector(
                                  onTap: () => context.router.push(ItemRoute()),
                                child: ItemCard(
                                  title: 'Женские',
                                  count: 1000,
                                  image: Image.asset(
                                    'assets/home_asset_4.png',
                                    height: 90,
                                  ),
                                  badge: LaChip(child: Text('На модерации')),
                                ),
                              )
                            ]),
                          ),
                        ),
                        false => SliverFillRemaining(
                          hasScrollBody: false,
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/home_empty.png',
                                    height: 140,
                                  ),
                                  SizedBox(height: 34),
                                  Text(
                                    'Добавьте свой товар',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 27,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    'Чтобы начать продажи, загрузите основную информацию о товаре',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xA3333333),
                                    ),
                                  ),
                                  SizedBox(height: 60),
                                ],
                              ),
                            ),
                          ),
                        ),
                      },
                      _ => throw UnimplementedError()
                      }
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: LaBlurContainer(
                    child: SafeArea(
                      top: false,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: LaButton(
                          onTap: () => currentPage == 0 ? context.router.push(AddBrandRoute()) : context.router.push(AddItemRoute()),
                          child: currentPage == 0 ? Text('Добавить бренд') : Text('Добавить товар'),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
      ),
    );
  }
}
