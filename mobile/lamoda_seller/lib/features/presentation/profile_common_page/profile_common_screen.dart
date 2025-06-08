import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lamoda_seller/application/application_store/application_store.dart';
import 'package:lamoda_seller/features/ui_kit/la_blur_container/la_blur_container.dart';
import 'package:lamoda_seller/features/ui_kit/la_button/la_button.dart';
import 'package:lamoda_seller/features/ui_kit/la_chip/la_chip.dart';
import 'package:lamoda_seller/features/ui_kit/la_chip/la_chip_theme.dart';
import 'package:provider/provider.dart';

class ProfileCommonScreen extends StatefulWidget {
  const ProfileCommonScreen({super.key});

  @override
  State<ProfileCommonScreen> createState() => _ProfileCommonScreenState();
}

class _ProfileCommonScreenState extends State<ProfileCommonScreen> {
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
                        'Общая информация',
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
                                Text(
                                  'Личный кабинет',
                                  style: TextStyle(
                                    color: Color(0x8C333333),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'mc meqdqedew',
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: Color(0xFF333333),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: 12),
                                Text(
                                  'Дата начала сотрудничества',
                                  style: TextStyle(
                                    color: Color(0x8C333333),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  '20.06.2018',
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: Color(0xFF333333),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: 12),
                                Text(
                                  'Номер договора',
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
