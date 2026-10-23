import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../shared/widgets/vs_badge.dart';
import '../compare_catalogue/compare_catalogue.dart';
import '../../../../shared/common/filter_results/filter_results.dart';

/// Detailed side-by-side comparison of two cars from the shared catalogue.
///
/// Only data present in the [Car] model is shown; every other specification
/// row renders "N/A" so nothing is ever invented.
class CompareDetailsScreen extends StatefulWidget {
  const CompareDetailsScreen({
    super.key,
    required this.carA,
    required this.carB,
  });

  final Car carA;
  final Car carB;

  @override
  State<CompareDetailsScreen> createState() => _CompareDetailsScreenState();
}

class _CompareDetailsScreenState extends State<CompareDetailsScreen> {
  late Car _carA;
  late Car _carB;

  @override
  void initState() {
    super.initState();
    _carA = widget.carA;
    _carB = widget.carB;
  }

  void _swap() {
    setState(() {
      final temp = _carA;
      _carA = _carB;
      _carB = temp;
    });
  }

  void _share() {
    final text = CompareCatalogue.buildComparisonShareText(_carA, _carB);
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Comparison copied to clipboard â€” share it anywhere'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _reset() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final rows = _buildRows();
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: _reset,
        ),
        title: Text(
          'Compare',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.textPrimary,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(AppIcons.share, color: AppColors.textSecondary),
            tooltip: 'Share comparison',
            onPressed: _share,
          ),
          const SizedBox(width: AppDimens.sm),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppDimens.md),
        children: [
          Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _ComparisonHeader(car: _carA, label: 'Car 1'),
                  ),
                  Expanded(
                    child: _ComparisonHeader(car: _carB, label: 'Car 2'),
                  ),
                ],
              ),
              const Center(child: VsBadge(size: 40)),
            ],
          ),
          const SizedBox(height: AppDimens.md),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.teal,
                    side: const BorderSide(color: AppColors.teal),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppDimens.radiusMd),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: _swap,
                  icon: const Icon(Icons.swap_horiz, size: 20),
                  label: const Text('Swap Cars'),
                ),
              ),
              const SizedBox(width: AppDimens.md),
              Expanded(
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.textSecondary,
                    side: const BorderSide(color: AppColors.divider),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppDimens.radiusMd),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: _reset,
                  icon: const Icon(Icons.refresh, size: 20),
                  label: const Text('Reset'),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimens.md),
          for (final section in rows) _ComparisonSection(section: section),
        ],
      ),
    );
  }

  List<({String title, List<(String, String, String)> rows})> _buildRows() {
    String na(String? value) =>
        (value == null || value.trim().isEmpty) ? 'N/A' : value;

    return [
      (
        title: 'Basic Information',
        rows: [
          ('Price', _carA.priceText, _carB.priceText),
          ('Year', na(_carA.year), na(_carB.year)),
          ('Condition', 'Used', 'Used'),
          ('Mileage', na(_carA.km), na(_carB.km)),
        ],
      ),
      (
        title: 'Engine & Performance',
        rows: [
          ('Engine size', 'N/A', 'N/A'),
          ('Engine type', 'N/A', 'N/A'),
          ('Power', 'N/A', 'N/A'),
          ('Torque', 'N/A', 'N/A'),
          ('Cylinders', 'N/A', 'N/A'),
        ],
      ),
      (
        title: 'Transmission',
        rows: [
          ('Transmission', na(_carA.transmission), na(_carB.transmission)),
          ('Drive type', 'N/A', 'N/A'),
        ],
      ),
      (
        title: 'Fuel',
        rows: [
          ('Fuel type', na(_carA.fuel), na(_carB.fuel)),
          ('Fuel economy', 'N/A', 'N/A'),
        ],
      ),
      (
        title: 'Dimensions',
        rows: [
          ('Length', 'N/A', 'N/A'),
          ('Width', 'N/A', 'N/A'),
          ('Height', 'N/A', 'N/A'),
          ('Ground clearance', 'N/A', 'N/A'),
          ('Boot space', 'N/A', 'N/A'),
        ],
      ),
      (
        title: 'Features',
        rows: [
          ('Air conditioning', 'N/A', 'N/A'),
          ('Airbags', 'N/A', 'N/A'),
          ('ABS', 'N/A', 'N/A'),
          ('Reverse camera', 'N/A', 'N/A'),
          ('Parking sensors', 'N/A', 'N/A'),
          ('Sunroof', 'N/A', 'N/A'),
          ('Apple CarPlay', 'N/A', 'N/A'),
          ('Android Auto', 'N/A', 'N/A'),
          ('Other features', 'N/A', 'N/A'),
        ],
      ),
    ];
  }
}

/// Top car headers: image, make+model, year and price in two columns.
class _ComparisonHeader extends StatelessWidget {
  const _ComparisonHeader({required this.car, required this.label});

  final Car car;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.textSecondary,
            letterSpacing: 1.1,
          ),
        ),
        const SizedBox(height: AppDimens.sm),
        ClipRRect(
          borderRadius: BorderRadius.circular(AppDimens.radiusMd),
          child: SizedBox(
            height: 120,
            width: double.infinity,
            child: Image.asset(
              'assets/images/${car.image}',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: AppColors.divider,
                child: const Center(
                  child: Icon(
                    Icons.image_not_supported_outlined,
                    color: AppColors.textDisabled,
                    size: 28,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: AppDimens.sm),
        Text(
          '${car.brand} ${car.modelName}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          car.year ?? '-',
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary),
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
    );
  }
}

/// A titled group of labelled rows with two value columns.
class _ComparisonSection extends StatelessWidget {
  const _ComparisonSection({required this.section});

  final ({String title, List<(String, String, String)> rows}) section;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppDimens.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimens.radiusMd),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppDimens.md),
            child: Text(
              section.title.toUpperCase(),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.textSecondary,
                letterSpacing: 1.1,
              ),
            ),
          ),
          const Divider(height: 1, color: AppColors.divider),
          for (final (label, valueA, valueB) in section.rows)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.md,
                vertical: 10,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 110,
                    child: Text(
                      label,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      valueA,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      valueB,
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






