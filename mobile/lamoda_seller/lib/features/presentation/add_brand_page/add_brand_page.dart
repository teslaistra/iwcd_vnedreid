import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:lamoda_seller/features/presentation/add_brand_page/add_brand_screen.dart';

@RoutePage()
class AddBrandPage extends StatelessWidget {
  const AddBrandPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddBrandScreen();
  }
}
