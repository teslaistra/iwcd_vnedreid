import 'package:flutter/material.dart';
import 'package:lamoda_seller/features/ui_kit/la_text_field/la_text_field_theme.dart';

class LaTextField extends StatelessWidget {
  static const double _borderRadius = 16; // Константа скругления
  static const double _borderWidth = 1.0; // Константа толщины рамки

  final LaTextFieldThemeDecoration? decoration;
  final String? hintText;
  final bool enabled;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const LaTextField({
    super.key,
    this.decoration,
    this.hintText,
    this.enabled = true,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(
      context,
    ).laTextFieldThemeExtension.copyWithDecoration(decoration);

    final borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(_borderRadius),
      borderSide: BorderSide(
        color: enabled ? theme.borderColor : theme.disabledBorderColor,
        width: _borderWidth,
      ),
    );

    return TextField(
      controller: controller,
      onChanged: onChanged,
      enabled: enabled,
      style: TextStyle(color: theme.textColor),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: theme.hintColor),
        filled: true,
        fillColor:
            enabled ? theme.backgroundColor : theme.disabledBackgroundColor,
        border: borderStyle,
        enabledBorder: borderStyle,
        disabledBorder: borderStyle,
        focusedBorder: borderStyle,
        errorBorder: borderStyle,
        focusedErrorBorder: borderStyle,
        hoverColor: Colors.transparent,

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
    );
  }
}
