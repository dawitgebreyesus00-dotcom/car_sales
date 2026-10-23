import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../shared/common/filter_results/filter_results.dart';

/// Car-picker opened from the Compare Cars page. Lets the user search the
/// new car catalogue by keyword, make or model, filter by brand and year, then
/// tap a result. The chosen car is returned to the caller via [Navigator.pop].
class SelectCarScreen extends StatefulWidget {
  const SelectCarScreen({super.key});

  @override
  State<SelectCarScreen> createState() => _SelectCarScreenState();
}

class _SelectCarScreenState extends State<SelectCarScreen> {
  final TextEditingController _controller = TextEditingController();
  String _query = '';
  String? _brand;
  String? _year;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<String> get _brands {
    final list = newCars.map((c) => c.brand).toSet().toList()..sort();
    return list;
  }

  List<String> get _years {
    final list = newCars.map((c) => c.year).whereType<String>().toSet().toList()
      ..sort((a, b) => b.compareTo(a));
    return list;
  }

  List<Car> get _results {
    return newCars.where((car) {
      final q = _query.trim().toLowerCase();
      if (q.isNotEmpty &&
          !car.name.toLowerCase().contains(q) &&
          !car.brand.toLowerCase().contains(q)) {
        return false;
      }
      if (_brand != null && car.brand != _brand) return false;
      if (_year != null && car.year != _year) return false;
      return true;
    }).toList();
  }

  void _pick(Car car) => Navigator.of(context).pop(car);

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
              hintText: 'Search make, model or year',
              hintStyle: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary),
              prefixIcon: const Icon(
                Icons.search,
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
          _buildFilterRow(context, 'Brand', _brands, _brand, (v) {
            setState(() => _brand = v);
          }),
          const SizedBox(height: AppDimens.xs),
          _buildFilterRow(context, 'Year', _years, _year, (v) {
            setState(() => _year = v);
          }),
          const SizedBox(height: AppDimens.md),
          for (final car in _results)
            _CarOptionRow(car: car, onTap: () => _pick(car)),
          if (_results.isEmpty)
            Padding(
              padding: const EdgeInsets.only(top: AppDimens.xxl),
              child: Center(
                child: Text(
                  'No cars match your search',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFilterRow(
    BuildContext context,
    String label,
    List<String> values,
    String? selected,
    ValueChanged<String?> onChanged,
  ) {
    if (values.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: AppDimens.sm),
        SizedBox(
          height: 36,
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            children: [
              for (final value in values)
                Padding(
                  padding: const EdgeInsets.only(right: AppDimens.sm),
                  child: ChoiceChip(
                    label: Text(value),
                    selected: selected == value,
                    onSelected: (_) =>
                        onChanged(selected == value ? null : value),
                    labelStyle: Theme.of(context).textTheme.labelMedium
                        ?.copyWith(
                          color: selected == value
                              ? AppColors.surface
                              : AppColors.textPrimary,
                          fontWeight: FontWeight.w400,
                        ),
                    selectedColor: AppColors.teal,
                    backgroundColor: AppColors.surface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26),
                      side: const BorderSide(color: AppColors.divider),
                    ),
                    showCheckmark: false,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Result row: thumbnail, make + model, year, price, fuel and transmission.
class _CarOptionRow extends StatelessWidget {
  const _CarOptionRow({required this.car, required this.onTap});

  final Car car;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDimens.radiusLg),
      child: Container(
        margin: const EdgeInsets.only(bottom: AppDimens.sm),
        padding: const EdgeInsets.all(AppDimens.sm),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppDimens.radiusLg),
          border: Border.all(color: AppColors.divider),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: 64,
                height: 48,
                child: Image.asset(
                  'assets/images/${car.image}',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: AppColors.divider,
                    child: const Icon(
                      Icons.image_not_supported_outlined,
                      color: AppColors.textDisabled,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: AppDimens.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    '${car.year ?? '-'} Â· ${car.fuel} Â· ${car.transmission}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
            const Icon(
              Icons.chevron_right,
              size: 20,
              color: AppColors.textSecondary,
            ),
          ],
        ),
      ),
    );
  }
}






