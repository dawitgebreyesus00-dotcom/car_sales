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

/// Browseable list of every expert comparison review. Shows a loading
/// placeholder while fetching, friendly error/empty states, and paginates in
/// small pages so long lists stay efficient.
class AllReviewsScreen extends StatefulWidget {
  const AllReviewsScreen({super.key});

  static const int pageSize = 5;

  @override
  State<AllReviewsScreen> createState() => _AllReviewsScreenState();
}

class _AllReviewsScreenState extends State<AllReviewsScreen> {
  late Future<List<ComparisonReview>> _future = CompareCatalogue.fetchReviews();
  int _visible = AllReviewsScreen.pageSize;

  void _reload() {
    setState(() {
      CompareCatalogue.refresh();
      _future = CompareCatalogue.fetchReviews();
      _visible = AllReviewsScreen.pageSize;
    });
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
          'All Expert Reviews',
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
            return const _ReviewsLoading();
          }
          if (snapshot.hasError) {
            return _ReviewsError(
              message: 'We couldnâ€™t load the expert reviews. Please try again.',
              onRetry: _reload,
            );
          }
          final reviews = snapshot.data ?? const <ComparisonReview>[];
          if (reviews.isEmpty) {
            return const _ReviewsEmpty();
          }
          final shown = reviews.take(_visible).toList();
          final hasMore = _visible < reviews.length;
          return ListView(
            padding: const EdgeInsets.all(AppDimens.lg),
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      reviews.length == 1
                          ? '1 review'
                          : '${reviews.length} reviews',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppDimens.md),
              for (final review in shown)
                ReviewListTile(
                  review: review,
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => ExpertReviewScreen(review: review),
                    ),
                  ),
                ),
              const SizedBox(height: AppDimens.md),
              if (hasMore)
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.teal,
                      side: const BorderSide(color: AppColors.teal),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppDimens.radiusMd),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () {
                      setState(() {
                        _visible += AllReviewsScreen.pageSize;
                      });
                    },
                    child: const Text('Load More Reviews'),
                  ),
                )
              else
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: AppDimens.sm),
                    child: Text(
                      'Youâ€™ve seen all available reviews.',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.textDisabled,
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _ReviewsLoading extends StatelessWidget {
  const _ReviewsLoading();

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

class _ReviewsError extends StatelessWidget {
  const _ReviewsError({required this.message, required this.onRetry});

  final String message;
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
              message,
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

class _ReviewsEmpty extends StatelessWidget {
  const _ReviewsEmpty();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.xxl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(AppIcons.news, size: 42, color: AppColors.textDisabled),
            const SizedBox(height: AppDimens.md),
            Text(
              'No expert reviews available yet.',
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


