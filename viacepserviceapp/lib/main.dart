import 'package:flutter/material.dart';
import 'package:viacepserviceapp/screens/home_screen.dart';

void main() {
  runApp(const ViaCepApp());
}

class ViaCepApp extends StatelessWidget {
  const ViaCepApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consulta ViaCEP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        inputDecorationTheme: const InputDecorationTheme(filled: true),
      ),
      home: const HomeScreen(),
    );
  }
}
