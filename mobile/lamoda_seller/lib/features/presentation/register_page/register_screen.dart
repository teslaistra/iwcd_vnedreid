import 'package:flutter/material.dart';
import 'package:lamoda_seller/features/presentation/register_page/register_page_theme.dart';
import 'package:lamoda_seller/features/ui_kit/la_blur_container/la_blur_container.dart';
import 'package:lamoda_seller/features/ui_kit/la_button/la_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  bool get isEnd => _currentPage+1 == cards.length;

  // Тестовые данные для карточек
  final List<Widget> cards = [
    SizedBox(),
    SizedBox()
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
    final theme = Theme.of(context).registerPageThemeExtension;

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
                          onTap: _nextPage,
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