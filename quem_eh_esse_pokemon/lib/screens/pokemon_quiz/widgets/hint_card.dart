import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class HintCard extends StatelessWidget {
  final String hint;

  const HintCard({
    super.key,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    final isDark =
        Theme.of(context).brightness ==
            Brightness.dark;

    return Container(
      width: double.infinity,
      padding:
          const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.warningDark
            : AppColors.warningLight,
        borderRadius:
            BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.lightbulb,
            color: AppColors.warning,
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Text(hint),
          ),
        ],
      ),
    );
  }
}