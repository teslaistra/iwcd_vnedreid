import 'package:flutter/material.dart';

class BrandCard extends StatelessWidget {
  final Widget? image;
  final Widget? badge;
  final String title;
  final int count;

  const BrandCard({super.key, this.image, this.badge, required this.title, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child:  Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                color: Color(0xFFF2F3F5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: image,
            ),
            SizedBox(width: 20,),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(color: Color(0xFF333333), fontSize: 19, fontWeight: FontWeight.w600),),
                SizedBox(height: 4,),
                Text('$count товаров', style: TextStyle(color: Color(0x8C333333), fontSize: 13, fontWeight: FontWeight.w400)),
                SizedBox(height: 8,),
                if (badge != null) badge!
              ],
            )
          ],
        ),
      )
    );
  }
}
