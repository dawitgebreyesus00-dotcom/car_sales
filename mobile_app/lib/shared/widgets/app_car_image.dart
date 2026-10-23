import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

/// Reusable car image with error fallback.
class AppCarImage extends StatelessWidget {
  const AppCarImage({
    super.key,
    required this.asset,
    this.height,
    this.width,
    this.borderRadius,
    this.fit = BoxFit.cover,
    this.iconSize,
  });

  final String asset;
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;
  final BoxFit fit;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: SizedBox(
        height: height,
        width: width,
        child: Image.asset(
          'assets/images/$asset',
          fit: fit,
          errorBuilder: (context, error, stackTrace) => Container(
            color: AppColors.divider,
            child: Center(
              child: Icon(
                Icons.image_not_supported_outlined,
                color: AppColors.textDisabled,
                size: iconSize ?? 32,
              ),
            ),
          ),
        ),
      ),
    );
  }
}