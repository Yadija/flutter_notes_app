import 'package:flutter/material.dart';
import 'package:flutter_notes_app/screens/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFAFAFA),
      ),
      home: const HomePage(),
    );
  }
}
