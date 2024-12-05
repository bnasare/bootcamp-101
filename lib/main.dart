import 'package:bootcamp_101/forms.dart';
import 'package:flutter/material.dart';

import 'podcast_details_screen.dart';

void main() {
  runApp(const MyApp());
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
      home: const FormsScreen(),
    );
  }
}
