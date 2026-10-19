import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';
import 'score_card.dart';

class ScoreBoard extends StatelessWidget {
  final int score;
  final int hits;
  final int errors;

  const ScoreBoard({
    super.key,
    required this.score,
    required this.hits,
    required this.errors,
  });

  @override
  Widget build(BuildContext context) {
    final isDark =
        Theme.of(context).brightness ==
            Brightness.dark;

    return Row(
      children: [
        Expanded(
          child: ScoreCard(
            title: 'Pontos',
            value: score,
            icon: Icons.star,
            color: isDark
                ? AppColors.primaryDark
                : AppColors.primary,
            backgroundColor: isDark
                ? const Color(0xFF1C2B42)
                : const Color(0xFFEAF2FF),
          ),
        ),

        const SizedBox(width: 8),

        Expanded(
          child: ScoreCard(
            title: 'Acertos',
            value: hits,
            icon: Icons.check,
            color: AppColors.success,
            backgroundColor: isDark
                ? AppColors.successDark
                : AppColors.successLight,
          ),
        ),

        const SizedBox(width: 8),

        Expanded(
          child: ScoreCard(
            title: 'Erros',
            value: errors,
            icon: Icons.close,
            color: AppColors.error,
            backgroundColor: isDark
                ? AppColors.errorDark
                : AppColors.errorLight,
          ),
        ),
      ],
    );
  }
}