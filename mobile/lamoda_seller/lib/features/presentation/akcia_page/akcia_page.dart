import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:lamoda_seller/features/presentation/akcia_page/akcia_screen.dart';
import 'package:lamoda_seller/features/presentation/item_page/item_screen.dart';

@RoutePage()
class AkciaPage extends StatelessWidget {
  const AkciaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AkciaScreen();
  }
}
