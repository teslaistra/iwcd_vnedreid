import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lamoda_seller/application/application_store/application_store.dart';
import 'package:lamoda_seller/features/presentation/akcia_list_page/widgets/akcia_card.dart';
import 'package:lamoda_seller/features/presentation/notifications_page/widgets/notification_card.dart';
import 'package:lamoda_seller/features/ui_kit/la_blur_container/la_blur_container.dart';
import 'package:lamoda_seller/features/ui_kit/la_button/la_button.dart';
import 'package:lamoda_seller/features/ui_kit/la_chip/la_chip.dart';
import 'package:lamoda_seller/features/ui_kit/la_chip/la_chip_theme.dart';
import 'package:provider/provider.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
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
                        'Уведомления',
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
                                NotificationCard(
                                  title: 'Участвуйте в акциях для повышения продаж',
                                  subtitle: 'Присоединитесь к акциям и повысьте продажи',
                                  date: '27 сентября 15:30',
                                  badges: [LaChip(child: Text('LAMODA'), decoration: LaChipThemeDecoration(textColor: Color(0x8C040413)),)],
                                ),
                                SizedBox(height: 12),
                                NotificationCard(
                                  title: 'Ваша заявка одобрена',
                                  subtitle: 'Можете опубликовать товары',
                                  date: '20 сентября 21:00',
                                  badges: [LaChip(child: Text('LAMODA'), decoration: LaChipThemeDecoration(textColor: Color(0x8C040413)),)],
                                ),
                                SizedBox(height: 12),
                                NotificationCard(
                                  title: 'Ваша заявка принята',
                                  subtitle: 'Рассмотрим ее в течение пары дней',
                                  date: '12 сентября 11:20',
                                  badges: [LaChip(child: Text('LAMODA'), decoration: LaChipThemeDecoration(textColor: Color(0x8C040413)),)],
                                ),
                                SizedBox(height: 300),
                              ],
                            ),
                          ),
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
