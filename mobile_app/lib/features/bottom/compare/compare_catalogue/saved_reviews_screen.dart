import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_icons.dart';
import 'compare_catalogue.dart';
import 'expert_review_screen.dart';
import 'review_list_tile.dart';

/// Skeleton placeholder block for loading states.
class SkeletonBlock extends StatelessWidget {
  const SkeletonBlock({super.key, this.width, this.height});

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.divider,
        borderRadius: BorderRadius.circular(AppDimens.radiusMd),
      ),
    );
  }
}

/// Lists the expert reviews the user has bookmarked during this session.
/// Bookmarks are kept in memory (see [CompareCatalogue]) because the app does
/// not have a persisted favourite store yet.
class SavedReviewsScreen extends StatefulWidget {
  const SavedReviewsScreen({super.key});

  @override
  State<SavedReviewsScreen> createState() => _SavedReviewsScreenState();
}

class _SavedReviewsScreenState extends State<SavedReviewsScreen> {
  late Future<List<ComparisonReview>> _future = CompareCatalogue.fetchReviews();

  void _reload() {
    setState(() {
      CompareCatalogue.refresh();
      _future = CompareCatalogue.fetchReviews();
    });
  }

  Future<void> _openReview(ComparisonReview review) async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => ExpertReviewScreen(review: review),
      ),
    );
    // Bookmarks may have changed while viewing the review.
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
          'Saved Reviews',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.textPrimary,
          ),
        ),
      ),
      body: FutureBuilder<List<ComparisonReview>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const _SavedReviewsLoading();
          }
          if (snapshot.hasError) {
            return _SavedReviewsError(onRetry: _reload);
          }
          final all = snapshot.data ?? const <ComparisonReview>[];
          final saved = all
              .where((r) => CompareCatalogue.isSaved(r.id))
              .toList();
          if (saved.isEmpty) {
            return const _SavedReviewsEmpty();
          }
          return ListView(
            padding: const EdgeInsets.all(AppDimens.lg),
            children: [
              Text(
                saved.length == 1
                    ? '1 saved review'
                    : '${saved.length} saved reviews',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: AppDimens.md),
              for (final review in saved)
                ReviewListTile(
                  review: review,
                  onTap: () => _openReview(review),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _SavedReviewsLoading extends StatelessWidget {
  const _SavedReviewsLoading();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppDimens.lg),
      children: const [
        SkeletonBlock(height: 96),
        SizedBox(height: AppDimens.md),
        SkeletonBlock(height: 96),
        SizedBox(height: AppDimens.md),
        SkeletonBlock(height: 96),
      ],
    );
  }
}

class _SavedReviewsError extends StatelessWidget {
  const _SavedReviewsError({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.xxl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error_outline,
              size: 42,
              color: AppColors.textDisabled,
            ),
            const SizedBox(height: AppDimens.md),
            Text(
              'We couldnâ€™t load your saved reviews. Please try again.',
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary),
            ),
            const SizedBox(height: AppDimens.lg),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.teal,
                side: const BorderSide(color: AppColors.teal),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDimens.radiusMd),
                ),
              ),
              onPressed: onRetry,
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}

class _SavedReviewsEmpty extends StatelessWidget {
  const _SavedReviewsEmpty();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.xxl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              AppIcons.bookmarkBorder,
              size: 42,
              color: AppColors.textDisabled,
            ),
            const SizedBox(height: AppDimens.md),
            Text(
              'No saved reviews yet.\nTap the bookmark on a review to save it here.',
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary),
            ),
          ],
        ),
      ),
    );
  }
}


