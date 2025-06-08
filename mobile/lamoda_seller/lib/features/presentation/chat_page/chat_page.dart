import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lamoda_seller/features/presentation/chat_page/chat_screen.dart';

@RoutePage()
class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ChatScreen(url: 'http://chat.lamoda.itatmisis.ru');
  }
}