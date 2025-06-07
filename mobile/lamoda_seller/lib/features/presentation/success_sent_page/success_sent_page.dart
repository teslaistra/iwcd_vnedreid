import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:lamoda_seller/features/presentation/success_sent_page/success_sent_screen.dart';

@RoutePage()
class SuccessSentPage extends StatelessWidget {
  const SuccessSentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SuccessSentScreen();
  }
}
