import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../filter_results/filter_results.dart';
import '../../../../shared/widgets/app_car_image.dart';

/// Frontend-only car details screen shown for car-type notifications.
/// Displays the selected listing from the shared [allCars] catalogue.

class CarDetailsScreen extends StatelessWidget {
  const CarDetailsScreen({super.key, required this.car});

  final Car car;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          car.name,
          style: const TextStyle(fontWeight: FontWeight.w400),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(bottom: AppDimens.xxl),
        children: [
          AppCarImage(asset: car.image, height: 230),
          Padding(
            padding: const EdgeInsets.all(AppDimens.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  car.name,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: AppDimens.xs),
                Text(
                  car.priceText,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.teal,
                  ),
                ),
                const SizedBox(height: AppDimens.md),
                Wrap(
                  spacing: AppDimens.sm,
                  runSpacing: AppDimens.sm,
                  children: [
                    _SpecChip(
                      icon: Icons.calendar_today_outlined,
                      label: car.year ?? '—',
                    ),
                    _SpecChip(
                      icon: Icons.directions_car_outlined,
                      label: car.body,
                    ),
                    _SpecChip(
                      icon: Icons.local_gas_station_outlined,
                      label: car.fuel,
                    ),
                    _SpecChip(
                      icon: car.transmission == 'Automatic'
                          ? Icons.settings_suggest_outlined
                          : Icons.settings_outlined,
                      label: car.transmission,
                    ),
                    _SpecChip(icon: Icons.speed_outlined, label: car.km),
                  ],
                ),
                const SizedBox(height: AppDimens.lg),
                const Divider(color: AppColors.divider),
                const SizedBox(height: AppDimens.md),
                Text(
                  'About this vehicle',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: AppDimens.sm),
                Text(
                  'A clean, well-maintained ${car.brand} listed near Addis '
                  'Ababa. Comes with verified documents and a fresh '
                  'inspection. Contact the dealer to arrange a viewing '
                  'and a test drive.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textPrimary,
                    height: 1.55,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: AppDimens.xl),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppDimens.radiusMd),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Dealer contact is coming soon'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                    child: const Text('Contact Dealer'),
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

class _SpecChip extends StatelessWidget {
  const _SpecChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: AppColors.divider),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 15, color: AppColors.textSecondary),
          const SizedBox(width: 6),
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}