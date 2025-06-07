import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lamoda_seller/application/router/app_router.dart';
import 'package:lamoda_seller/features/ui_kit/la_blur_container/la_blur_container.dart';
import 'package:lamoda_seller/features/ui_kit/la_button/la_button.dart';
import 'package:lamoda_seller/features/ui_kit/la_page_indicator/la_page_indicator.dart';
import 'package:lamoda_seller/features/ui_kit/layouts/la_subpage_layout/la_subpage_layout.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  bool get isEnd => _currentPage + 1 == cards.length;

  // Тестовые данные для карточек
  final List<Widget> cards = [
    LaSubpageLayout(
      contentPadding: EdgeInsets.all(24),
      title: const Text('Lamoda '),
      titleChips: const [Text('Seller', style: TextStyle(color: Color(0xFFA5D40A)))],
      text: const Text(
        'Дата до которой клиент обещает оплатить + сумма оплаты (сумме просроченной задолженности + 5 дней с учетом штрафо и неустоек и процентов) автоматически должна подставляться',
      ),
      image: Align(
        alignment: Alignment.bottomRight,
        child: Image.asset('assets/onboarding_1.png'),
      ),
    ),
    LaSubpageLayout(
      contentPadding: EdgeInsets.all(24),
      title: const Text('Почему '),
      titleChips: const [
        Text('мы', style: TextStyle(color: Color(0xFFF619B8))),
        Text('?'),
      ],
      text: const Text(
        'Дата до которой клиент обещает оплатить + сумма оплаты (сумме просроченной задолженности + 5 дней с учетом штрафо и неустоек и процентов) автоматически должна подставляться',
      ),
      image: Align(
        alignment: Alignment.bottomRight,
        child: Image.asset('assets/onboarding_2.png'),
      ),
    ),
    LaSubpageLayout(
      contentPadding: EdgeInsets.all(24),
      title: const Text('Что '),
      titleChips: const [
        Text('подготовить', style: TextStyle(color: Color(0xFFF93B00))),
        Text('?'),
      ],
      text: const Text('Отслеживайте статистику и оптимизируйте ваш бизнес'),
      image: Align(
        alignment: Alignment.bottomRight,
        child: Image.asset('assets/onboarding_3.png'),
      ),
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20),
                LaPageIndicator(currentValue: _currentPage, size: cards.length),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() => _currentPage = index);
                    },
                    itemCount: cards.length,
                    itemBuilder: (context, index) {
                      return cards[index];
                    },
                  ),
                ),
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
                        onTap:
                            isEnd
                                ? () => context.router.replace(RegisterRoute())
                                : _nextPage,
                        child: Text(isEnd ? 'Начать регистрацию' : 'Далее'),
                      ),
                      LaButton(
                        onTap: _previousPage,
                        child: Text('Назад'),
                        primary: false,
                      ),
                    ],
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
