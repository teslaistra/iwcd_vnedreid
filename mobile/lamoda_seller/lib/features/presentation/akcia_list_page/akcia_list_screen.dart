import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lamoda_seller/application/application_store/application_store.dart';
import 'package:lamoda_seller/application/router/app_router.dart';
import 'package:lamoda_seller/features/presentation/akcia_list_page/widgets/akcia_card.dart';
import 'package:lamoda_seller/features/ui_kit/la_blur_container/la_blur_container.dart';
import 'package:lamoda_seller/features/ui_kit/la_button/la_button.dart';
import 'package:lamoda_seller/features/ui_kit/la_chip/la_chip.dart';
import 'package:provider/provider.dart';

class AkciaListScreen extends StatefulWidget {
  const AkciaListScreen({super.key});

  @override
  State<AkciaListScreen> createState() => _AkciaListScreenState();
}

class _AkciaListScreenState extends State<AkciaListScreen> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final store = context.read<ApplicationStore>();

    return Scaffold(
      backgroundColor: Color(0xFFF2F3F5),
      body: Stack(
        children: [
          SafeArea(
            bottom: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => context.router.pop(),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 24,
                          color: Color(0xFF333333),
                        ),
                      ),
                      Text(
                        'Акции',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF333333),
                        ),
                      ),
                      SizedBox(width: 24),
                    ],
                  ),
                ),
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 24,
                          ),
                          child: SizedBox(
                            width: double.infinity,
                            child: CupertinoSlidingSegmentedControl<int>(
                              backgroundColor: Color(0xFFE7E8E9),
                              thumbColor: Colors.white,
                              onValueChanged: (int? value) {
                                setState(() {
                                  currentPage = value ?? currentPage;
                                });
                              },
                              groupValue: currentPage,
                              children: <int, Widget>{
                                0: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Text(
                                    'Предложенные',
                                    style:
                                        currentPage == 0
                                            ? TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            )
                                            : TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                            ),
                                  ),
                                ),
                                1: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Text(
                                    'Активные',
                                    style:
                                        currentPage == 1
                                            ? TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            )
                                            : TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                            ),
                                  ),
                                ),
                              },
                            ),
                          ),
                        ),
                      ),

                      SliverPadding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        sliver: SliverList(
                          delegate: SliverChildListDelegate([
                            GestureDetector(
                              onTap: () => context.router.push(AkciaRoute()),
                              child: AkciaCard(
                                title: 'Акция "Брюки всем"',
                                subtitle: '21 февраля - 31 мая',
                                badges: [
                                  LaChip(child: Text('Специально для вас')),
                                  LaChip(child: Text('25 процентов')),
                                ],
                              ),
                            )
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
