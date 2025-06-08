import 'package:flutter/material.dart';

class ItemCard extends StatefulWidget {
  final Widget? image;
  final Widget? badge;
  final String title;
  final int count;

  final bool enableTouch;

  const ItemCard({super.key, this.image, this.badge, required this.title, required this.count, this.enableTouch = false});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {

  bool touched = false;
  @override
  Widget build(BuildContext context) {
    if (widget.enableTouch) {
      return GestureDetector(
        onTap: () => setState(() {
          touched = !touched;
        }),
        child:  Container(
            decoration: BoxDecoration(
              color: touched ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(28),
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child:  Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Color(0xFFF2F3F5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: widget.image,
                  ),
                  SizedBox(width: 20,),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 12,),
                      Text(widget.title, maxLines: 1, style: TextStyle(color: touched ? Colors.white : Color(0xFF333333), fontSize: 19, fontWeight: FontWeight.w600),),
                      SizedBox(height: 4,),
                      Text('${widget.count} штук', style: TextStyle(color: touched ? Colors.white : Color(0x8C333333), fontSize: 13, fontWeight: FontWeight.w400)),
                      SizedBox(height: 8,),
                      if (widget.badge != null) widget.badge!
                    ],
                  )
                ],
              ),
            )
        ),
      );
    }

    return   Container(
        decoration: BoxDecoration(
          color: touched ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child:  Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: Color(0xFFF2F3F5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: widget.image,
              ),
              SizedBox(width: 20,),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12,),
                  Text(widget.title, maxLines: 1, style: TextStyle(color: touched ? Colors.white : Color(0xFF333333), fontSize: 19, fontWeight: FontWeight.w600),),
                  SizedBox(height: 4,),
                  Text('${widget.count} штук', style: TextStyle(color: touched ? Colors.white : Color(0x8C333333), fontSize: 13, fontWeight: FontWeight.w400)),
                  SizedBox(height: 8,),
                  if (widget.badge != null) widget.badge!
                ],
              )
            ],
          ),
        )
    );
  }
}
