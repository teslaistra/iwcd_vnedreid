import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lamoda_seller/application/application_store/application_store.dart';
import 'package:lamoda_seller/features/ui_kit/la_blur_container/la_blur_container.dart';
import 'package:lamoda_seller/features/ui_kit/la_button/la_button.dart';
import 'package:provider/provider.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({super.key});

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {

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
                      Text('Товар', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Color(0xFF333333)),),
                      SizedBox(width: 24,)
                    ],
                  ),
                ),
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: 220,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 20,),
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFFFFF),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Image.asset(
                                  'assets/home_asset_3.png',
                                  height: 90,
                                ),
                              ),
                              SizedBox(width: 20,),
                              SizedBox(height: 12,),
                              Text('Брюки', maxLines: 1, style: TextStyle(color: Color(0xFF333333), fontSize: 19, fontWeight: FontWeight.w600),),
                              SizedBox(height: 4,),
                              Text('1000 штук', style: TextStyle(color: Color(0x8C333333), fontSize: 13, fontWeight: FontWeight.w400)),
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
                                      Text('Наименование', style: TextStyle(color: Color(0x8C333333), fontSize: 14, fontWeight: FontWeight.w400)),
                                      SizedBox(height: 4,),
                                      Text('Брюки', maxLines: 1, style: TextStyle(color: Color(0xFF333333), fontSize: 16, fontWeight: FontWeight.w400),),
                                      SizedBox(height: 12,),
                                      Text('Артикул товара', style: TextStyle(color: Color(0x8C333333), fontSize: 14, fontWeight: FontWeight.w400)),
                                      SizedBox(height: 4,),
                                      Text('112345', maxLines: 1, style: TextStyle(color: Color(0xFF333333), fontSize: 16, fontWeight: FontWeight.w400),),
                                      SizedBox(height: 12,),
                                      Text('Размер / сетка', style: TextStyle(color: Color(0x8C333333), fontSize: 14, fontWeight: FontWeight.w400)),
                                      SizedBox(height: 4,),
                                      Text('XL', maxLines: 1, style: TextStyle(color: Color(0xFF333333), fontSize: 16, fontWeight: FontWeight.w400),),
                                      SizedBox(height: 12,),
                                      Text('Розничная цена', style: TextStyle(color: Color(0x8C333333), fontSize: 14, fontWeight: FontWeight.w400)),
                                      SizedBox(height: 4,),
                                      Text('12 000 ₽', maxLines: 1, style: TextStyle(color: Color(0xFF333333), fontSize: 16, fontWeight: FontWeight.w400),),
                                      SizedBox(height: 12,),
                                      Text('Цвета', style: TextStyle(color: Color(0x8C333333), fontSize: 14, fontWeight: FontWeight.w400)),
                                      SizedBox(height: 4,),
                                      Text('Синий', maxLines: 1, style: TextStyle(color: Color(0xFF333333), fontSize: 16, fontWeight: FontWeight.w400),),
                                      SizedBox(height: 12,),
                                      Text('Фотографии', style: TextStyle(color: Color(0x8C333333), fontSize: 14, fontWeight: FontWeight.w400)),
                                      SizedBox(height: 4,),
                                      Text('Shorts1.jpg', maxLines: 1, style: TextStyle(color: Color(0xFF333333), fontSize: 16, fontWeight: FontWeight.w400),),
                                      SizedBox(height: 4,),
                                      Text('Shorts2.jpg', maxLines: 1, style: TextStyle(color: Color(0xFF333333), fontSize: 16, fontWeight: FontWeight.w400),),
                                      SizedBox(height: 4,),
                                      Text('Shorts3.jpg', maxLines: 1, style: TextStyle(color: Color(0xFF333333), fontSize: 16, fontWeight: FontWeight.w400),),
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
                                      SizedBox(height: 12,),
                                      Text('Топ акции', style: TextStyle(color: Color(0x8C333333), fontSize: 14, fontWeight: FontWeight.w400)),
                                      SizedBox(height: 4,),
                                      Text('1. Акция 112345', maxLines: 1, style: TextStyle(color: Color(0xFF333333), fontSize: 16, fontWeight: FontWeight.w400),),
                                      SizedBox(height: 4,),
                                      Text('2. Акция 112346', maxLines: 1, style: TextStyle(color: Color(0xFF333333), fontSize: 16, fontWeight: FontWeight.w400),),
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
                          child: Text( 'Редактировать'),
                        ),
                        LaButton(
                          child: Text('Удалить'),
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