import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lamoda_seller/application/application_store/application_store.dart';
import 'package:lamoda_seller/application/router/app_router.dart';
import 'package:lamoda_seller/features/presentation/home_page/widgets/brand_card.dart';
import 'package:lamoda_seller/features/ui_kit/la_blur_container/la_blur_container.dart';
import 'package:lamoda_seller/features/ui_kit/la_button/la_button.dart';
import 'package:lamoda_seller/features/ui_kit/la_chip/la_chip.dart';
import 'package:lamoda_seller/features/ui_kit/la_chip_button/la_chip_button.dart';
import 'package:lamoda_seller/features/ui_kit/la_page_indicator/la_page_indicator.dart';
import 'package:lamoda_seller/features/ui_kit/la_text_field/la_text_field.dart';
import 'package:lamoda_seller/features/ui_kit/layouts/la_subpage_layout/la_subpage_layout.dart';
import 'package:provider/provider.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
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
        title: const Text('Выберите бренд'),
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
                switch (store.homePageHasBrands) {
                  true => SliverList(
                    delegate: SliverChildListDelegate([
                      SizedBox(height: 24),
                      BrandCard(
                        title: 'Бренд 2345',
                        count: 1000,
                        image: Image.asset(
                          'assets/home_asset_1.png',
                          height: 90,
                        ),
                        badge: LaChip(child: Text('На модерации')),
                      ),
                      SizedBox(height: 16),
                      BrandCard(
                        title: 'Бренд 2345',
                        count: 1000,
                        image: Image.asset(
                          'assets/home_asset_2.png',
                          height: 90,
                        ),
                        badge: LaChip(child: Text('На модерации')),
                      ),
                      SizedBox(height: 16),
                      BrandCard(
                        title: 'Бренд 2345',
                        count: 1000,
                        image: Image.asset(
                          'assets/home_asset_3.png',
                          height: 90,
                        ),
                        badge: LaChip(child: Text('На модерации')),
                      ),
                      SizedBox(height: 16),
                      BrandCard(
                        title: 'Бренд 2345',
                        count: 1000,
                        image: Image.asset(
                          'assets/home_asset_4.png',
                          height: 90,
                        ),
                        badge: LaChip(child: Text('На модерации')),
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
                }
              ]
          ),
        )
      ),
      LaSubpageLayout(
        title: const Text('Информация о '),
        titleChips: const [Text('товаре', style: TextStyle(color: Color(0xA3333333)))],
        text: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 14,),
            Text(
              'Введите основные данные',
            ),
            SizedBox(height: 24,),
            LaTextField(
              hintText: 'Введите наименование товара',
            ),
            SizedBox(height: 16,),
            LaTextField(
              hintText: 'Введите артикул товара',
            ),
            SizedBox(height: 16,),
            LaTextField(
              hintText: 'Введите размер / сетку',
            ),
            SizedBox(height: 16,),
            LaTextField(
              hintText: 'Введите розничную цену',
            )
          ],
        ),
      ),
      LaSubpageLayout(
        title: const Text('Информация о '),
        titleChips: const [Text('товаре', style: TextStyle(color: Color(0xA3333333)))],
        text: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 14,),
            Text(
              'Введите основные данные',
            ),
            SizedBox(height: 24,),
            LaTextField(
              hintText: 'Введите цвет',
            ),
            SizedBox(height: 16,),
            LaTextField(
              hintText: 'Загрузите фотографии',
            ),
          ],
        ),
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
                      Text('Добавить бренд', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Color(0xFF333333)),),
                      Icon(Icons.info_outline, size: 24, color: Color(0xFF333333),)
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                LaPageIndicator(currentValue: _currentPage, size: cards.length),
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
                            store.homePageHasItems = true;
                          } : _nextPage ,
                          child: isEnd ? Text( 'Отправить') : Text( 'Далее'),
                        ),
                        if (!isStart) LaButton(
                          onTap: _previousPage,
                          child: Text('Назад'),
                          primary: false,
                        )
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