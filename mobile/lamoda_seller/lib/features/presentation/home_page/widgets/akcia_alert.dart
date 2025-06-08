import 'package:flutter/material.dart';

class AkciaAlert extends StatelessWidget {

  const AkciaAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
                colors: [
                  Color(0xFFF96536),
                  Color(0xFFFB825C)
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight
            )
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Воспользуйтесь акциями', textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.w400, color: Color(
                      0xFFFFFFFF), fontSize: 17),),
                  SizedBox(height: 2,),
                  Text('Классный вариант для продаж!', textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.w400, color: Color(0xA3FFFFFF),  fontSize: 15)),
                ],
              ),
            ),
          ],
        )
    );
  }
}
