import 'package:flutter/material.dart';
import 'package:flutter_maquetacion_1/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maquetación App Móvil',
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}