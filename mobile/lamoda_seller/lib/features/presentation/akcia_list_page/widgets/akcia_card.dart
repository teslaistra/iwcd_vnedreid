import 'package:flutter/material.dart';

class AkciaCard extends StatelessWidget {
  final List<Widget>? badges;
  final String title;
  final String subtitle;

  const AkciaCard({super.key, required this.title, this.badges, required this.subtitle});

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
              SizedBox(height: 12,),
              Text(title, style: TextStyle(color: Color(0xFF333333), fontSize: 19, fontWeight: FontWeight.w600),),
              SizedBox(height: 4,),
              Text(subtitle, style: TextStyle(color: Color(0x8C333333), fontSize: 13, fontWeight: FontWeight.w400)),
            ],
          )
        )
    );
  }
}
