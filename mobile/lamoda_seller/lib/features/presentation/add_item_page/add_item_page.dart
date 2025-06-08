import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:lamoda_seller/features/presentation/add_item_page/add_item_screen.dart';

@RoutePage()
class AddItemPage extends StatelessWidget {
  const AddItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddItemScreen();
  }
}