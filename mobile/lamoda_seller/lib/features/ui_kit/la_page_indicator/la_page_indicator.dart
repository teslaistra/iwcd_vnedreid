import 'package:flutter/material.dart';
import 'package:lamoda_seller/features/ui_kit/la_page_indicator/la_page_indicator_theme.dart';

class LaPageIndicator extends StatelessWidget {
  final LaPageIndicatorThemeDecoration? decoration;
  final int currentValue;

  final int size;

  const LaPageIndicator({
    super.key,
    this.decoration,
    required this.currentValue,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(
      context,
    ).laPageIndicatorThemeExtension.copyWithDecoration(decoration);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: List.generate(
              size,
              (i) => Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    height: 4,
                    decoration: BoxDecoration(
                      color:
                          currentValue >= i
                              ? theme.enabledColor
                              : theme.disabledColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          '${currentValue + 1} из ${size}',
          style: TextStyle(color: theme.textColor, fontSize: 15),
        ),
      ],
    );
  }
}
