import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:lamoda_seller/features/presentation/akcia_list_page/akcia_list_screen.dart';

@RoutePage()
class AkciaListPage extends StatelessWidget {
  const AkciaListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AkciaListScreen();
  }
}
