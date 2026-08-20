import 'package:flutter/material.dart';

class PokemonNumber extends StatelessWidget {
  final int id;

  const PokemonNumber({
    super.key,
    required this.id,
  });

  String get formattedId {
    return '#${id.toString().padLeft(3, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context)
            .colorScheme
            .surfaceContainerHighest,
        borderRadius:
            BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize:
            MainAxisSize.min,
        children: [
          const Icon(
            Icons.flag_outlined,
            size: 18,
          ),

          const SizedBox(width: 6),

          const Text(
            'Número: ',
          ),

          Text(
            formattedId,
            style: TextStyle(
              color: Theme.of(context)
                  .colorScheme
                  .primary,
              fontWeight:
                  FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}