import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

/// New Cars home page.
///
/// Merged implementation following the section-by-section specification in `docs/new.doc`.
class NewCarsPage extends StatelessWidget {
  const NewCarsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ColoredBox(
        color: AppColors.background,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: _TopBar()),
            SliverPersistentHeader(
              pinned: true,
              delegate: _SearchHeaderDelegate(child: const _SearchBar()),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 8),

                  // §5 - Find the Right Car By
                  _Sheet(
                    children: [
                      _SectionTitle('Find The Right Car By'),
                      const SizedBox(height: 16),
                      _FilterRow(),
                      const SizedBox(height: 24),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // §6 - Promotional banner
                  _HeroCard(),
                  const SizedBox(height: 24),

                  // Promotions carousel
                  _Sheet(
                    children: [
                      _SectionTitle('Promotions'),
                      const SizedBox(height: 16),
                      _PromotionList(),
                      const SizedBox(height: 24),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // §7 / §8 / §9 - Recently viewed, journey and recommendations
                  _Sheet(
                    children: [
                      _SectionTitle('Recently Viewed Cars'),
                      const SizedBox(height: 16),
                      _RecentlyViewedList(),
                      const SizedBox(height: 32),
                      _SectionTitle('Continue Your Journey'),
                      const SizedBox(height: 16),
                      _JourneyRow(),
                      const SizedBox(height: 32),
                      _SectionTitle('Recommended For You'),
                      const SizedBox(height: 16),
                      _RecommendedList(),
                      const SizedBox(height: 32),
                    ],
                  ),

                  // §10 - Price disclaimer
                  _PriceDisclaimer(),
                  const SizedBox(height: 24),

                  // §11 - Featured Cars
                  _Sheet(
                    children: [
                      _SectionTitle('Featured Cars'),
                      const SizedBox(height: 16),
                      _FeaturedCarsTabs(),
                      const SizedBox(height: 16),
                      _FeaturedCarCard(
                        brand: 'BMW',
                        model: '7 Series 2025 • 3.0L Turbo • AWD • 5 Seats',
                        price: '~ETB 8,400,000',
                        imageUrl: 'assets/images/BMW 7 Series.jpg',
                        onViewPriceBreakdown: () {},
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== 1. HEADER (§4.1) ====================

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surface,
      padding: const EdgeInsets.fromLTRB(4, 8, 16, 8),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.menu, color: AppColors.textPrimary, size: 26),
            tooltip: 'Menu',
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
          const SizedBox(width: 2),
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: AppColors.red,
              borderRadius: BorderRadius.circular(7),
            ),
            child: const Center(
              child: Text(
                'C',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  height: 1,
                ),
              ),
            ),
          ),
          const SizedBox(width: 7),
          const Text(
            'carsales',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 19,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.4,
              height: 1,
            ),
          ),
          const Spacer(),
          Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 24,
                color: AppColors.textPrimary,
              ),
              Positioned(
                right: -1,
                top: -1,
                child: Container(
                  width: 9,
                  height: 9,
                  decoration: const BoxDecoration(
                    color: AppColors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 18),
          const Icon(
            Icons.favorite_border,
            size: 24,
            color: AppColors.textPrimary,
          ),
        ],
      ),
    );
  }
}

// ==================== 2. SEARCH BAR (§4.2) ====================

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.premiumBorder),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0F000000),
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            hintText: 'Search for your car e.g. Creta',
            hintStyle: const TextStyle(
              color: Color(0xFF6B7280),
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
            filled: false,
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            suffixIcon: const Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(Icons.search, size: 22, color: Color(0xFF6B7280)),
            ),
          ),
        ),
      ),
    );
  }
}

/// Pinned header wrapper for the search area.
class _SearchHeaderDelegate extends SliverPersistentHeaderDelegate {
  const _SearchHeaderDelegate({required this.child});

  final Widget child;

  @override
  double get maxExtent => 62;

  @override
  double get minExtent => 62;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: AppColors.background,
      child: child,
    );
  }

  @override
  bool shouldRebuild(covariant _SearchHeaderDelegate old) => false;
}

// ==================== 3. FIND THE RIGHT CAR BY (§5) ====================

class _FilterRow extends StatelessWidget {
  const _FilterRow();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: const [
          _FilterPill(icon: Icons.attach_money, label: 'Budget'),
          _FilterPill(icon: Icons.directions_car, label: 'Body Type'),
          _FilterPill(icon: Icons.speed, label: 'Fuel Type'),
          _FilterPill(icon: Icons.settings, label: 'Transmission'),
          _FilterPill(icon: Icons.filter_alt, label: 'All Filters'),
          SizedBox(width: 16),
        ],
      ),
    );
  }
}

class _FilterPill extends StatelessWidget {
  const _FilterPill({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.fromLTRB(8, 7, 14, 7),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.premiumBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _IconTile(icon: icon),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              height: 1.1,
            ),
          ),
        ],
      ),
    );
  }
}

class _IconTile extends StatelessWidget {
  const _IconTile({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: AppColors.premiumSelectedBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, size: 18, color: AppColors.teal),
    );
  }
}

// ==================== 4. PROMOTIONAL BANNER (§6) ====================

class _HeroCard extends StatelessWidget {
  const _HeroCard();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: double.infinity,
          height: 200,
          color: AppColors.surface,
          child: Image.asset(
            'assets/images/BMW 7 Series.jpg',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              color: AppColors.divider,
              child: const Center(
                child: Icon(
                  Icons.image_not_supported_outlined,
                  color: AppColors.textDisabled,
                  size: 40,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PromotionList extends StatelessWidget {
  const _PromotionList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 168,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: _promotionImages.length,
        separatorBuilder: (_, _) => SizedBox(width: 16),
        itemBuilder: (context, index) =>
            _PromotionBanner(imageUrl: _promotionImages[index]),
      ),
    );
  }
}

class _PromotionBanner extends StatelessWidget {
  const _PromotionBanner({required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 300,
        color: AppColors.surface,
        child: Image.asset(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            color: AppColors.divider,
            child: const Center(
              child: Icon(
                Icons.image_not_supported_outlined,
                color: AppColors.textDisabled,
                size: 40,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Available promotional artwork. Add new entries here to extend the carousel.
List<String> _promotionImages = [
  'assets/images/promotion_1.png',
  'assets/images/promotion_3.jpg',
];

// ==================== 5. RECENTLY VIEWED CARS (§7) ====================

class _RecentlyViewedList extends StatelessWidget {
  const _RecentlyViewedList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 132,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: _recentlyViewedCars.length,
        separatorBuilder: (_, _) => SizedBox(width: 16),
        itemBuilder: (context, index) =>
            _RecentlyViewedCard(car: _recentlyViewedCars[index]),
      ),
    );
  }
}

class _RecentlyViewedCard extends StatelessWidget {
  const _RecentlyViewedCard({required this.car});

  final _RecentlyViewedCar car;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 116,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.premiumBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 66,
            width: double.infinity,
            color: Colors.white,
            child: Image.asset(
              car.imageUrl,
              fit: BoxFit.contain,
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
          const SizedBox(height: 6),
          Text(
            car.brand,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 11,
              fontWeight: FontWeight.w400,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            car.model,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              height: 1.15,
            ),
          ),
        ],
      ),
    );
  }
}

class _RecentlyViewedCar {
  const _RecentlyViewedCar({
    required this.brand,
    required this.model,
    required this.imageUrl,
  });

  final String brand;
  final String model;
  final String imageUrl;
}

/// Sample vehicles for the recently viewed rail.
const List<_RecentlyViewedCar> _recentlyViewedCars = [
  _RecentlyViewedCar(
    brand: 'Range Rover',
    model: '3.0L Turbo • AWD • 5 Seats',
    imageUrl: 'assets/images/Range Rover.jpg',
  ),
  _RecentlyViewedCar(
    brand: 'BMW 5 Series',
    model: '3.0L Turbo Hybrid • AWD • 5 Seats',
    imageUrl: 'assets/images/BMW 5 Series.jpg',
  ),
  _RecentlyViewedCar(
    brand: 'BYD Sealion 7',
    model: '82 kWh Electric • AWD/RWD • 5 Seats',
    imageUrl: 'assets/images/BYD Sealion 7.jpg',
  ),
  _RecentlyViewedCar(
    brand: 'Mercedes-AMG G 63',
    model: '4.0L V8 Biturbo • 4WD • 5 Seats',
    imageUrl: 'assets/images/Mercedes-AMG G 63.jpg',
  ),
];

// ==================== 6. CONTINUE YOUR JOURNEY (§8) ====================

class _JourneyRow extends StatelessWidget {
  const _JourneyRow();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: const [
          _JourneyChip(icon: Icons.filter_alt, label: 'SUV'),
          _JourneyChip(icon: Icons.directions_car, label: 'Sedan'),
          _JourneyChip(icon: Icons.airport_shuttle, label: 'Hatchback'),
          _JourneyChip(icon: Icons.bolt, label: 'Electric'),
          SizedBox(width: 16),
        ],
      ),
    );
  }
}

class _JourneyChip extends StatelessWidget {
  const _JourneyChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.fromLTRB(8, 7, 14, 7),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.premiumBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _IconTile(icon: icon),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              height: 1.1,
            ),
          ),
        ],
      ),
    );
  }
}

// ==================== 7. RECOMMENDED FOR YOU (§9) ====================

class _RecommendedList extends StatelessWidget {
  const _RecommendedList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 246,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: _recommendedCars.length,
        separatorBuilder: (_, _) => SizedBox(width: 16),
        itemBuilder: (context, index) =>
            _RecommendedCard(car: _recommendedCars[index]),
      ),
    );
  }
}

class _RecommendedCard extends StatelessWidget {
  const _RecommendedCard({required this.car});

  final _RecommendedCar car;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 168,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.premiumBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 104,
            width: double.infinity,
            color: Colors.white,
            child: Image.asset(
              car.imageUrl,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => Container(
                color: AppColors.divider,
                child: const Icon(
                  Icons.image_not_supported_outlined,
                  color: AppColors.textDisabled,
                  size: 40,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            car.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 13,
              fontWeight: FontWeight.w500,
              height: 1.15,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            car.price,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.teal,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              height: 1.1,
            ),
          ),
        ],
      ),
    );
  }
}

class _RecommendedCar {
  const _RecommendedCar({
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  final String name;
  final String price;
  final String imageUrl;
}

/// Sample recommended vehicles with indicative ETB pricing.
const List<_RecommendedCar> _recommendedCars = [
  _RecommendedCar(
    name: 'BMW 7 Series',
    price: '~ETB 8,400,000',
    imageUrl: 'assets/images/BMW 7 Series.jpg',
  ),
  _RecommendedCar(
    name: 'BMW 7',
    price: '~ETB 8,400,000',
    imageUrl: 'assets/images/BMW 7.jpg',
  ),
  _RecommendedCar(
    name: 'Toyota Land Cruiser 300',
    price: '~ETB 46,000,000 – 48,000,000',
    imageUrl: 'assets/images/Toyota Land Cruiser.jpg',
  ),
  _RecommendedCar(
    name: 'Range Rover',
    price: '~ETB 55,000,000 – 65,000,000',
    imageUrl: 'assets/images/Range Rover.jpg',
  ),
  _RecommendedCar(
    name: 'Mercedes-AMG G 63',
    price: '~ETB 29,260,000',
    imageUrl: 'assets/images/Mercedes-AMG G 63.jpg',
  ),
  _RecommendedCar(
    name: 'BYD Sealion 7',
    price: '~ETB 7,000,000 – 8,700,000',
    imageUrl: 'assets/images/BYD Sealion 7.jpg',
  ),
];

// ==================== 8. PRICE DISCLAIMER (§10) ====================

class _PriceDisclaimer extends StatelessWidget {
  const _PriceDisclaimer();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Text(
        'Prices are indicative and may vary by location and dealer.',
        style: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 12,
          height: 1.2,
        ),
      ),
    );
  }
}

// ==================== 9. FEATURED CARS (§11) ====================

class _FeaturedCarsTabs extends StatelessWidget {
  const _FeaturedCarsTabs();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        children: const [
          _FeaturedTab(label: 'Popular', isSelected: true),
          SizedBox(width: 8),
          _FeaturedTab(label: 'Just Launched'),
          SizedBox(width: 8),
          _FeaturedTab(label: 'Upcoming'),
        ],
      ),
    );
  }
}

class _FeaturedTab extends StatelessWidget {
  const _FeaturedTab({required this.label, this.isSelected = false});

  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final Color tabColor = isSelected ? AppColors.teal : AppColors.textSecondary;
    final Color underlineColor = isSelected ? AppColors.teal : AppColors.divider;

    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 8, 4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: tabColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              height: 1.1,
              decoration: isSelected ? TextDecoration.underline : null,
              decorationColor: underlineColor,
              decorationThickness: 3,
            ),
          ),
        ],
      ),
    );
  }
}

class _FeaturedCarCard extends StatelessWidget {
  const _FeaturedCarCard({
    required this.brand,
    required this.model,
    required this.price,
    required this.imageUrl,
    required this.onViewPriceBreakdown,
  });

  final String brand;
  final String model;
  final String price;
  final String imageUrl;
  final VoidCallback onViewPriceBreakdown;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.premiumBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(12),
            ),
            child: Container(
              height: 150,
              width: double.infinity,
              color: Colors.white,
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: AppColors.divider,
                  child: const Center(
                    child: Icon(
                      Icons.image_not_supported_outlined,
                      color: AppColors.textDisabled,
                      size: 40,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Row(
              children: [
                Text(
                  brand,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    height: 1.1,
                  ),
                ),
                const Spacer(),
                Text(
                  price,
                  style: const TextStyle(
                    color: AppColors.teal,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    height: 1.1,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Text(
              model,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 12,
                height: 1.1,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: ElevatedButton(
              onPressed: onViewPriceBreakdown,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.surface,
                foregroundColor: AppColors.teal,
                minimumSize: const Size.fromHeight(36),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(color: AppColors.teal),
                ),
              ),
              child: const Text(
                'View Price Breakdown',
                style: TextStyle(
                  color: AppColors.teal,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  height: 1.1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ==================== SHARED LAYOUT HELPERS ====================

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Text(
        title,
        style: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: 17,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.2,
          height: 1.2,
        ),
      ),
    );
  }
}

class _Sheet extends StatelessWidget {
  const _Sheet({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
          bottom: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}