import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';

/// A single used car listing with typed fields used for filtering.
class Car {
  const Car({
    required this.image,
    required this.name,
    required this.brand,
    required this.km,
    required this.fuel,
    required this.transmission,
    required this.body,
    required this.price,
  });

  final String image;
  final String name;
  final String brand;
  final String km;
  final String fuel;
  final String transmission;
  final String body;
  final int price;

  String get priceText =>
      '${price.toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+$)'), (m) => '${m[1]},')} ETB';

  /// Year parsed from the display name (e.g. "Toyota Vitz 2018" -> "2018"),
  /// or null when no four-digit year is present.
  String? get year {
    final match = RegExp(r'(\d{4})$').firstMatch(name);
    return match?.group(1);
  }

  /// Model name derived from the display name (brand and year removed).
  /// Falls back to the full name when it cannot be split cleanly.
  String get modelName {
    var model = name;
    if (brand.isNotEmpty && model.startsWith(brand)) {
      model = model.substring(brand.length).trim();
    }
    final y = year;
    if (y != null && model.endsWith(y)) {
      model = model.substring(0, model.length - y.length).trim();
    }
    return model.isEmpty ? name : model;
  }
}

/// Shared new-car catalogue used by the Compare Cars page and New Cars page.
/// Images use the naming convention without "its used car" suffix per photos.md.
const List<Car> newCars = [
  Car(
    image: 'BMW 7 Series.jpg',
    name: 'BMW 7 Series 2025',
    brand: 'BMW',
    km: '0 km',
    fuel: 'Petrol',
    transmission: 'Automatic',
    body: 'Sedan',
    price: 8400000,
  ),
  Car(
    image: 'BMW 5 Series.jpg',
    name: 'BMW 5 Series 2025',
    brand: 'BMW',
    km: '0 km',
    fuel: 'Hybrid',
    transmission: 'Automatic',
    body: 'Sedan',
    price: 9703200,
  ),
  Car(
    image: 'Porsche Panamera.jpg',
    name: 'Porsche Panamera 2025',
    brand: 'Porsche',
    km: '0 km',
    fuel: 'Hybrid/Petrol',
    transmission: 'Automatic',
    body: 'Sedan',
    price: 39400000,
  ),
  Car(
    image: 'BYD Sealion 7.jpg',
    name: 'BYD Sealion 7 2025',
    brand: 'BYD',
    km: '0 km',
    fuel: 'Electric',
    transmission: 'Automatic',
    body: 'SUV/MUV',
    price: 7000000,
  ),
];

/// Shared used-car catalogue used by the Used Cars page and the filtered
/// result screens.
const List<Car> allCars = [
  Car(
    image: 'photo_1.jpg',
    name: 'BMW 7 Series 2025',
    brand: 'BMW',
    km: '0 km',
    fuel: 'Petrol',
    transmission: 'Automatic',
    body: 'Sedan',
    price: 8400000,
  ),
  Car(
    image: 'photo_2.jpg',
    name: 'BMW 5 Series 2025',
    brand: 'BMW',
    km: '0 km',
    fuel: 'Hybrid',
    transmission: 'Automatic',
    body: 'Sedan',
    price: 9703200,
  ),
  Car(
    image: 'photo_9.jpg',
    name: 'Porsche Panamera 2025',
    brand: 'Porsche',
    km: '0 km',
    fuel: 'Hybrid/Petrol',
    transmission: 'Automatic',
    body: 'Sedan',
    price: 39400000,
  ),
  Car(
    image: 'photo_10.jpg',
    name: 'BYD Sealion 7 2025',
    brand: 'BYD',
    km: '0 km',
    fuel: 'Electric',
    transmission: 'Automatic',
    body: 'SUV/MUV',
    price: 7000000,
  ),
];

/// Full-screen list of cars that match a chosen filter (budget range, body
/// type, fuel type, transmission, model or brand). Pushed from the Used Cars
/// page when a filter option is tapped.
class FilteredResultsScreen extends StatelessWidget {
  const FilteredResultsScreen({
    super.key,
    required this.title,
    required this.cars,
  });

  final String title;
  final List<Car> cars;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.textPrimary,
          ),
        ),
      ),
      body: cars.isEmpty
          ? const _EmptyResults()
          : ListView(
              padding: const EdgeInsets.all(AppDimens.md),
              children: [
                Text(
                  '${cars.length} result${cars.length == 1 ? '' : 's'} found',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: AppDimens.sm),
                for (final car in cars) _ResultCard(car: car),
              ],
            ),
    );
  }
}

class _EmptyResults extends StatelessWidget {
  const _EmptyResults();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.search_off, size: 48, color: AppColors.textDisabled),
          const SizedBox(height: AppDimens.md),
          Text(
            'No cars match this filter',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}

/// Compact result row: thumbnail, name, specs and price.
class _ResultCard extends StatelessWidget {
  const _ResultCard({required this.car});

  final Car car;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppDimens.sm),
      padding: const EdgeInsets.all(AppDimens.sm),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimens.radiusMd),
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
                  car.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${car.km} · ${car.fuel} · ${car.transmission}',
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
    );
  }
}