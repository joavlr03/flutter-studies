import 'package:flutter/material.dart';

class ScoreCard extends StatelessWidget {
  final String title;
  final int value;
  final IconData icon;
  final Color color;
  final Color backgroundColor;

  const ScoreCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius:
            BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 18,
            color: color,
          ),

          const SizedBox(width: 6),

          Flexible(
            child: Text(
              title,
              overflow:
                  TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context)
                    .colorScheme
                    .onSurfaceVariant,
              ),
            ),
          ),

          const SizedBox(width: 6),

          Text(
            '$value',
            style: TextStyle(
              fontSize: 17,
              fontWeight:
                  FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}