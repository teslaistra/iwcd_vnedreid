import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final List<Widget>? badges;
  final String title;
  final String subtitle;

  final String date;

  const NotificationCard({super.key, required this.title, this.badges, required this.subtitle, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
            padding: EdgeInsets.all(16),
            child:  Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 8,
                  children: [
                    if (badges != null) ...badges!
                  ],
                ),
                SizedBox(height: 6,),
                Text(date, style: TextStyle(color: Color(0x8C333333), fontSize: 14, fontWeight: FontWeight.w400)),
                SizedBox(height: 12,),
                Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Color(0xFF333333), fontSize: 16, fontWeight: FontWeight.w600),),
                SizedBox(height: 2,),
                Text(subtitle, style: TextStyle(color: Color(0x8C333333), fontSize: 14, fontWeight: FontWeight.w400)),
              ],
            )
        )
    );
  }
}
