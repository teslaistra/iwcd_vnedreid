import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lamoda_seller/application/application_store/application_store.dart';
import 'package:lamoda_seller/application/router/app_router.dart';
import 'package:lamoda_seller/features/ui_kit/la_blur_container/la_blur_container.dart';
import 'package:lamoda_seller/features/ui_kit/la_button/la_button.dart';
import 'package:provider/provider.dart';

class AkciaScreen extends StatefulWidget {
  const AkciaScreen({super.key});

  @override
  State<AkciaScreen> createState() => _AkciaScreenState();
}

class _AkciaScreenState extends State<AkciaScreen> {

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
                      Text('Акция', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Color(0xFF333333)),),
                      SizedBox(width: 24,)
                    ],
                  ),
                ),
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: 130,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Акция "Брюки всем"', maxLines: 1, style: TextStyle(color: Color(0xFF333333), fontSize: 19, fontWeight: FontWeight.w600),),
                              SizedBox(height: 4,),
                              Text('21 февраля - 31 мая', style: TextStyle(color: Color(0x8C333333), fontSize: 13, fontWeight: FontWeight.w400)),
                              SizedBox(height: 20,),

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
                                            'Информация',
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
                                            'Аналитика',
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
                            ],
                          ),
                        ),
                      ),

                      SliverToBoxAdapter(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            switch (currentPage) {
                              0 => Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child:  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('Тип товара на который распространяется', style: TextStyle(color: Color(0x8C333333), fontSize: 14, fontWeight: FontWeight.w400)),
                                      SizedBox(height: 4,),
                                      Text('Брюки, Штаны', maxLines: 1, style: TextStyle(color: Color(0xFF333333), fontSize: 16, fontWeight: FontWeight.w400),),
                                      SizedBox(height: 12,),
                                      Text('Количество процентов скидки', style: TextStyle(color: Color(0x8C333333), fontSize: 14, fontWeight: FontWeight.w400)),
                                      SizedBox(height: 4,),
                                      Text('25%', maxLines: 1, style: TextStyle(color: Color(0xFF333333), fontSize: 16, fontWeight: FontWeight.w400),),
                                      SizedBox(height: 300,),
                                    ],
                                  ),
                                ),
                              ),
                              1 => Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child:  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 12,),
                                      Image.asset('assets/chart.png'),
                                      SizedBox(height: 12,),
                                      Text('Рост продаж', style: TextStyle(color: Color(0x8C333333), fontSize: 14, fontWeight: FontWeight.w400)),
                                      SizedBox(height: 4,),
                                      Text('mc meqdqedew', maxLines: 1, style: TextStyle(color: Color(0xFF333333), fontSize: 16, fontWeight: FontWeight.w400),),
                                      SizedBox(height: 300,),
                                    ],
                                  ),
                                ),
                              ),
                              _ => throw UnimplementedError()
                            }
                          ],
                        ),
                      )
                    ],
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
                          onTap: () => context.router.push(AkciaPickerRoute()),
                          child: Text( 'Добавить товары'),
                        ),
                        LaButton(
                          child: Text('Удалить товары'),
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