import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lamoda_seller/application/application_store/application_store.dart';
import 'package:lamoda_seller/application/router/app_router.dart';
import 'package:lamoda_seller/features/presentation/home_page/widgets/brand_card.dart';
import 'package:lamoda_seller/features/presentation/home_page/widgets/item_card.dart';
import 'package:lamoda_seller/features/ui_kit/la_blur_container/la_blur_container.dart';
import 'package:lamoda_seller/features/ui_kit/la_button/la_button.dart';
import 'package:lamoda_seller/features/ui_kit/la_chip/la_chip.dart';
import 'package:lamoda_seller/features/ui_kit/la_chip_button/la_chip_button.dart';
import 'package:lamoda_seller/features/ui_kit/la_page_indicator/la_page_indicator.dart';
import 'package:lamoda_seller/features/ui_kit/la_text_field/la_text_field.dart';
import 'package:lamoda_seller/features/ui_kit/layouts/la_subpage_layout/la_subpage_layout.dart';
import 'package:provider/provider.dart';

class AkciaPickerScreen extends StatefulWidget {
  const AkciaPickerScreen({super.key});

  @override
  State<AkciaPickerScreen> createState() => _AkciaPickerScreenState();
}

class _AkciaPickerScreenState extends State<AkciaPickerScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  bool get isStart => _currentPage == 0;
  bool get isEnd => _currentPage+1 == cards.length;

  // Тестовые данные для карточек
  List<Widget> cards = [];

  void _nextPage() {
    if (_currentPage < cards.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final store = context.read<ApplicationStore>();

    cards = [
      LaSubpageLayout(
          title: const Text('Выберите товары'),
          text: Expanded(
            child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 32,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
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
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(height: 24,),
                  ),
                  switch (store.homePageHasItems) {
                    true => SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 4/5, crossAxisSpacing: 16, mainAxisSpacing: 16),
                      delegate: SliverChildListDelegate([
                        ItemCard(
                          title: 'Брюки',
                          count: 1000,
                          image: Image.asset(
                            'assets/home_asset_1.png',
                            height: 90,
                          ),
                          badge: LaChip(child: Text('На модерации')),
                          enableTouch: true,
                        ),
                        ItemCard(
                          title: 'Кеды',
                          count: 1000,
                          image: Image.asset(
                            'assets/home_asset_2.png',
                            height: 90,
                          ),
                          badge: LaChip(child: Text('На модерации')),
                          enableTouch: true,
                        ),
                        ItemCard(
                          title: 'Спортивные',
                          count: 1000,
                          image: Image.asset(
                            'assets/home_asset_3.png',
                            height: 90,
                          ),
                          badge: LaChip(child: Text('На модерации')),
                          enableTouch: true,
                        ),
                        ItemCard(
                          title: 'Женские',
                          count: 1000,
                          image: Image.asset(
                            'assets/home_asset_4.png',
                            height: 90,
                          ),
                          enableTouch: true,
                          badge: LaChip(child: Text('На модерации')),
                        ),
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
                ]
            ),
          )
      ),
    ];

    return Scaffold(
      backgroundColor: Color(0xFFF2F3F5),
      body: Stack(
        children: [
          SafeArea(
            bottom: false,
            child:   Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => context.router.pop(),
                        child: Icon(Icons.arrow_back_ios, size: 24, color: Color(0xFF333333),),
                      ),
                      Text('Добавить товар', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Color(0xFF333333)),),
                      Icon(Icons.info_outline, size: 24, color: Color(0xFF333333),)
                    ],
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() => _currentPage = index);
                    },
                    itemCount: cards.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(20),
                        child: cards[index],
                      );
                    },
                  ),
                )
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
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 16,
                      children: [
                        LaButton(
                          onTap: isEnd ? () {
                            context.router.replace(SuccessSentRoute());
                          } : _nextPage ,
                          child: isEnd ? Text( 'Добавить в акцию') : Text( 'Далее'),
                        ),
                      ],
                    ),
                  ),
                )
            ),
          )
        ],
      ),
    );
  }
}