import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';

/// Friendly empty state used when a filter or search has no results.
class NewsEmptyState extends StatelessWidget {
  const NewsEmptyState({
    super.key,
    this.icon = Icons.article_outlined,
    this.message = 'No news available',
  });

  final IconData icon;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.xxl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 88,
              height: 88,
              decoration: const BoxDecoration(
                color: Color(0xFFEDF1F8),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 42, color: AppColors.textDisabled),
            ),
            const SizedBox(height: AppDimens.lg),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

