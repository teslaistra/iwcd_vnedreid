import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:lamoda_seller/features/presentation/akcia_picker_page/akcia_picker_screen.dart';

@RoutePage()
class AkciaPickerPage extends StatelessWidget {
  const AkciaPickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AkciaPickerScreen();
  }
}
