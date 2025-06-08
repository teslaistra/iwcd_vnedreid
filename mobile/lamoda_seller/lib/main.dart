import 'dart:html' as html;

import 'package:lamoda_seller/features/demo/demo_entrypoint.dart';
import 'package:flutter/material.dart';


void main() {
  if (html.window.location.hash.isNotEmpty) {
    html.window.history.replaceState(null, '', '/');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoEntrypoint();
  }
}