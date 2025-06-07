import 'package:flutter/material.dart';
import 'package:lamoda_seller/features/ui_kit/la_chip/la_chip_theme.dart';

class LaChip extends StatelessWidget {
  final LaChipThemeDecoration? decoration;
  final Widget child;

  const LaChip({super.key, this.decoration, required this.child});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(
      context,
    ).laChipThemeExtension.copyWithDecoration(decoration);

    return Container(
      height: 26,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: theme.color,
      ),
      padding: EdgeInsets.symmetric(horizontal: 8),
      alignment: Alignment.center,
      child: DefaultTextStyle.merge(
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 13,
          color: theme.textColor,
        ),
        child: child,
      ),
    );
  }
}
