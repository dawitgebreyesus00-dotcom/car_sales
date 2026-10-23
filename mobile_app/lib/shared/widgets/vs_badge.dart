import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

/// "VS" badge used between two car images in comparison views.
class VsBadge extends StatelessWidget {
  const VsBadge({super.key, this.size = 32});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.teal,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          'VS',
          style: TextStyle(
            color: Colors.white,
            fontSize: size * 0.35,
            fontWeight: FontWeight.w700,
            height: 1,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}