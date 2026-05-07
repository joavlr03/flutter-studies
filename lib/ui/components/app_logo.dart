import 'package:flutter/widgets.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'BoardGames',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }

}
