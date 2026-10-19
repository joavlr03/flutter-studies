import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class PokemonImage extends StatelessWidget {
  final String imageUrl;
  final bool silhouette;

  const PokemonImage({
    super.key,
    required this.imageUrl,
    this.silhouette = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark =
        Theme.of(context).brightness ==
            Brightness.dark;

    return Container(
      width: double.infinity,
      height: 300,
      padding:
          const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.darkImageBackground
            : AppColors.lightImageBackground,
        borderRadius:
            BorderRadius.circular(24),
      ),
      child: Image.network(
        imageUrl,
        fit: BoxFit.contain,

        color: silhouette
            ? isDark
                ? const Color(0xFF050608)
                : const Color(0xFF172D4D)
            : null,

        colorBlendMode:
            silhouette
                ? BlendMode.srcIn
                : null,

        loadingBuilder: (
          context,
          child,
          loadingProgress,
        ) {
          if (loadingProgress == null) {
            return child;
          }

          return const Center(
            child:
                CircularProgressIndicator(),
          );
        },

        errorBuilder: (
          context,
          error,
          stackTrace,
        ) {
          return const Center(
            child: Icon(
              Icons.broken_image_outlined,
              size: 80,
            ),
          );
        },
      ),
    );
  }
}