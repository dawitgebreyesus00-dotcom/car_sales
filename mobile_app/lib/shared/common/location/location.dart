import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_icons.dart';

/// Independent location picker opened from the top-bar Location icon.
///
/// Purely a city selector — completely separate from Search. It never runs a
/// location search and never requests device location.
class CarLocationScreen extends StatefulWidget {
  const CarLocationScreen({super.key});

  @override
  State<CarLocationScreen> createState() => _CarLocationScreenState();
}

class _CarLocationScreenState extends State<CarLocationScreen> {
  String _selected = 'Addis Ababa';

  static const List<String> _cities = [
    'Addis Ababa',
    'Dire Dawa',
    'Mekelle',
    'Bahir Dar',
    'Hawassa',
    'Jimma',
    'Adama',
    'Gondar',
    'Harar',
    'Dessie',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text(
          'Choose Your Location',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.textPrimary,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppDimens.lg),
        children: [
          Text(
            'Popular Cities in Ethiopia',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w400,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppDimens.md),
          for (final city in _cities)
            _CityTile(
              city: city,
              isSelected: city == _selected,
              onTap: () => setState(() => _selected = city),
            ),
        ],
      ),
    );
  }
}

class _CityTile extends StatelessWidget {
  const _CityTile({
    required this.city,
    required this.isSelected,
    required this.onTap,
  });

  final String city;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDimens.radiusMd),
      child: Container(
        margin: const EdgeInsets.only(bottom: AppDimens.sm),
        padding: const EdgeInsets.all(AppDimens.md),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppDimens.radiusMd),
          border: Border.all(
            color: isSelected ? AppColors.teal : AppColors.divider,
          ),
        ),
        child: Row(
          children: [
            Icon(
              AppIcons.location,
              size: 20,
              color: isSelected ? AppColors.teal : AppColors.textSecondary,
            ),
            const SizedBox(width: AppDimens.md),
            Expanded(
              child: Text(
                city,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            Icon(
              isSelected ? Icons.check_circle : Icons.circle_outlined,
              size: 20,
              color: isSelected ? AppColors.teal : AppColors.textDisabled,
            ),
          ],
        ),
      ),
    );
  }
}