import 'package:flutter/material.dart';
import 'package:lamoda_seller/features/ui_kit/la_chip_button/la_chip_button_theme.dart';

class LaChipButton extends StatelessWidget {
  final bool enabled;
  final LaChipButtonThemeDecoration? decoration;
  final EdgeInsets padding;
  final Widget child;

  const LaChipButton(
      {super.key,
        this.decoration,
        this.enabled = false,
        required this.child,
        this.padding = const EdgeInsets.symmetric(vertical: 6, horizontal: 12)});

  @override
  Widget build(BuildContext context) {
    final theme =
    Theme.of(context).laChipButtonThemeExtension.copyWithDecoration(decoration);

    return Container(
      height: 32,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10000),
            color: enabled ? theme.enabledColor : theme.disabledColor),
        padding: padding,
        child: Row(
          children: [
            DefaultTextStyle.merge(
                style: TextStyle(
                    color:
                    enabled ? theme.enabledTextColor : theme.disabledTextColor),
                child: child),
            SizedBox(width: 6,),
            Icon(Icons.keyboard_arrow_down, size: 16,)
          ],
        )
    );
  }
}
