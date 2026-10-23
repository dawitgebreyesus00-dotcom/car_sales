import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';

/// Article-shaped skeleton cards shown while news content loads. Static on
/// purpose (no looping animation) so widget tests can settle deterministically.
class NewsSkeletonCards extends StatelessWidget {
  const NewsSkeletonCards({super.key, this.count = 3});

  final int count;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: AppDimens.sm),
      children: [for (var i = 0; i < count; i++) const _SkeletonCard()],
    );
  }
}

class _SkeletonCard extends StatelessWidget {
  const _SkeletonCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(
        AppDimens.lg,
        AppDimens.sm,
        AppDimens.lg,
        AppDimens.sm,
      ),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimens.radiusLg),
        border: Border.all(color: AppColors.divider),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: ColoredBox(color: Color(0xFFEEF1F4)),
          ),
          Padding(
            padding: EdgeInsets.all(AppDimens.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Bar(width: 88, height: 12),
                SizedBox(height: AppDimens.sm),
                _Bar(width: double.infinity, height: 16),
                SizedBox(height: AppDimens.xs),
                _Bar(width: 220, height: 16),
                SizedBox(height: AppDimens.lg),
                _Bar(width: 140, height: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Bar extends StatelessWidget {
  const _Bar({required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFFEEF1F4),
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}

