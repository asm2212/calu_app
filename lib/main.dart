import 'package:calu_app/screens/calu_screens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  CalculatorScreen(),
    );
  }
}


class CalScreen extends StatelessWidget {
  const CalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFf9f9f9),
        title: const Text(
          "Simple Calculator",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: const Text(
          'Welcome to Simple Calculator!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}