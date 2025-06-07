import 'package:flutter/material.dart';

class LaSubpageLayout extends StatelessWidget {

  final Widget? image;
  final Widget? title;
  final List<Widget>? titleChips;
  final Widget? text;

  final EdgeInsets contentPadding;

  const LaSubpageLayout({super.key, this.image, this.title, this.titleChips, this.text, this.contentPadding = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: contentPadding,
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                children: [
                  if (title != null) DefaultTextStyle.merge(
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 27
                    ),
                    child: title!,
                  ),
                  if (titleChips != null) ...List.generate(
                    titleChips!.length,
                        (i) => DefaultTextStyle.merge(
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 27
                      ),
                      child: titleChips![i],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              if (text != null) DefaultTextStyle.merge(
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 17
                ),
                child: text!,
              ),
            ],
          ),
        ),
        if (image != null) image!
      ],
    );
  }
}
