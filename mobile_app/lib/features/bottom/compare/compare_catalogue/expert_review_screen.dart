import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../shared/widgets/app_car_image.dart';
import '../../../../shared/widgets/vs_badge.dart';
import '../compare_details/compare_details.dart';
import '../../../../shared/common/filter_results/filter_results.dart';
import 'compare_catalogue.dart';

/// Full expert comparison/review article opened from "Read More" on a
/// [ComparisonReview]. Shows title, cover image, author, date, the complete
/// article body, a fact-only "at a glance" specs table and quick actions
/// (bookmark / share / jump to the detailed comparison).
class ExpertReviewScreen extends StatefulWidget {
  const ExpertReviewScreen({super.key, required this.review});

  final ComparisonReview review;

  @override
  State<ExpertReviewScreen> createState() => _ExpertReviewScreenState();
}

class _ExpertReviewScreenState extends State<ExpertReviewScreen> {
  late bool _saved = CompareCatalogue.isSaved(widget.review.id);

  void _toggleBookmark() {
    setState(() {
      _saved = CompareCatalogue.toggleSaved(widget.review.id);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _saved
              ? 'Review saved to your bookmarks'
              : 'Review removed from bookmarks',
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  void _share() {
    final text = CompareCatalogue.buildComparisonShareText(
      widget.review.carA,
      widget.review.carB,
    );
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Comparison copied to clipboard â€” share it anywhere'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _openFullComparison() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => CompareDetailsScreen(
          carA: widget.review.carA,
          carB: widget.review.carB,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final review = widget.review;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Back',
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Expert Review',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.textPrimary,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              _saved ? AppIcons.bookmark : AppIcons.bookmarkBorder,
              color: _saved ? AppColors.teal : AppColors.textSecondary,
            ),
            tooltip: _saved ? 'Remove from bookmarks' : 'Save review',
            onPressed: _toggleBookmark,
          ),
          IconButton(
            icon: const Icon(AppIcons.share, color: AppColors.textSecondary),
            tooltip: 'Share comparison',
            onPressed: _share,
          ),
          const SizedBox(width: AppDimens.sm),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppDimens.lg),
        children: [
          Text(
            review.title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w400,
              height: 1.25,
            ),
          ),
          const SizedBox(height: AppDimens.md),
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: AppColors.teal.withValues(alpha: 0.12),
                child: const Icon(
                  AppIcons.person,
                  size: 20,
                  color: AppColors.teal,
                ),
              ),
              const SizedBox(width: AppDimens.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.author,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      review.date,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimens.md),
          ClipRRect(
            borderRadius: BorderRadius.circular(AppDimens.radiusLg),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: AppCarImage(asset: review.carA.image, height: 190),
                    ),
                    Expanded(
                      child: AppCarImage(asset: review.carB.image, height: 190),
                    ),
                  ],
                ),
                const VsBadge(),
              ],
            ),
          ),
          const SizedBox(height: AppDimens.xl),
          Text(
            'OVERVIEW',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.w400,
              color: AppColors.textSecondary,
              letterSpacing: 1.1,
            ),
          ),
          const SizedBox(height: AppDimens.sm),
          Text(
            review.summary,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.textPrimary,
              height: 1.5,
            ),
          ),
          const SizedBox(height: AppDimens.xl),
          Text(
            'AT A GLANCE',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.w400,
              color: AppColors.textSecondary,
              letterSpacing: 1.1,
            ),
          ),
          const SizedBox(height: AppDimens.sm),
          _ReviewSpecTable(carA: review.carA, carB: review.carB),
          const SizedBox(height: AppDimens.xl),
          Text(
            'DETAILED REVIEW',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.w400,
              color: AppColors.textSecondary,
              letterSpacing: 1.1,
            ),
          ),
          const SizedBox(height: AppDimens.sm),
          for (final paragraph in review.paragraphs) ...[
            Text(
              paragraph,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textPrimary,
                height: 1.55,
              ),
            ),
            const SizedBox(height: AppDimens.md),
          ],
          const SizedBox(height: AppDimens.sm),
          FilledButton.icon(
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDimens.radiusMd),
              ),
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            onPressed: _openFullComparison,
            icon: const Icon(AppIcons.compare, size: 20),
            label: const Text('View Full Comparison'),
          ),
        ],
      ),
    );
  }
}

/// Two-column table of the real catalogue fields for both reviewed cars.
/// Anything missing from the database renders "N/A", never invented data.
class _ReviewSpecTable extends StatelessWidget {
  const _ReviewSpecTable({required this.carA, required this.carB});

  final Car carA;
  final Car carB;

  @override
  Widget build(BuildContext context) {
    String value(String? v) => (v == null || v.trim().isEmpty) ? 'N/A' : v;

    final rows = [
      ('Price', carA.priceText, carB.priceText),
      ('Year', value(carA.year), value(carB.year)),
      ('Mileage', carA.km, carB.km),
      ('Fuel', carA.fuel, carB.fuel),
      ('Transmission', carA.transmission, carB.transmission),
      ('Body', carA.body, carB.body),
    ];

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimens.radiusMd),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppDimens.md),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    carA.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                const SizedBox(width: AppDimens.md),
                Expanded(
                  child: Text(
                    carB.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: AppColors.divider),
          for (final (label, a, b) in rows)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.md,
                vertical: 8,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 104,
                    child: Text(
                      label,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      a,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppDimens.md),
                  Expanded(
                    child: Text(
                      b,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}






