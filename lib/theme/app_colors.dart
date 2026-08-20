import 'package:flutter/material.dart';

abstract final class AppColors {
  // Cores principais
  static const primary = Color(0xFF246BDB);
  static const primaryDark = Color(0xFF8AB4FF);

  // Sucesso
  static const success = Color(0xFF219653);
  static const successLight = Color(0xFFEAF8EF);
  static const successDark = Color(0xFF173D28);

  // Erro
  static const error = Color(0xFFE33C3C);
  static const errorLight = Color(0xFFFFEEEE);
  static const errorDark = Color(0xFF4A2020);

  // Dica
  static const warning = Color(0xFFE29B14);
  static const warningLight = Color(0xFFFFF7E0);
  static const warningDark = Color(0xFF423519);

  // Light
  static const lightBackground = Color(0xFFF8F9FC);
  static const lightSurface = Colors.white;
  static const lightImageBackground = Color(0xFFEAF3FF);
  static const lightText = Color(0xFF102A56);
  static const lightSecondaryText = Color(0xFF596275);

  // Dark
  static const darkBackground = Color(0xFF101318);
  static const darkSurface = Color(0xFF191C22);
  static const darkImageBackground = Color(0xFF202A38);
  static const darkText = Color(0xFFF1F4FA);
  static const darkSecondaryText = Color(0xFFBCC4D0);
}