import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../navigation/app_routes.dart';
import '../../../../shared/widgets/app_car_image.dart';
import '../../../../shared/widgets/tab_page_shell.dart';
import '../../../../shared/widgets/vs_badge.dart';
import '../../../../shared/common/filter_results/filter_results.dart';
import 'compare_catalogue/compare_catalogue.dart';
import 'compare_catalogue/all_reviews_screen.dart';
import 'compare_catalogue/expert_review_screen.dart';
import 'compare_catalogue/saved_reviews_screen.dart';
import 'compare_details/compare_details.dart';
import 'select_car/select_car.dart';

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

/// Compare Cars tab: pick up to two cars from the shared catalogue, run a
/// side-by-side comparison, and browse popular comparisons plus expert
/// comparison articles below. Keeps the app-wide header and bottom navigation.
class CompareScreen extends StatelessWidget {
  const CompareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TabPageShell(
      title: 'Compare Cars',
      trailing: [
        _CompareTopAction(
          icon: AppIcons.search,
          tooltip: 'Search',
          onTap: () => Navigator.of(context).pushNamed(AppRoutes.searchCars),
        ),
        const SizedBox(width: AppDimens.sm),
        _CompareTopAction(
          icon: AppIcons.bookmarkBorder,
          tooltip: 'Saved reviews',
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute<void>(builder: (_) => const SavedReviewsScreen()),
          ),
        ),
      ],
      child: const _CompareBody(),
    );
  }
}

/// Outline-style icon chip used in the Compare page top bar.
class _CompareTopAction extends StatelessWidget {
  const _CompareTopAction({
    required this.icon,
    required this.tooltip,
    required this.onTap,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimens.radiusMd),
        child: Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppDimens.radiusMd),
            border: Border.all(color: AppColors.divider),
          ),
          child: Icon(icon, size: 21, color: AppColors.textSecondary),
        ),
      ),
    );
  }
}

class _CompareBody extends StatefulWidget {
  const _CompareBody();

  @override
  State<_CompareBody> createState() => _CompareBodyState();
}

class _CompareBodyState extends State<_CompareBody> {
  /// Number of popular comparison cards shown before "More Comparisons".
  static const int _initialPairs = 2;

  Car? _carA;
  Car? _carB;
  int _visiblePairs = _initialPairs;

  late Future<List<({Car a, Car b})>> _pairsFuture =
      CompareCatalogue.fetchPopularPairs();
  late Future<List<ComparisonReview>> _reviewsFuture =
      CompareCatalogue.fetchReviews();

  void _retry() {
    setState(() {
      CompareCatalogue.refresh();
      _pairsFuture = CompareCatalogue.fetchPopularPairs();
      _reviewsFuture = CompareCatalogue.fetchReviews();
    });
  }

  Future<void> _pick(ValueChanged<Car> onPicked) async {
    final car = await Navigator.of(
      context,
    ).push<Car>(MaterialPageRoute(builder: (_) => const SelectCarScreen()));
    if (car != null) onPicked(car);
  }

  void _addCar() {
    if (_carA == null) {
      _pick((car) => setState(() => _carA = car));
    } else if (_carB == null) {
      _pick((car) => setState(() => _carB = car));
    }
  }

  void _openCompare(Car a, Car b) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => CompareDetailsScreen(carA: a, carB: b),
      ),
    );
  }

  void _openReview(ComparisonReview review) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => ExpertReviewScreen(review: review),
      ),
    );
  }

  void _openAllReviews() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute<void>(builder: (_) => const AllReviewsScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final canCompare = _carA != null && _carB != null;

    return ListView(
      padding: const EdgeInsets.only(top: AppDimens.md, bottom: AppDimens.xl),
      physics: const BouncingScrollPhysics(),
      children: [
        // ---- Compare car selector -----------------------------------------
        Stack(
          alignment: Alignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _CarSelectorPanel(
                    car: _carA,
                    onTap: () => _pick((car) => setState(() => _carA = car)),
                    onRemove: () => setState(() => _carA = null),
                  ),
                ),
                Expanded(
                  child: _CarSelectorPanel(
                    car: _carB,
                    onTap: () => _pick((car) => setState(() => _carB = car)),
                    onRemove: () => setState(() => _carB = null),
                  ),
                ),
              ],
            ),
            const VsBadge(),
          ],
        ),
        const SizedBox(height: AppDimens.lg),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.teal,
                  side: const BorderSide(color: AppColors.teal),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppDimens.radiusMd),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: _addCar,
                child: const Text('+ Add Car'),
              ),
            ),
            const SizedBox(width: AppDimens.md),
            Expanded(
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppDimens.radiusMd),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: canCompare
                    ? () => _openCompare(_carA!, _carB!)
                    : null,
                child: const Text('Compare'),
              ),
            ),
          ],
        ),

        // ---- Popular car comparisons ---------------------------------------
        const SizedBox(height: AppDimens.xl),
        Text(
          'POPULAR CAR COMPARISONS',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: AppDimens.md),
        FutureBuilder<List<({Car a, Car b})>>(
          future: _pairsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const _PopularPairsLoading();
            }
            if (snapshot.hasError) {
              return _InlineNotice(
                icon: Icons.error_outline,
                message:
                    'We couldnâ€™t load popular comparisons. Please try again.',
                onRetry: _retry,
              );
            }
            final data = snapshot.data ?? const <({Car a, Car b})>[];
            if (data.isEmpty) {
              return const _InlineNotice(
                icon: Icons.info_outline,
                message: 'No comparisons available yet.',
              );
            }
            final shown = data.take(_visiblePairs).toList();
            final hasMore = _visiblePairs < data.length;
            final canShowLess = _visiblePairs > _initialPairs;
            return Column(
              children: [
                for (final pair in shown)
                  _PopularCompareCard(
                    pair: pair,
                    onTap: () => _openCompare(pair.a, pair.b),
                  ),
                if (hasMore || canShowLess) ...[
                  const SizedBox(height: AppDimens.md),
                  Row(
                    children: [
                      if (canShowLess)
                        Expanded(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.teal,
                              side: const BorderSide(color: AppColors.teal),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  AppDimens.radiusMd,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            onPressed: () {
                              setState(() {
                                _visiblePairs = _initialPairs;
                              });
                            },
                            child: const Text('Less Comparisons'),
                          ),
                        ),
                      if (canShowLess && hasMore)
                        const SizedBox(width: AppDimens.md),
                      if (hasMore)
                        Expanded(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.teal,
                              side: const BorderSide(color: AppColors.teal),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  AppDimens.radiusMd,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            onPressed: () {
                              setState(() {
                                _visiblePairs += 2;
                              });
                            },
                            child: const Text('More Comparisons'),
                          ),
                        ),
                    ],
                  ),
                ],
              ],
            );
          },
        ),

        // ---- Comparison tests (expert reviews) ------------------------------
        const SizedBox(height: AppDimens.xl),
        Text(
          'COMPARISON TESTS',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: AppDimens.md),
        FutureBuilder<List<ComparisonReview>>(
          future: _reviewsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const _ReviewsLoadingCards();
            }
            if (snapshot.hasError) {
              return _InlineNotice(
                icon: Icons.error_outline,
                message:
                    'We couldnâ€™t load the comparison tests. Please try again.',
                onRetry: _retry,
              );
            }
            final reviews = snapshot.data ?? const <ComparisonReview>[];
            if (reviews.isEmpty) {
              return const _InlineNotice(
                icon: Icons.info_outline,
                message: 'No expert reviews available yet.',
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 312,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      for (final review in reviews)
                        _ReviewCard(
                          review: review,
                          onTap: () => _openReview(review),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: AppDimens.md),
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
                    onPressed: _openAllReviews,
                    child: const Text('Read all expert reviews'),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

/// One side of the compare selector: placeholder while empty, selected car
/// details (image, make, model, year, price) with a remove control when set.
class _CarSelectorPanel extends StatelessWidget {
  const _CarSelectorPanel({
    required this.car,
    required this.onTap,
    required this.onRemove,
  });

  final Car? car;
  final VoidCallback onTap;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final selected = car;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDimens.radiusLg),
      child: Container(
        height: 280,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppDimens.radiusLg),
          border: Border.all(color: AppColors.divider),
        ),
        clipBehavior: Clip.antiAlias,
        child: selected == null
            ? _EmptyPanel(onTap: onTap)
            : _SelectedPanel(car: selected, onRemove: onRemove),
      ),
    );
  }
}

class _EmptyPanel extends StatelessWidget {
  const _EmptyPanel({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 92,
          height: 92,
          decoration: BoxDecoration(
            color: const Color(0xFFEAF4F3),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.directions_car_filled,
            size: 46,
            color: AppColors.teal,
          ),
        ),
        const SizedBox(height: AppDimens.md),
        Text(
          'Select Car',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}

class _SelectedPanel extends StatelessWidget {
  const _SelectedPanel({required this.car, required this.onRemove});

  final Car car;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppCarImage(asset: car.image, height: 160),
            Padding(
              padding: const EdgeInsets.all(AppDimens.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    car.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    car.year ?? '-',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    car.priceText,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.teal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 6,
          right: 6,
          child: Material(
            color: AppColors.surface,
            shape: const CircleBorder(),
            elevation: 1,
            child: InkWell(
              onTap: onRemove,
              customBorder: const CircleBorder(),
              child: const Padding(
                padding: EdgeInsets.all(6),
                child: Icon(
                  Icons.close,
                  size: 18,
                  color: AppColors.textSecondary,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Clickable card for a popular comparison pair: both images with the VS badge
/// centred on the seam, then names and ETB prices.
class _PopularCompareCard extends StatelessWidget {
  const _PopularCompareCard({required this.pair, required this.onTap});

  final ({Car a, Car b}) pair;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final a = pair.a;
    final b = pair.b;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDimens.radiusLg),
      child: Container(
        margin: const EdgeInsets.only(bottom: AppDimens.sm),
        padding: const EdgeInsets.all(AppDimens.md),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppDimens.radiusLg),
          border: Border.all(color: AppColors.divider),
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: AppCarImage(
                        asset: a.image,
                        height: 96,
                        borderRadius: BorderRadius.circular(AppDimens.radiusMd),
                        iconSize: 24,
                      ),
                    ),
                    Expanded(
                      child: AppCarImage(
                        asset: b.image,
                        height: 96,
                        borderRadius: BorderRadius.circular(AppDimens.radiusMd),
                        iconSize: 24,
                      ),
                    ),
                  ],
                ),
                const VsBadge(),
              ],
            ),
            const SizedBox(height: AppDimens.md),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '${a.brand} ${a.modelName}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                const SizedBox(width: AppDimens.md),
                Expanded(
                  child: Text(
                    '${b.brand} ${b.modelName}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppDimens.xs),
            Row(
              children: [
                Expanded(
                  child: Text(
                    a.priceText,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.teal,
                    ),
                  ),
                ),
                const SizedBox(width: AppDimens.md),
                Expanded(
                  child: Text(
                    b.priceText,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.teal,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Grey placeholder cards shown while popular comparisons are loading.
class _PopularPairsLoading extends StatelessWidget {
  const _PopularPairsLoading();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SkeletonBlock(height: 210),
        SizedBox(height: AppDimens.sm),
        SkeletonBlock(height: 210),
        SizedBox(height: AppDimens.sm),
        SkeletonBlock(height: 210),
      ],
    );
  }
}

/// Grey placeholder cards shown while expert reviews are loading.
class _ReviewsLoadingCards extends StatelessWidget {
  const _ReviewsLoadingCards();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 312,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          SkeletonBlock(width: 272, height: 300),
          SizedBox(width: AppDimens.sm),
          SkeletonBlock(width: 272, height: 300),
          SizedBox(width: AppDimens.sm),
          SkeletonBlock(width: 272, height: 300),
        ],
      ),
    );
  }
}

/// Simple inline loading note (static â€” never animates, safe for tests).
class _InlineNotice extends StatelessWidget {
  const _InlineNotice({
    required this.icon,
    required this.message,
    this.onRetry,
  });

  final IconData icon;
  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimens.lg),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimens.radiusMd),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        children: [
          Icon(icon, size: 28, color: AppColors.textDisabled),
          const SizedBox(height: AppDimens.sm),
          Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary),
          ),
          if (onRetry != null) ...[
            const SizedBox(height: AppDimens.md),
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
        ],
      ),
    );
  }
}

/// Horizontally scrollable expert-review article card: cover image, title,
/// author + date, short description and a "Read More" action.
class _ReviewCard extends StatefulWidget {
  const _ReviewCard({required this.review, required this.onTap});

  final ComparisonReview review;
  final VoidCallback onTap;

  @override
  State<_ReviewCard> createState() => _ReviewCardState();
}

class _ReviewCardState extends State<_ReviewCard> {
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

  @override
  Widget build(BuildContext context) {
    final review = widget.review;
    return Padding(
      padding: const EdgeInsets.only(right: AppDimens.sm),
      child: SizedBox(
        width: 272,
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(AppDimens.radiusLg),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppDimens.radiusLg),
              border: Border.all(color: AppColors.divider),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: AppCarImage(
                            asset: review.carA.image,
                            height: 132,
                          ),
                        ),
                        Expanded(
                          child: AppCarImage(
                            asset: review.carB.image,
                            height: 132,
                          ),
                        ),
                      ],
                    ),
                    const VsBadge(),
                    Positioned(
                      top: 6,
                      right: 6,
                      child: Material(
                        color: AppColors.surface,
                        shape: const CircleBorder(),
                        elevation: 1,
                        child: InkWell(
                          onTap: _toggleBookmark,
                          customBorder: const CircleBorder(),
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: Icon(
                              _saved
                                  ? AppIcons.bookmark
                                  : AppIcons.bookmarkBorder,
                              size: 18,
                              color: _saved
                                  ? AppColors.teal
                                  : AppColors.textSecondary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(AppDimens.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        review.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.textPrimary,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: AppDimens.sm),
                      Row(
                        children: [
                          const Icon(
                            AppIcons.person,
                            size: 14,
                            color: AppColors.textSecondary,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              '${review.author}  â€¢  ${review.date}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(color: AppColors.textSecondary),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppDimens.sm),
                      Text(
                        review.summary,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: AppDimens.sm),
                      Text(
                        'Read More',
                        style: Theme.of(context).textTheme.labelMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.teal,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}






