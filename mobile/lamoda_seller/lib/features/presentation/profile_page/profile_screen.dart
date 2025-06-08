import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lamoda_seller/application/application_store/application_store.dart';
import 'package:lamoda_seller/application/router/app_router.dart';
import 'package:lamoda_seller/features/ui_kit/la_blur_container/la_blur_container.dart';
import 'package:lamoda_seller/features/ui_kit/la_button/la_button.dart';
import 'package:lamoda_seller/features/ui_kit/la_chip/la_chip.dart';
import 'package:lamoda_seller/features/ui_kit/la_chip/la_chip_theme.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                        'Личный кабинет',
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
                        child: SizedBox(
                          height: 220,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 20),
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFFFFF),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                  child: Image.asset(
                                    'assets/ilya.png',
                                    height: 90,
                                  ),
                                )
                              ),
                              SizedBox(width: 20),
                              SizedBox(height: 12),
                              Text(
                                'Тестовый филиал',
                                maxLines: 1,
                                style: TextStyle(
                                  color: Color(0xFF333333),
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 4),
                              SizedBox(
                                width: 170,
                                child: LaChip(
                                  child: Text('Заявка на проверке'),
                                  decoration: LaChipThemeDecoration(
                                    color: Color(0xFFF7EBD9),
                                    textColor: Color(0xFFCB830F),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),

                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
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
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 20,
                                        ),
                                        child: Text(
                                          'Основное',
                                          style:
                                              currentPage == 0
                                                  ? TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                  )
                                                  : TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                        ),
                                      ),
                                      1: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 20,
                                        ),
                                        child: Text(
                                          'Финансы',
                                          style:
                                              currentPage == 1
                                                  ? TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                  )
                                                  : TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                        ),
                                      ),
                                      2: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 20,
                                        ),
                                        child: Text(
                                          'Договора',
                                          style:
                                          currentPage == 2
                                              ? TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                          )
                                              : TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                          ),
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
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 0,
                                ),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 24,),
                                      GestureDetector(
                                        onTap: () => context.router.push(ProfileCommonRoute()),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 48,
                                              height: 48,
                                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                                              child: Center(
                                                child: Icon(Icons.info_outline, size: 28,),
                                              ),
                                            ),
                                            SizedBox(width: 8,),
                                            Text('Общая информация', style: TextStyle(
                                              color: Color(0xFF0F0F0F),
                                              fontSize: 17,
                                              fontWeight: FontWeight.w400,
                                            ),)
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 24,),
                                      GestureDetector(
                                        onTap: () => context.router.push(NotificationsRoute()),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 48,
                                              height: 48,
                                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                                              child: Center(
                                                child: Icon(Icons.notifications_none_outlined, size: 28,),
                                              ),
                                            ),
                                            SizedBox(width: 8,),
                                            Text('Уведомления', style: TextStyle(
                                              color: Color(0xFF0F0F0F),
                                              fontSize: 17,
                                              fontWeight: FontWeight.w400,
                                            ),)
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 24,),
                                      GestureDetector(
                                        onTap: () => context.router.push(ChatRoute()),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 48,
                                              height: 48,
                                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                                              child: Center(
                                                child: Icon(Icons.chat_outlined, size: 28,),
                                              ),
                                            ),
                                            SizedBox(width: 8,),
                                            Text('Онлайн-чат', style: TextStyle(
                                              color: Color(0xFF0F0F0F),
                                              fontSize: 17,
                                              fontWeight: FontWeight.w400,
                                            ),)
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              1 => Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 0,
                                ),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 12),
                                      Text(
                                        'Номер счета',
                                        style: TextStyle(
                                          color: Color(0x8C333333),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        '123143124321213123',
                                        maxLines: 1,
                                        style: TextStyle(
                                          color: Color(0xFF333333),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(height: 12),
                                      Text(
                                        'Банк',
                                        style: TextStyle(
                                          color: Color(0x8C333333),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'ПАО “Сбербанк”',
                                        maxLines: 1,
                                        style: TextStyle(
                                          color: Color(0xFF333333),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(height: 12),
                                      Text(
                                        'Код банка',
                                        style: TextStyle(
                                          color: Color(0x8C333333),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        '2131243213',
                                        maxLines: 1,
                                        style: TextStyle(
                                          color: Color(0xFF333333),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(height: 12),
                                      Text(
                                        'ИНН',
                                        style: TextStyle(
                                          color: Color(0x8C333333),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        '12312434121',
                                        maxLines: 1,
                                        style: TextStyle(
                                          color: Color(0xFF333333),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(height: 12),
                                      Text(
                                        'Название счета',
                                        style: TextStyle(
                                          color: Color(0x8C333333),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'ИП Илья Купимак',
                                        maxLines: 1,
                                        style: TextStyle(
                                          color: Color(0xFF333333),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(height: 300),
                                    ],
                                  ),
                                ),
                              ),
                              2 => Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 0,
                                ),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 24,),
                                      GestureDetector(
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 48,
                                              height: 48,
                                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                                              child: Center(
                                                child: Icon(Icons.file_present_rounded, size: 28, color: Colors.grey,),
                                              ),
                                            ),
                                            SizedBox(width: 8,),
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Кредитный договор.pdf', style: TextStyle(
                                                  color: Color(0xFF0F0F0F),
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w400,
                                                ),),
                                                Text('20.06.2018', style: TextStyle(
                                                  color: Color(0x8C040413),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                ),),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 24,),
                                      GestureDetector(
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 48,
                                              height: 48,
                                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                                              child: Center(
                                                child: Icon(Icons.file_present_rounded, size: 28, color: Colors.grey,),
                                              ),
                                            ),
                                            SizedBox(width: 8,),
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Договор оферты.pdf', style: TextStyle(
                                                  color: Color(0xFF0F0F0F),
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w400,
                                                ),),
                                                Text('20.06.2018', style: TextStyle(
                                                  color: Color(0x8C040413),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                ),),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 24,),
                                      GestureDetector(
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 48,
                                              height: 48,
                                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                                              child: Center(
                                                child: Icon(Icons.file_present_rounded, size: 28, color: Colors.grey,),
                                              ),
                                            ),
                                            SizedBox(width: 8,),
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Договор о товарах.pdf', style: TextStyle(
                                                  color: Color(0xFF0F0F0F),
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w400,
                                                ),),
                                                Text('20.06.2018', style: TextStyle(
                                                  color: Color(0x8C040413),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                ),),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              _ => throw UnimplementedError(),
                            },
                          ],
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
