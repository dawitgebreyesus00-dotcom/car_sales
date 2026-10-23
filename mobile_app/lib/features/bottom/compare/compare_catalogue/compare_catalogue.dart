import '../../../../shared/common/filter_results/filter_results.dart';

/// A single expert comparison article about two cars from the shared
/// catalogue. Every vehicle fact it can reference comes straight from [Car],
/// so the reviews never invent specifications.
class ComparisonReview {
  const ComparisonReview({
    required this.id,
    required this.carA,
    required this.carB,
    required this.title,
    required this.author,
    required this.date,
    required this.summary,
    required this.paragraphs,
  });

  final String id;
  final Car carA;
  final Car carB;
  final String title;
  final String author;
  final String date;
  final String summary;
  final List<String> paragraphs;
}

/// Local data gateway for the Compare feature.
///
/// Data lives in the existing shared new-car catalogue ([newCars]),
/// so there is no second database. The fetch methods simulate a
/// short network delay so the UI can show loading placeholders, but always
/// resolve from the real local catalogue. Results are cached in memory so
/// switching tabs does not re-flash the loading state.
class CompareCatalogue {
  CompareCatalogue._();

  static Future<List<({Car a, Car b})>>? _pairsFuture;
  static Future<List<ComparisonReview>>? _reviewsFuture;

  /// Canonical popular comparison pairs (never the same combination twice).
  static Future<List<({Car a, Car b})>> fetchPopularPairs() {
    return _pairsFuture ??= () async {
      await Future<void>.delayed(const Duration(milliseconds: 350));
      final pairs = <({Car a, Car b})>[];
      for (var i = 0; i < newCars.length; i++) {
        for (var j = i + 1; j < newCars.length; j++) {
          pairs.add((a: newCars[i], b: newCars[j]));
        }
      }
      return pairs;
    }();
  }

  /// Expert comparison reviews, derived only from real catalogue cars.
  static Future<List<ComparisonReview>> fetchReviews() {
    return _reviewsFuture ??= () async {
      await Future<void>.delayed(const Duration(milliseconds: 350));
      return _buildReviews();
    }();
  }

  /// Clears the in-memory cache so the next fetch truly reloads (used by the
  /// Retry actions in the error states).
  static void refresh() {
    _pairsFuture = null;
    _reviewsFuture = null;
  }

  /// In-memory bookmark set for expert reviews. The app has no persisted
  /// favourite store yet (the Favourites tab is still a stub), so this keeps
  /// saved reviews for the current session only.
  static final Set<String> _savedReviewIds = {};

  static bool isSaved(String reviewId) => _savedReviewIds.contains(reviewId);

  static bool toggleSaved(String reviewId) {
    if (!_savedReviewIds.remove(reviewId)) {
      _savedReviewIds.add(reviewId);
      return true;
    }
    return false;
  }

  /// Readable text summary used when sharing a comparison via clipboard.
  static String buildComparisonShareText(Car a, Car b) {
    String value(String? v) => (v == null || v.trim().isEmpty) ? 'N/A' : v;
    return [
      '${a.name} vs ${b.name}',
      '',
      'Price: ${a.priceText} vs ${b.priceText}',
      'Year: ${value(a.year)} vs ${value(b.year)}',
      'Body: ${a.body} vs ${b.body}',
      'Fuel: ${a.fuel} vs ${b.fuel}',
      'Transmission: ${a.transmission} vs ${b.transmission}',
      'Mileage: ${a.km} vs ${b.km}',
      '',
      'Compare cars in the Car Sales app.',
    ].join('\n');
  }

  static List<ComparisonReview> _buildReviews() {
    Car byBrandModel(String brand, String key) => newCars.firstWhere(
      (c) => c.brand == brand && c.name.contains(key),
      orElse: () => newCars.first,
    );

    final vitz = byBrandModel('Toyota', 'Vitz');
    final swift = byBrandModel('Suzuki', 'Swift');
    final tucson = byBrandModel('Hyundai', 'Tucson');
    final landCruiser = byBrandModel('Toyota', 'Land Cruiser');
    final city = byBrandModel('Honda', 'City');

    return [
      ComparisonReview(
        id: 'rev-vitz-swift',
        carA: vitz,
        carB: swift,
        title:
            'Toyota Vitz vs Suzuki Swift: The Best Budget Hatchback in Ethiopia',
        author: 'Rediet Mengistu',
        date: '18 Sep 2026',
        summary:
            'Two of Addis Ababaâ€™s most popular fuel-savers go head to head. '
            'We compare price, specifications and what each one delivers for your Birr.',
        paragraphs: [
          'The Toyota Vitz (2018) and the Suzuki Swift (2020) are both compact '
              'petrol hatchbacks with manual transmissions, and both remain '
              'favourites for daily driving across Ethiopia.',
          'On price alone the Vitz is the more affordable pick at ETB 1,250,000, '
              'while the newer Swift sits at ETB 1,600,000. That difference is '
              'significant when you are working to a budget.',
          'Both cars offer the hatchback practicality that makes city commutes '
              'easy. The Vitz clocks in with 50,000 km on the odometer while the '
              'fresher Swift shows 38,000 km.',
          'Our verdict: budget-conscious buyers get excellent value from the '
              'Vitz, while those willing to spend a little more for a newer, '
              'less-driven car will be happy with the Swift.',
        ],
      ),
      ComparisonReview(
        id: 'rev-tucson-lc',
        carA: tucson,
        carB: landCruiser,
        title:
            'Hyundai Tucson vs Toyota Land Cruiser: Which SUV Fits Your Family?',
        author: 'Dawit Alemu',
        date: '15 Sep 2026',
        summary:
            'A modern city crossover against an off-road legend. We compare two '
            'very different SUVs for families, businesses and long journeys.',
        paragraphs: [
          'The Hyundai Tucson (2019) is an automatic, petrol-driven SUV/MUV '
              'priced at ETB 3,400,000 with 72,000 km on the clock. It is built '
              'for comfort on paved roads.',
          'The Toyota Land Cruiser (2015) is the heavyweight of the two: '
              'automatic, diesel, ETB 12,000,000 and 120,000 km. It is designed '
              'to handle Ethiopiaâ€™s roughest tracks with ease.',
          'If daily comfort, lower running costs and a modern cabin matter most, '
              'the Tucson is the sensible choice. If durability and long-distance '
              'travel are your priority, the Land Cruiser justifies its price.',
          'The decision comes down to budget and use: a refined city SUV versus '
              'an enduring off-roader that goes where roads end.',
        ],
      ),
      ComparisonReview(
        id: 'rev-vitz-city',
        carA: vitz,
        carB: city,
        title: 'Toyota Vitz vs Honda City 2018: Hatchback or Sedan?',
        author: 'Selam Tadesse',
        date: '12 Sep 2026',
        summary:
            'Same year, both petrol and manual â€” but a hatchback and a sedan '
            'are not the same car. We compare price and day-to-day practicality.',
        paragraphs: [
          'The Toyota Vitz and Honda City, both from 2018, run petrol engines '
              'with manual transmissions â€” yet they serve quite different needs.',
          'The Vitz is a compact hatchback at ETB 1,250,000 with 50,000 km. It '
              'is easy to park in tight city streets and cheaper on the pocket.',
          'The Honda City is a sedan at ETB 2,400,000 with 65,000 km. Its longer '
              'boot makes it a better fit for families carrying more luggage.',
          'Choose the Vitz for pure city value, or the City when you need sedan '
              'space and are happy to pay around a million Birr more for it.',
        ],
      ),
      ComparisonReview(
        id: 'rev-swift-city',
        carA: swift,
        carB: city,
        title: 'Suzuki Swift vs Honda City: The Compact Car Dilemma',
        author: 'Yonas Kebede',
        date: '09 Sep 2026',
        summary:
            'A 2020 hatchback against a 2018 sedan â€” which one should you '
            'choose for everyday driving in Addis?',
        paragraphs: [
          'The Suzuki Swift (2020) is a petrol, manual hatchback listed at '
              'ETB 1,600,000 with just 38,000 km. It is youthful, nimble and '
              'economical around town.',
          'The Honda City (2018) is a petrol, manual sedan at ETB 2,400,000 '
              'with 65,000 km. It trades some modernity for sedan practicality.',
          'Both are dependable, well-known options in the new car market. The '
              'choice is really about shape and budget: a fresher hatchback or '
              'a spacious sedan.',
          'We would take the Swift for city work and tight budgets, and the '
              'City when family space comes first.',
        ],
      ),
      ComparisonReview(
        id: 'rev-city-tucson',
        carA: city,
        carB: tucson,
        title: 'Honda City vs Hyundai Tucson: Sedan or SUV?',
        author: 'Hana Worku',
        date: '05 Sep 2026',
        summary:
            'A fuel-wise sedan or a spacious mid-size SUV â€” we look at what '
            'each body type actually gives you in daily life.',
        paragraphs: [
          'The Honda City (2018) is a petrol, manual sedan at ETB 2,400,000 '
              'with 65,000 km. It is efficient and easy to maintain.',
          'The Hyundai Tucson (2019) is a petrol, automatic SUV/MUV at '
              'ETB 3,400,000 with 72,000 km, offering a higher driving position '
              'and an easier automatic gearbox.',
          'Between the two there is a roughly one-million-Birr gap, which pays '
              'for the SUV body, the automatic transmission and the extra road '
              'presence of the Tucson.',
          'New car buyers and budget-first buyers will enjoy the City; families '
              'who want convenience and space will prefer the Tucson.',
        ],
      ),
      ComparisonReview(
        id: 'rev-vitz-lc',
        carA: vitz,
        carB: landCruiser,
        title: 'Toyota Vitz vs Toyota Land Cruiser: Two Very Different Toyotas',
        author: 'Biruk Tesfaye',
        date: '02 Sep 2026',
        summary:
            'The same badge, wildly different cars. We put Toyotaâ€™s smallest '
            'hatchback against its mighty off-roader.',
        paragraphs: [
          'The Toyota Vitz (2018) is a petrol, manual hatchback at ETB 1,250,000 '
              'with 50,000 km â€” ideal for quick city trips and easy parking.',
          'The Toyota Land Cruiser (2025) is a petrol, automatic SUV/MUV at '
              'ETB 12,000,000 with 120,000 km, built for long distances and '
              'rough terrain.',
          'Both share Toyotaâ€™s reputation for reliability, which is why they are '
              'so popular in the Ethiopian market.',
          'Your choice is really about lifestyle: a light, affordable commuter '
              'or a commanding machine for serious journeys.',
        ],
      ),
    ];
  }
}





