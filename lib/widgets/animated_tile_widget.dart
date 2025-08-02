import 'package:flutter/material.dart';

class AnimatedTileWidget extends StatelessWidget {
  final String symbol;
  final VoidCallback onTap;
  final bool isActive;
  final bool isCurrentPlayer;

  const AnimatedTileWidget({
    super.key,
    required this.symbol,
    required this.onTap,
    this.isActive = false,
    this.isCurrentPlayer = false,
  });

  @override
  Widget build(BuildContext context) {
    Color glowColor = isCurrentPlayer
        ? (symbol == 'X' ? Colors.blueAccent : Colors.redAccent)
        : Colors.transparent;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(16),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: glowColor.withOpacity(0.6),
                    blurRadius: 20,
                    spreadRadius: 3,
                  ),
                ]
              : [],
        ),
        child: Center(
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 300),
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: symbol == 'X' ? Colors.blueAccent : Colors.redAccent,
              shadows: isActive
                  ? [Shadow(color: glowColor, blurRadius: 20)]
                  : [],
            ),
            child: Text(symbol),
          ),
        ),
      ),
    );
  }
}
