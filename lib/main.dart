import 'package:flutter/material.dart';
import 'theme/app_theme.dart';

import 'screens/pokemon_quiz/pokemon_quiz_screen.dart';

void main() {
  runApp(
    const PokemonQuizApp(),
  );
}

class PokemonQuizApp extends StatelessWidget {
  const PokemonQuizApp({
    super.key,
  });

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quem é esse Pokémon?',

      theme: AppTheme.light,
      darkTheme: AppTheme.dark,

      themeMode: ThemeMode.system,

      home: const PokemonQuizScreen(),
    );
  }
}