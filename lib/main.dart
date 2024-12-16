import 'package:bootcamp_101/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => CounterProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.purple,
        scaffoldBackgroundColor: const Color(0xFF1A1B2E),
      ),
      home: const CounterScreen(),
    );
  }
}
