import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lamoda_seller/application/router/app_router.dart';
import 'package:lamoda_seller/features/ui_kit/la_blur_container/la_blur_container.dart';
import 'package:lamoda_seller/features/ui_kit/la_button/la_button.dart';
import 'package:lamoda_seller/features/ui_kit/la_page_indicator/la_page_indicator.dart';
import 'package:lamoda_seller/features/ui_kit/la_text_field/la_text_field.dart';
import 'package:lamoda_seller/features/ui_kit/layouts/la_subpage_layout/la_subpage_layout.dart';

class AddBrandScreen extends StatefulWidget {
  const AddBrandScreen({super.key});

  @override
  State<AddBrandScreen> createState() => _AddBrandScreenState();
}

class _AddBrandScreenState extends State<AddBrandScreen> {
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
    cards = [
      LaSubpageLayout(
        title: const Text('Информация о '),
        titleChips: const [Text('бренде', style: TextStyle(color: Color(0xA3333333)))],
        text: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 14,),
            Text(
              'Введите основные данные',
            ),
            SizedBox(height: 24,),
            LaTextField(
              hintText: 'Введите наименование бренда',
            ),
            SizedBox(height: 16,),
            LaTextField(
              hintText: 'Введите категории товара',
            ),
            SizedBox(height: 16,),
            LaTextField(
              hintText: 'Введите охранный документ',
            )
          ],
        ),
      ),
      LaSubpageLayout(
        title: const Text('Информация о '),
        titleChips: const [Text('бренде', style: TextStyle(color: Color(0xA3333333)))],
        text: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 14,),
            Text(
              'Введите основные данные',
            ),
            SizedBox(height: 24,),
            LaTextField(
              hintText: 'Ссылка на сайт / каталог',
            ),
            SizedBox(height: 16,),
            LaTextField(
              hintText: 'Количество артикулов',
            ),
            SizedBox(height: 16,),
            LaTextField(
              hintText: 'Средняя цена единицы товара',
            )
          ],
        ),
      ),
      LaSubpageLayout(
        title: const Text('Информация о '),
        titleChips: const [Text('бренде', style: TextStyle(color: Color(0xA3333333)))],
        text: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 14,),
            Text(
              'Введите основные данные',
            ),
            SizedBox(height: 24,),
            LaTextField(
              hintText: 'Страна происхождения бренда',
            ),
            SizedBox(height: 16,),
            LaTextField(
              hintText: 'Местонахождение склада',
            ),
            SizedBox(height: 16,),
            LaTextField(
              hintText: 'Ссылка на социальные сети',
            )
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
                          onTap: isEnd ? () => context.router.replace(SuccessSentRoute()) : _nextPage ,
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