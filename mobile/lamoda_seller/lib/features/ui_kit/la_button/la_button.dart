import 'package:flutter/material.dart';
import 'package:lamoda_seller/features/ui_kit/la_button/la_button_theme.dart';

class LaButton extends StatelessWidget {
  final LaButtonThemeDecoration? decoration;
  final Widget child;
  final bool primary;

  final void Function()? onTap;

  const LaButton({
    super.key,
    required this.child,
    this.decoration,
    this.primary = true, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(
      context,
    ).laButtonThemeExtension.copyWithDecoration(decoration);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(theme.borderRadius),
          color: primary ? theme.primaryStateColor : theme.secondaryStateColor,
        ),
        child: Center(
          child: DefaultTextStyle.merge(
            style: TextStyle(
              color:
              primary
                  ? theme.primaryStateTextColor
                  : theme.secondaryStateTextColor,
              fontWeight: FontWeight.w600,
              fontSize: 17
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
