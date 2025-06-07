import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lamoda_seller/application/router/app_router.dart';
import 'package:lamoda_seller/features/presentation/onboarding_page/onboarding_page_theme.dart';
import 'package:lamoda_seller/features/presentation/onboarding_page/widgets/onboarding_card.dart';
import 'package:lamoda_seller/features/ui_kit/la_blur_container/la_blur_container.dart';
import 'package:lamoda_seller/features/ui_kit/la_button/la_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  bool get isEnd => _currentPage+1 == cards.length;

  // Тестовые данные для карточек
  final List<OnboardingCard> cards = [
    const OnboardingCard(
      imageUrl: 'assets/onboarding1.png',
      title: 'Добро пожаловать!',
      text: 'Познакомьтесь с возможностями нашего приложения для продавцов',
    ),
    const OnboardingCard(
      imageUrl: 'assets/onboarding2.png',
      title: 'Управление товарами',
      text: 'Добавляйте и редактируйте товары в несколько кликов',
    ),
    const OnboardingCard(
      imageUrl: 'assets/onboarding3.png',
      title: 'Аналитика продаж',
      text: 'Отслеживайте статистику и оптимизируйте ваш бизнес',
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
    final theme = Theme.of(context).onboardingPageThemeExtension;

    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            bottom: false,
            child:   Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: List.generate(
                        cards.length,
                            (i) => Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2),
                              child:  AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                height: 4,
                                decoration: BoxDecoration(
                                    color:  _currentPage >= i ? theme.pageIndicatorEnabledColor : theme.pageIndicatorDisabledColor,
                                    borderRadius: BorderRadius.circular(16)
                                ),
                              ),
                            )
                        )
                    ),
                  ),
                ),
                SizedBox(height: 8,),
                Text('${_currentPage+1} из ${cards.length}', style: TextStyle(color: theme.pageIndicatorTextColor, fontSize: 15),),
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
                            onTap: isEnd ? () => context.router.replace(RegisterRoute()) : _nextPage,
                            child: Text(isEnd ? 'Начать регистрацию' : 'Далее'),
                          ),
                          LaButton(
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