import 'package:flutter/material.dart';
import 'package:lamoda_seller/features/ui_kit/la_blur_container/la_blur_container.dart';
import 'package:lamoda_seller/features/ui_kit/la_button/la_button.dart';
import 'package:lamoda_seller/features/ui_kit/la_page_indicator/la_page_indicator.dart';
import 'package:lamoda_seller/features/ui_kit/la_text_field/la_text_field.dart';
import 'package:lamoda_seller/features/ui_kit/layouts/la_subpage_layout/la_subpage_layout.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  bool get isStart => _currentPage == 0;
  bool get isEnd => _currentPage+1 == cards.length;

  // Тестовые данные для карточек
  final List<Widget> cards = [
    LaSubpageLayout(
      title: const Text('Введите '),
      titleChips: const [Text('ФИО', style: TextStyle(color: Color(0xA3333333)))],
      text: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 14,),
          Text(
            'Введите основные данные',
          ),
          SizedBox(height: 24,),
          LaTextField(
            hintText: 'Введите ФИО',
          ),
          SizedBox(height: 16,),
          LaTextField(
            hintText: 'Введите почту',
          ),
          SizedBox(height: 16,),
          LaTextField(
            hintText: 'Введите пароль',
          )
        ],
      ),
      image: Align(
        alignment: Alignment.bottomCenter,
        child: Image.asset('assets/lamoda_card.png'),
      ),
    ),
    const LaSubpageLayout(
      title: Text('Информация о '),
      titleChips: [
        Text('компании', style: TextStyle(color: Color(0xA3333333))),
      ],
        text: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 14,),
            Text(
              'Введите основные данные',
            ),
            SizedBox(height: 24,),
            LaTextField(
              hintText: 'Выберите форму юр. лица',
            ),
            SizedBox(height: 16,),
            LaTextField(
              hintText: 'Наименование компании',
            ),
            SizedBox(height: 16,),
            LaTextField(
              hintText: 'Модель сотрудничества',
            ),
            SizedBox(height: 16,),
            Text('Нажимая кнопку далее я даю согласие Купишуз на обработку персональных данных: https://www.lamoda.ru/about personaldata/')
          ],
        )
    ),
  ];

  void _nextPage() {
    if (_currentPage < cards.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Завершение онбординга
      Navigator.pushReplacementNamed(context, '/home');
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
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            bottom: false,
            child:   Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20,),
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
                        padding: EdgeInsets.all(24),
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
                          onTap: _nextPage,
                          child: Text( 'Далее'),
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