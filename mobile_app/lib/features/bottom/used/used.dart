import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../shared/common/filter_results/filter_results.dart';
import '../../../../navigation/app_routes.dart';
import '../../../../shared/widgets/tab_page_shell.dart';
import '../../../../shared/widgets/promo_carousel.dart';

class UsedScreen extends StatelessWidget {
  const UsedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TabPageShell(
      title: 'Used Cars',
      trailing: [
        _UsedTopAction(
          icon: AppIcons.search,
          tooltip: 'Search',
          onTap: () => Navigator.of(context).pushNamed(AppRoutes.searchCars),
        ),
        const SizedBox(width: AppDimens.sm),
        _UsedTopLocationAction(
          onTap: () => Navigator.of(context).pushNamed(AppRoutes.location),
        ),
      ],
      child: const _UsedBody(),
    );
  }
}

/// Outline-style icon chip used in the Used page top bar.
class _UsedTopAction extends StatelessWidget {
  const _UsedTopAction({
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

/// Location icon chip with a small red notification dot (top-right).
class _UsedTopLocationAction extends StatelessWidget {
  const _UsedTopLocationAction({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Location',
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
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              const Center(
                child: Icon(
                  AppIcons.location,
                  size: 21,
                  color: AppColors.textSecondary,
                ),
              ),
              Positioned(
                top: 9,
                right: 9,
                child: Container(
                  width: 7,
                  height: 7,
                  decoration: const BoxDecoration(
                    color: AppColors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _UsedBody extends StatelessWidget {
  const _UsedBody();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: AppDimens.xl),
      physics: const BouncingScrollPhysics(),
      children: const [
        _UsedTopSection(),
        _CitySection(),
        _FilterSection(),
        _PopularPreOwnedCarsSection(),
        _SellYourCarBanner(),
        _ToolsSection(),
      ],
    );
  }
}

/// Top portion of the Used Cars page: hero banner + "Find Second Hand Cars"
/// card that overlaps the bottom of the banner.
class _UsedTopSection extends StatelessWidget {
  const _UsedTopSection();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: const PromoCarousel(
              images: [
                  'promotion_1.png',
                  'promotion_3.jpg',
                ],
                height: 180,
                interval: Duration(minutes: 2),
              ),
          ),
          Positioned(top: 150, left: 0, right: 0, child: _FindCarCard()),
        ],
      ),
    );
  }
}

class _FindCarCard extends StatelessWidget {
  const _FindCarCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimens.lg),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimens.radiusLg),
        border: Border.all(color: AppColors.divider),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Find Second Hand Cars',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w400,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppDimens.md),
          _LocationSearchField(),
          const SizedBox(height: AppDimens.md),
          const _CardActions(),
        ],
      ),
    );
  }
}

class _LocationSearchField extends StatelessWidget {
  const _LocationSearchField();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      padding: const EdgeInsets.only(left: AppDimens.lg, right: 6),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: AppColors.divider),
      ),
      child: Row(
        children: [
          const Icon(
            AppIcons.location,
            size: 20,
            color: AppColors.textSecondary,
          ),
          const SizedBox(width: AppDimens.sm),
          Expanded(
            child: Text(
              'View Used cars in Indore',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: AppColors.teal,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class _CardActions extends StatelessWidget {
  const _CardActions();

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyMedium?.copyWith(
      color: AppColors.textPrimary,
      fontWeight: FontWeight.w400,
    );

    return Row(
      children: [
        Expanded(
          child: Text(
            'Sell Your Car',
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: style,
          ),
        ),
        Container(width: 1, height: 24, color: AppColors.divider),
        Expanded(
          child: Text(
            'Check Value of Your Car',
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: style,
          ),
        ),
      ],
    );
  }
}

/// "Used Cars By City" section: section title + 3-column city grid +
/// "Other Cities" affordance.
class _CitySection extends StatelessWidget {
  const _CitySection();

  static const List<String> _cities = _kCityNames;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppDimens.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Used Cars By City',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w400,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppDimens.md),
          _CityGrid(cities: _cities),
          const SizedBox(height: AppDimens.sm),
          const _OtherCitiesTile(),
        ],
      ),
    );
  }
}

/// Horizontal city grid: exactly 3 equal columns with subtle dividers.
class _CityGrid extends StatelessWidget {
  const _CityGrid({required this.cities});

  final List<String> cities;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimens.radiusLg),
        border: Border.all(color: AppColors.divider),
      ),
      clipBehavior: Clip.antiAlias,
      child: GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        childAspectRatio: 1.35,
        children: [
          for (int i = 0; i < cities.length; i++)
            _CityTile(
              city: cities[i],
              showVerticalDivider: i % 3 != 2,
              showHorizontalDivider: i < cities.length - 3,
            ),
        ],
      ),
    );
  }
}

class _CityTile extends StatelessWidget {
  const _CityTile({
    required this.city,
    required this.showVerticalDivider,
    required this.showHorizontalDivider,
  });

  final String city;
  final bool showVerticalDivider;
  final bool showHorizontalDivider;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            right: showVerticalDivider
                ? const BorderSide(color: AppColors.divider)
                : BorderSide.none,
            bottom: showHorizontalDivider
                ? const BorderSide(color: AppColors.divider)
                : BorderSide.none,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              AppIcons.locationCity,
              size: 26,
              color: AppColors.textSecondary,
            ),
            const SizedBox(height: AppDimens.sm),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimens.xs),
              child: Text(
                city,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OtherCitiesTile extends StatelessWidget {
  const _OtherCitiesTile();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(AppDimens.radiusMd),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppDimens.md),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Other Cities',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(width: AppDimens.xs),
              const Icon(
                Icons.keyboard_arrow_right,
                size: 20,
                color: AppColors.textSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Ethiopian cities/regions matching the drawer's Popular Cities list.
const List<String> _kCityNames = [
  'Addis Ababa',
  'Amhara',
  'Oromia',
  'Tigray',
  'Sidama',
  'SNNPR',
  'Somali',
  'Afar',
  'Benishangul-Gumuz',
];

/// "Find The Cars Of Your Choice" section: category tabs (Budget, Body Type,
/// Fuel Type, Transmission) with the options listed side by side. Tapping any
/// option opens the filtered result screen showing the matching cars.
class _FilterSection extends StatefulWidget {
  const _FilterSection();

  @override
  State<_FilterSection> createState() => _FilterSectionState();
}

class _FilterSectionState extends State<_FilterSection> {
  _FilterCategory _active = _FilterCategory.budget;
  bool _luxuryExpanded = false;

  static const List<String> _budgetOptions = [
    '1M - 1.5M',
    '1.5M - 2M',
    '2M - 3M',
    '3M+',
  ];

  static const Map<String, (int, int?)> _budgetBounds = {
    '1M - 1.5M': (1000000, 1500000),
    '1.5M - 2M': (1500000, 2000000),
    '2M - 3M': (2000000, 3000000),
    '3M+': (3000000, null),
  };

  static const List<String> _luxuryOptions = [
    'Mercedes-Benz',
    'BMW',
    'Audi',
    'Volvo',
    'Jaguar',
    'Land Rover',
    'Lexus',
    'Porsche',
  ];

  static const List<String> _bodyOptions = ['SUV/MUV', 'Hatchback', 'Sedan'];

  static const List<String> _fuelOptions = [
    'Petrol',
    'Diesel',
    'CNG',
    'Electric',
    'LPG',
    'Hybrid',
  ];

  static const List<String> _transmissionOptions = [
    'Automatic',
    'Manual',
    'Clutchless Manual',
  ];

  void _selectTab(_FilterCategory category) {
    setState(() {
      _active = category;
      _luxuryExpanded = false;
    });
  }

  void _toggleLuxury() {
    setState(() => _luxuryExpanded = !_luxuryExpanded);
  }

  void _openResults(String title, List<Car> cars) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => FilteredResultsScreen(title: title, cars: cars),
      ),
    );
  }

  void _selectBudget(String option) {
    final (min, max) = _budgetBounds[option] ?? (0, null);
    final cars = allCars
        .where(
          (car) => max == null
              ? car.price >= min
              : car.price >= min && car.price <= max,
        )
        .toList();
    _openResults(option, cars);
  }

  void _selectBody(String option) {
    _openResults(option, allCars.where((car) => car.body == option).toList());
  }

  void _selectFuel(String option) {
    _openResults(option, allCars.where((car) => car.fuel == option).toList());
  }

  void _selectTransmission(String option) {
    _openResults(
      option,
      allCars.where((car) => car.transmission == option).toList(),
    );
  }

  void _selectLuxury(String option) {
    _openResults(option, allCars.where((car) => car.brand == option).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppDimens.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Find The Cars Of Your Choice',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w400,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppDimens.md),
          _FilterTabRow(active: _active, onSelected: _selectTab),
          const SizedBox(height: AppDimens.md),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppDimens.lg),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppDimens.radiusLg),
              border: Border.all(color: AppColors.divider),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x0F000000),
                  blurRadius: 12,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: _buildOptions(context),
          ),
        ],
      ),
    );
  }

  Widget _buildOptions(BuildContext context) {
    switch (_active) {
      case _FilterCategory.budget:
        if (_luxuryExpanded) {
          return _LuxuryGrid(
            options: _luxuryOptions,
            onSelect: _selectLuxury,
            onGoBack: _toggleLuxury,
          );
        }
        return _BudgetGrid(
          options: _budgetOptions,
          onSelect: _selectBudget,
          onLuxuryTap: _toggleLuxury,
        );
      case _FilterCategory.bodyType:
        return _BodyTypeList(options: _bodyOptions, onSelect: _selectBody);
      case _FilterCategory.fuelType:
        return _FuelTypeGrid(options: _fuelOptions, onSelect: _selectFuel);
      case _FilterCategory.transmission:
        return _TransmissionList(
          options: _transmissionOptions,
          onSelect: _selectTransmission,
        );
    }
  }
}

enum _FilterCategory { budget, bodyType, fuelType, transmission }

/// Top tab row: Budget, Body Type, Fuel Type, Transmission. The active tab is
/// highlighted with the selection color and an underline.
class _FilterTabRow extends StatelessWidget {
  const _FilterTabRow({required this.active, required this.onSelected});

  final _FilterCategory active;
  final ValueChanged<_FilterCategory> onSelected;

  static const List<(_FilterCategory, IconData, String)> _tabs = [
    (_FilterCategory.budget, Icons.attach_money, 'Budget'),
    (_FilterCategory.bodyType, Icons.directions_car, 'Body Type'),
    (_FilterCategory.fuelType, Icons.local_gas_station, 'Fuel Type'),
    (_FilterCategory.transmission, Icons.settings, 'Transmission'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          for (final (category, icon, label) in _tabs)
            _FilterTab(
              icon: icon,
              label: label,
              selected: active == category,
              onTap: () => onSelected(category),
            ),
        ],
      ),
    );
  }
}

class _FilterTab extends StatelessWidget {
  const _FilterTab({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected ? AppColors.teal : AppColors.textSecondary;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDimens.radiusSm),
      child: Container(
        margin: const EdgeInsets.only(right: AppDimens.md),
        constraints: const BoxConstraints(minWidth: 88),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: selected ? AppColors.teal : Colors.transparent,
              width: 2.5,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: AppDimens.sm),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 17, color: color),
              const SizedBox(width: 6),
              Text(
                label,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: color,
                  fontWeight: selected ? FontWeight.w400 : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// "Budget" options: price ranges listed side by side in a two-column grid,
/// plus a "Luxury Cars" card that opens the luxury-brand list.
class _BudgetGrid extends StatelessWidget {
  const _BudgetGrid({
    required this.options,
    required this.onSelect,
    required this.onLuxuryTap,
  });

  final List<String> options;
  final ValueChanged<String> onSelect;
  final VoidCallback onLuxuryTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _BudgetSectionLabel('Price Range (ETB)'),
        _SideBySideGrid(
          options: options,
          icon: Icons.payments_outlined,
          onSelect: onSelect,
        ),
        const SizedBox(height: AppDimens.xs),
        _FilterOptionRow(
          icon: Icons.workspace_premium_outlined,
          label: 'Luxury Cars',
          trailing: Icons.chevron_right,
          onTap: onLuxuryTap,
        ),
      ],
    );
  }
}

/// Lays the given options out side by side in a two-column grid so all the
/// values stay visible together (e.g. the budget ranges).
class _SideBySideGrid extends StatelessWidget {
  const _SideBySideGrid({
    required this.options,
    required this.icon,
    required this.onSelect,
    this.icons,
  });

  final List<String> options;
  final IconData icon;
  final ValueChanged<String> onSelect;
  final Map<String, IconData>? icons;

  @override
  Widget build(BuildContext context) {
    final rows = (options.length / 2).ceil();
    return Column(
      children: [
        for (var row = 0; row < rows; row++)
          Padding(
            padding: EdgeInsets.only(bottom: row + 1 < rows ? AppDimens.sm : 0),
            child: Row(
              children: [
                Expanded(
                  child: _FilterOptionRow(
                    icon: icons?[options[row * 2]] ?? icon,
                    label: options[row * 2],
                    onTap: () => onSelect(options[row * 2]),
                  ),
                ),
                const SizedBox(width: AppDimens.sm),
                Expanded(
                  child: options.length > row * 2 + 1
                      ? _FilterOptionRow(
                          icon: icons?[options[row * 2 + 1]] ?? icon,
                          label: options[row * 2 + 1],
                          onTap: () => onSelect(options[row * 2 + 1]),
                        )
                      : const SizedBox.shrink(),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

/// Small uppercase section label for structured filter groups.
class _BudgetSectionLabel extends StatelessWidget {
  const _BudgetSectionLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimens.sm),
      child: Text(
        text.toUpperCase(),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: AppColors.textSecondary,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.1,
          fontSize: 11,
        ),
      ),
    );
  }
}

/// A single filter option row: circular teal icon on the left, label in the
/// middle, chevron on the right. Tapping it opens the filtered results screen.
class _FilterOptionRow extends StatelessWidget {
  const _FilterOptionRow({
    required this.icon,
    required this.label,
    required this.onTap,
    this.trailing,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final IconData? trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimens.sm),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimens.radiusMd),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.md,
            vertical: AppDimens.sm,
          ),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppDimens.radiusMd),
            border: Border.all(color: AppColors.divider),
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Color(0xFFF0F2F5),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 20, color: AppColors.textSecondary),
              ),
              const SizedBox(width: AppDimens.md),
              Expanded(
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Icon(
                trailing ?? Icons.chevron_right,
                size: 22,
                color: AppColors.textSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Luxury car brand choices shown inside the same budget card area.
class _LuxuryGrid extends StatelessWidget {
  const _LuxuryGrid({
    required this.options,
    required this.onSelect,
    required this.onGoBack,
  });

  final List<String> options;
  final ValueChanged<String> onSelect;
  final VoidCallback onGoBack;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onGoBack,
          borderRadius: BorderRadius.circular(AppDimens.radiusSm),
          child: Padding(
            padding: const EdgeInsets.only(bottom: AppDimens.sm),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.arrow_back,
                  size: 16,
                  color: AppColors.textSecondary,
                ),
                const SizedBox(width: 6),
                Text(
                  'Luxury Cars',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: AppDimens.xs),
        _BudgetSectionLabel('Luxury Brands'),
        _SideBySideGrid(
          options: options,
          icon: Icons.directions_car_outlined,
          onSelect: onSelect,
        ),
      ],
    );
  }
}

/// Row-style list for Body Type: car illustration on the left, name in the
/// center, chevron on the right.
class _BodyTypeList extends StatelessWidget {
  const _BodyTypeList({required this.options, required this.onSelect});

  final List<String> options;
  final ValueChanged<String> onSelect;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _BudgetSectionLabel('Choose Body Type'),
        _SideBySideGrid(
          options: options,
          icon: Icons.directions_car_filled,
          onSelect: onSelect,
        ),
      ],
    );
  }
}

/// Fuel Type options in a side-by-side two-column grid, each option with its
/// own icon and a chevron on the right.
class _FuelTypeGrid extends StatelessWidget {
  const _FuelTypeGrid({required this.options, required this.onSelect});

  final List<String> options;
  final ValueChanged<String> onSelect;

  static const Map<String, IconData> _icons = {
    'Petrol': Icons.local_gas_station,
    'Diesel': Icons.oil_barrel,
    'CNG': Icons.compress,
    'Electric': Icons.electric_car,
    'LPG': Icons.propane_tank,
    'Hybrid': Icons.eco,
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _BudgetSectionLabel('Choose Fuel Type'),
        _SideBySideGrid(
          options: options,
          icon: Icons.local_gas_station,
          icons: _icons,
          onSelect: onSelect,
        ),
      ],
    );
  }
}

/// Transmission options in a clean, structured list.
class _TransmissionList extends StatelessWidget {
  const _TransmissionList({required this.options, required this.onSelect});

  final List<String> options;
  final ValueChanged<String> onSelect;

  static const Map<String, IconData> _icons = {
    'Automatic': Icons.settings,
    'Manual': Icons.settings_input_hdmi,
    'Clutchless Manual': Icons.swap_horiz,
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _BudgetSectionLabel('Choose Transmission'),
        for (final option in options)
          _FilterOptionRow(
            icon: _icons[option] ?? Icons.settings,
            label: option,
            onTap: () => onSelect(option),
          ),
      ],
    );
  }
}

/// "Popular Pre Owned Cars" section: a "Popular Models" / "Brands" tab bar,
/// a horizontally scrollable row of used-car cards for models, a 3x3 brand
/// grid for brands, and a full-width "View All Used Cars" button.
class _PopularPreOwnedCarsSection extends StatefulWidget {
  const _PopularPreOwnedCarsSection();

  @override
  State<_PopularPreOwnedCarsSection> createState() =>
      _PopularPreOwnedCarsSectionState();
}

class _PopularPreOwnedCarsSectionState
    extends State<_PopularPreOwnedCarsSection> {
  bool _showBrands = false;

  static const List<(String, String, String)> _cars = [
    ('BMW 5 Series - its used car.jpg', 'BMW 5 Series 2025', '9,703,200 ETB'),
    ('Mercedes-AMG G 63 - its used car.jpg', 'Mercedes-AMG G 63 2025', '39,400,000 ETB'),
    ('Range Rover - its used car.jpg', 'Range Rover 2025', '35,000,000 ETB'),
    ('Toyota Land Cruiser - its used car.jpg', 'Toyota Land Cruiser 2025', '28,500,000 ETB'),
  ];

  static const List<String> _brands = [
    'Maruti Suzuki',
    'Hyundai',
    'Tata',
    'Mahindra',
    'BMW',
    'Mercedes-Benz',
    'Toyota',
    'Honda',
    'Audi',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppDimens.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular Pre Owned Cars',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w400,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppDimens.md),
          _PreOwnedTabBar(
            showBrands: _showBrands,
            onChanged: (showBrands) => setState(() => _showBrands = showBrands),
          ),
          const SizedBox(height: AppDimens.md),
          if (_showBrands)
            _BrandsGrid(brands: _brands)
          else
            SizedBox(
              height: 240,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: _cars.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(width: AppDimens.md),
                itemBuilder: (context, index) {
                  final (image, name, price) = _cars[index];
                  return _PreOwnedCard(image: image, name: name, price: price);
                },
              ),
            ),
          const SizedBox(height: AppDimens.md),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: AppColors.surface,
                foregroundColor: AppColors.teal,
                side: const BorderSide(color: AppColors.teal),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDimens.radiusMd),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              onPressed: () {},
              child: Text(
                'View All Used Cars',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: AppColors.teal,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Two-tab selector (POPULAR MODELS / BRANDS) with a teal underline on the
/// active tab.
class _PreOwnedTabBar extends StatelessWidget {
  const _PreOwnedTabBar({required this.showBrands, required this.onChanged});

  final bool showBrands;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _PreOwnedTab(
          label: 'POPULAR MODELS',
          selected: !showBrands,
          onTap: () => onChanged(false),
        ),
        _PreOwnedTab(
          label: 'BRANDS',
          selected: showBrands,
          onTap: () => onChanged(true),
        ),
      ],
    );
  }
}

class _PreOwnedTab extends StatelessWidget {
  const _PreOwnedTab({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected ? AppColors.teal : AppColors.textSecondary;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDimens.radiusSm),
      child: Container(
        margin: const EdgeInsets.only(right: AppDimens.lg),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: selected ? AppColors.teal : Colors.transparent,
              width: 2.5,
            ),
          ),
        ),
        padding: const EdgeInsets.only(bottom: AppDimens.sm),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: color,
            fontWeight: selected ? FontWeight.w400 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

/// 3-column brand grid with thin divider lines and a monogram logo per brand.
class _BrandsGrid extends StatelessWidget {
  const _BrandsGrid({required this.brands});

  final List<String> brands;

  @override
  Widget build(BuildContext context) {
    final columns = 3;
    final rows = (brands.length / columns).ceil();
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimens.radiusMd),
        border: Border.all(color: AppColors.divider),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          for (var row = 0; row < rows; row++) ...[
            if (row > 0)
              const Divider(height: 1, thickness: 1, color: AppColors.divider),
            SizedBox(
              height: 88,
              child: Row(
                children: [
                  for (var col = 0; col < columns; col++) ...[
                    if (col > 0)
                      const VerticalDivider(
                        width: 1,
                        thickness: 1,
                        color: AppColors.divider,
                      ),
                    Expanded(
                      child: _BrandCell(name: brands[row * columns + col]),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Single brand cell: monogram "logo" circle with the brand name below.
class _BrandCell extends StatelessWidget {
  const _BrandCell({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Color(0xFFF0F2F5),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              name.substring(0, 1).toUpperCase(),
              style: const TextStyle(
                color: AppColors.teal,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
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

/// Single used-car listing card: image, name, starting price label and price.
class _PreOwnedCard extends StatelessWidget {
  const _PreOwnedCard({
    required this.image,
    required this.name,
    required this.price,
  });

  final String image;
  final String name;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimens.radiusLg),
        border: Border.all(color: AppColors.divider),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120,
            width: double.infinity,
            child: Image.asset(
              'assets/images/$image',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: AppColors.divider,
                child: const Center(
                  child: Icon(
                    Icons.image_not_supported_outlined,
                    color: AppColors.textDisabled,
                    size: 32,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppDimens.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
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
                  const SizedBox(height: 6),
                  Text(
                    'Starting Price',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    price,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.teal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// "Want to Sell Your Car ?" section: white rounded card with title,
/// description, a 2x2 feature grid, and a teal outlined "Sell Your Car" button.
class _SellYourCarBanner extends StatelessWidget {
  const _SellYourCarBanner();

  static const List<(IconData, String)> _features = [
    (Icons.calendar_today_outlined, 'Sell within days'),
    (Icons.payments_outlined, 'Best price deal'),
    (Icons.verified_user_outlined, 'Verified buyers'),
    (Icons.schedule, '90 days ad validity'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppDimens.xl),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppDimens.lg),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppDimens.radiusLg),
          border: Border.all(color: AppColors.divider),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Want to Sell Your Car ?',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: AppDimens.sm),
            Text(
              'Over 2.5 million used car buyers visit our site every month '
              'looking for a used car!',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
                height: 1.4,
              ),
            ),
            const SizedBox(height: AppDimens.lg),
            _FeatureGrid(features: _features),
            const SizedBox(height: AppDimens.lg),
            SizedBox(
              width: double.infinity,
              height: AppDimens.buttonHeight,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.teal,
                  side: const BorderSide(color: AppColors.teal),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppDimens.radiusMd),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.sellCar);
                },
                child: Text(
                  'Sell Your Car',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.teal,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 2-column x 2-row feature layout: icon on the left, dark gray text beside it.
class _FeatureGrid extends StatelessWidget {
  const _FeatureGrid({required this.features});

  final List<(IconData, String)> features;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _FeatureItem(icon: features[0].$1, label: features[0].$2),
            ),
            Expanded(
              child: _FeatureItem(icon: features[1].$1, label: features[1].$2),
            ),
          ],
        ),
        const SizedBox(height: AppDimens.lg),
        Row(
          children: [
            Expanded(
              child: _FeatureItem(icon: features[2].$1, label: features[2].$2),
            ),
            Expanded(
              child: _FeatureItem(icon: features[3].$1, label: features[3].$2),
            ),
          ],
        ),
      ],
    );
  }
}

/// One feature cell: a small light teal illustration icon next to dark gray text.
class _FeatureItem extends StatelessWidget {
  const _FeatureItem({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 38,
          height: 38,
          decoration: const BoxDecoration(
            color: Color(0xFFEAF5F4),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 19, color: AppColors.teal),
        ),
        const SizedBox(width: AppDimens.sm),
        Expanded(
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w500,
              height: 1.2,
            ),
          ),
        ),
      ],
    );
  }
}

/// "Tools You May Need" section: one white card holding two horizontal tool
/// items (icon left, title + description right) separated by a divider.
class _ToolsSection extends StatelessWidget {
  const _ToolsSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppDimens.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tools You May Need',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w400,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppDimens.md),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppDimens.radiusLg),
              border: Border.all(color: AppColors.divider),
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                _ToolItem(
                  icon: Icons.confirmation_number_outlined,
                  title: 'Used Car Valuation',
                  description:
                      'Check the price of a used car with our calculator',
                  onTap: () => Navigator.of(
                    context,
                  ).pushNamed(AppRoutes.checkCarValuation),
                ),
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: AppColors.divider,
                ),
                _ToolItem(
                  icon: Icons.attach_money,
                  title: 'Instant Car Loan',
                  description:
                      'Apply and get the best Car Loan Offers within minutes',
                  onTap: () =>
                      Navigator.of(context).pushNamed(AppRoutes.carLoan),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// One tool row: light teal circular icon on the left, bold title and
/// dark-gray wrapped description on the right.
class _ToolItem extends StatelessWidget {
  const _ToolItem({
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.lg),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: const BoxDecoration(
                color: Color(0xFFEAF5F4),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 24, color: AppColors.teal),
            ),
            const SizedBox(width: AppDimens.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.35,
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






