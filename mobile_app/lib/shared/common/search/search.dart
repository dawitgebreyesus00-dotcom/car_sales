import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_icons.dart';

/// Full-screen car search opened from the top-bar Search icon.
///
/// Plain search only: no location detection, no location bar, no location
/// permission prompt. Results are filtered client-side from the popular cars
/// catalogue by the entered keyword.
class CarSearchScreen extends StatefulWidget {
  const CarSearchScreen({super.key});

  @override
  State<CarSearchScreen> createState() => _CarSearchScreenState();
}

class _CarSearchScreenState extends State<CarSearchScreen> {
  final TextEditingController _controller = TextEditingController();
  String _query = '';

  static const List<String> _trending = [
    'Toyota Vitz',
    'Suzuki Swift',
    'Hyundai Tucson',
    'Kia Sportage',
    'Honda City',
    'Toyota Land Cruiser',
  ];

  static const List<(String, String)> _popularCars = [
    ('Toyota Vitz', '1,200,000 ETB'),
    ('Suzuki Swift', '1,500,000 ETB'),
    ('Hyundai Tucson', '3,800,000 ETB'),
    ('Kia Sportage', '4,200,000 ETB'),
    ('Honda City', '2,900,000 ETB'),
    ('Toyota Land Cruiser', '12,000,000 ETB'),
  ];

  List<(String, String)> get _results {
    if (_query.trim().isEmpty) return _popularCars;
    final q = _query.trim().toLowerCase();
    return _popularCars.where((c) => c.$1.toLowerCase().contains(q)).toList();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        titleSpacing: 0,
        title: Container(
          height: 44,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppDimens.radiusMd),
            border: Border.all(color: AppColors.divider),
          ),
          child: TextField(
            controller: _controller,
            autofocus: true,
            textAlignVertical: TextAlignVertical.center,
            onChanged: (value) => setState(() => _query = value),
            decoration: InputDecoration(
              hintText: 'Search for your car e.g. Vitz',
              hintStyle: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary),
              prefixIcon: const Icon(
                AppIcons.search,
                size: 22,
                color: AppColors.textSecondary,
              ),
              suffixIcon: _query.isEmpty
                  ? null
                  : IconButton(
                      icon: const Icon(
                        Icons.close,
                        size: 20,
                        color: AppColors.textSecondary,
                      ),
                      onPressed: () {
                        _controller.clear();
                        setState(() => _query = '');
                      },
                    ),
              filled: false,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppDimens.lg),
        children: [
          if (_query.trim().isEmpty) ...[
            Text(
              'Trending Searches',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: AppDimens.md),
            Wrap(
              spacing: AppDimens.sm,
              runSpacing: AppDimens.sm,
              children: [
                for (final term in _trending)
                  ActionChip(
                    label: Text(term),
                    labelStyle: Theme.of(context).textTheme.labelMedium
                        ?.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26),
                      side: const BorderSide(color: AppColors.divider),
                    ),
                    backgroundColor: AppColors.surface,
                    onPressed: () {
                      _controller.text = term;
                      setState(() => _query = term);
                    },
                  ),
              ],
            ),
            const SizedBox(height: AppDimens.xl),
          ],
          Text(
            _query.trim().isEmpty ? 'Popular Cars' : 'Results',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w400,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppDimens.md),
          if (_results.isEmpty)
            Padding(
              padding: const EdgeInsets.only(top: AppDimens.xxl),
              child: Center(
                child: Text(
                  'No cars found',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            )
          else
            for (final (name, price) in _results)
              _SearchResultCard(name: name, price: price),
        ],
      ),
    );
  }
}

class _SearchResultCard extends StatelessWidget {
  const _SearchResultCard({required this.name, required this.price});

  final String name;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppDimens.sm),
      padding: const EdgeInsets.all(AppDimens.lg),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimens.radiusLg),
        border: Border.all(color: AppColors.divider),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(AppDimens.radiusMd),
            ),
            child: const Icon(
              AppIcons.carListing,
              size: 26,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(width: AppDimens.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '$price · Addis Ababa',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.chevron_right,
            size: 20,
            color: AppColors.textSecondary,
          ),
        ],
      ),
    );
  }
}