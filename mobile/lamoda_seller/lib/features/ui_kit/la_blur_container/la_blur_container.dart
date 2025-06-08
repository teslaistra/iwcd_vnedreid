import 'dart:ui';

import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

import 'la_blur_container_theme.dart';

class LaBlurContainer extends StatelessWidget {
  final LaBlurContainerThemeDecoration? decoration;
  final Widget child;

  const LaBlurContainer({super.key, this.decoration, required this.child});

  @override
  Widget build(BuildContext context) {
    final theme =
    Theme.of(context).laBlurContainerThemeExtension.copyWithDecoration(decoration);

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: theme.blurStrength, sigmaY: theme.blurStrength),
        child: Container(
            decoration: BoxDecoration(
              color: theme.blurColor,
            ),
            child: child
        ),
      ),
    );
  }
}
