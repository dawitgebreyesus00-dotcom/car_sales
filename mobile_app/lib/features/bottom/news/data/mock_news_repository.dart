import '../models/news_article.dart';
import '../models/news_video.dart';
import '../models/vehicle_image_collection.dart';

/// Mock news content used by the News page. Frontend only — when a backend is
/// introduced, replace the `fetch*` methods with an API-backed repository that
/// returns the same model types; the UI does not need to change.
class MockNewsRepository {
  MockNewsRepository._();

  /// Simulated network latency so the News page can show skeleton loading
  /// states exactly like it will with a real backend.
  static const Duration loadDelay = Duration(milliseconds: 500);

  static Future<List<NewsArticle>> fetchArticles() async {
    await Future<void>.delayed(loadDelay);
    return List<NewsArticle>.unmodifiable(articles);
  }

  static Future<List<NewsVideo>> fetchVideos() async {
    await Future<void>.delayed(loadDelay);
    return List<NewsVideo>.unmodifiable(videos);
  }

  static Future<List<VehicleImageCollection>> fetchCollections() async {
    await Future<void>.delayed(loadDelay);
    return List<VehicleImageCollection>.unmodifiable(collections);
  }

  /// Case-insensitive search across all news content.
  static List<NewsArticle> searchArticles(String query) =>
      articles.where((a) => a.searchMatches(query)).toList();

  static List<NewsVideo> searchVideos(String query) =>
      videos.where((v) => v.searchMatches(query)).toList();

  static List<VehicleImageCollection> searchCollections(String query) =>
      collections.where((c) => c.searchMatches(query)).toList();

  static const List<NewsArticle> articles = [
    NewsArticle(
      id: 'news-ev-ethiopia',
      category: 'News',
      title: 'New Electric Cars Coming to Ethiopia in 2026',
      imageAsset: 'assets/images/photo_10.jpg',
      author: 'Our Automotive Team',
      timeAgo: '1 hour ago',
      views: 1063,
      publishedDate: 'Sep 19, 2026',
      priceTag: 'From ETB 3,850,000',
      keywords: ['EV', 'Electric', 'Vehicle', 'Import', 'Charging'],
      body: [
        'A wave of affordable electric cars is headed to Ethiopia next year. Local importers have signed agreements to bring in compact EVs priced from ETB 3.85 million, a segment that has been waiting for serious options on the market.',
        'The new arrivals will include small hatchbacks and city crossovers aimed at buyers in Addis Ababa. Roadside charging is still limited, so importers are bundling home wall boxes with every vehicle sold in the first six months.',
        'Officials say import duties on fully electric vehicles remain favourable compared with petrol models, which could push demand well beyond current forecasts. Dealers report long waitlists at pre-launch events held across the capital.',
      ],
    ),
    NewsArticle(
      id: 'review-lc300',
      category: 'Reviews',
      title: 'Toyota Land Cruiser 300 Review: Built for Ethiopian Roads',
      imageAsset: 'assets/images/photo_7.jpg',
      author: 'Biruk Tadesse',
      timeAgo: '2 hours ago',
      views: 2407,
      publishedDate: 'Sep 19, 2026',
      priceTag: 'From ETB 12,500,000',
      keywords: ['Toyota', 'Land Cruiser', 'Cruiser', '300', 'SUV'],
      body: [
        'The Land Cruiser 300 remains the benchmark for serious buyers in Ethiopia. We spent a week with the V6 petrol version across the hills around Addis Ababa to see whether it still deserves the crown.',
        'On tarmac the 300 drives with surprising refinement for a large SUV, and the new six-cylinder engine is smoother than the old V8 under hard acceleration. On gravel and wet cobblestones the full-time four-wheel drive inspires complete confidence.',
        'It is a lot of car at a serious price, but resale demand in Ethiopia keeps values remarkably strong. If you need a vehicle that will carry a family and climb anything, there is still nothing better.',
      ],
    ),
    NewsArticle(
      id: 'roadtest-tucson',
      category: 'Road Test',
      title: 'Hyundai Tucson Road Test Across Addis Ababa Hills',
      imageAsset: 'assets/images/photo_6.jpg',
      author: 'Mekdes Alemu',
      timeAgo: '4 hours ago',
      views: 1891,
      publishedDate: 'Sep 19, 2026',
      keywords: ['Hyundai', 'Tucson', 'SUV'],
      body: [
        'Hyundai’s Tucson continues to win buyers who want a modern-looking SUV without a flagship price tag. We took the latest model from Bole to Entoto for a proper road test.',
        'The 2.0-litre petrol is adequate in the city and surprisingly willing on the climb out of town. The cabin is quiet and the infotainment system is one of the easiest to use in its class.',
        'Ground clearance handles the occasional broken pavement with ease, and average fuel consumption settled at a respectable 8.4 litres per 100 km over our loop. A strong all-rounder in the compact SUV class.',
      ],
    ),
    NewsArticle(
      id: 'feature-honda-vs-yaris',
      category: 'Features',
      title: 'City Car Showdown: Honda City vs Toyota Yaris',
      imageAsset: 'assets/images/photo_1.jpg',
      author: 'Solomon Girma',
      timeAgo: '6 hours ago',
      views: 1540,
      publishedDate: 'Sep 19, 2026',
      keywords: ['Honda', 'City', 'Toyota', 'Yaris', 'Hatchback'],
      body: [
        'Two of the most trusted small cars in Ethiopia go head to head: the Honda City and the Toyota Yaris. Both are praised for reliability, but they appeal to very different buyers.',
        'The Yaris is the sharper city car — compact, cheap to run, and easier to park in Addis traffic. The City counters with a bigger boot, more rear legroom, and a smoother highway ride.',
        'Prices overlap closely in the second-hand market, so the choice usually comes down to priorities. Want agility? Take the Yaris. Hauling a family? The City is the better fit.',
      ],
    ),
    NewsArticle(
      id: 'report-import-tax',
      category: 'Special Reports',
      title: 'How Import Taxes Shape Used Car Prices in Ethiopia',
      imageAsset: 'assets/images/photo_2.jpg',
      author: 'Hanna Bekele',
      timeAgo: '1 day ago',
      views: 3215,
      publishedDate: 'Sep 18, 2026',
      keywords: ['Tax', 'Import', 'Price', 'Used Car', 'Market'],
      body: [
        'Ethiopian used car prices are among the most volatile in the region, and much of that comes down to taxation. Duty, surcharges, and VAT stack up before a car ever reaches the showroom floor.',
        'Importers say the tax regime heavily favours smaller, fuel-efficient cars, which explains why budget hatchbacks hold their value so well. Large-diesel SUVs carry noticeably heavier burdens.',
        'Our analysis of the last 12 months shows price shifts of up to 15 percent in a single quarter. Buyers who track the market closely can find real bargains, but timing matters more than haggling.',
      ],
    ),
    NewsArticle(
      id: 'ev-charging',
      category: 'EV News',
      title: 'Addis EV Charging Network: Expansion Plans for 2026',
      imageAsset: 'assets/images/photo_8.jpg',
      author: 'Our Automotive Team',
      timeAgo: '1 day ago',
      views: 986,
      publishedDate: 'Sep 18, 2026',
      keywords: ['EV', 'Electric', 'Charging', 'Addis', 'Station'],
      body: [
        'A plan to expand electric vehicle charging points across the capital was announced this week, targeting a new station in every major district by the end of next year.',
        'The rollout includes fast chargers along the main ring roads and at several large fuel stations, which should ease range anxiety for daily commuters in the city.',
        'Operators expect charging to become a visible part of the Addis traffic scene within 18 months. Early users say the convenience of home charging is still the biggest draw.',
      ],
    ),
    NewsArticle(
      id: 'newcars-lc300-variants',
      category: 'New Cars',
      title: 'Land Cruiser 300 Series: New Variants Coming to Ethiopia',
      imageAsset: 'assets/images/photo_5.jpg',
      author: 'Biruk Tadesse',
      timeAgo: '2 days ago',
      views: 2743,
      publishedDate: 'Sep 17, 2026',
      priceTag: 'From ETB 13,200,000',
      keywords: ['Toyota', 'Land Cruiser', '300', 'GX', 'New Cars'],
      body: [
        'Fresh Land Cruiser 300 variants are set to arrive at local showrooms next quarter, including a long-wheelbase touring edition built for overland travel.',
        'The line-up adds a new interior colour option and an upgraded infotainment package with offline maps — a feature buyers in rural areas have asked for repeatedly.',
        'Dealers will take reservations starting this month. Early interest has been strong, with over 200 deposits already recorded across Addis showrooms.',
      ],
    ),
    NewsArticle(
      id: 'used-market-report',
      category: 'Used Cars',
      title: 'Used Car Market Report: Land Cruiser Leads Addis Sales',
      imageAsset: 'assets/images/photo_7.jpg',
      author: 'Hanna Bekele',
      timeAgo: '3 days ago',
      views: 4102,
      publishedDate: 'Sep 16, 2026',
      keywords: ['Used', 'Land Cruiser', 'Addis', 'Market', 'Pre-owned'],
      body: [
        'Used car showrooms in Addis Ababa report that the Land Cruiser remains the best-selling premium model, holding its value better than any other large SUV.',
        'Demand is especially strong for clean, single-owner examples with full service history. Prices for well-kept 2020 and 2021 models have stayed remarkably stable.',
        'Economy hatchbacks continue to move quickly at the entry level, driven by first-time buyers and ride-hailing operators looking for low running costs.',
      ],
    ),
    NewsArticle(
      id: 'prices-yaris',
      category: 'Car Prices',
      title: 'Toyota Yaris Prices in Birr: What to Pay in 2026',
      imageAsset: 'assets/images/photo_1.jpg',
      author: 'Solomon Girma',
      timeAgo: '4 days ago',
      views: 2320,
      publishedDate: 'Sep 15, 2026',
      priceTag: 'From ETB 1,980,000',
      keywords: ['Toyota', 'Yaris', 'Price', 'Birr', 'Second Hand'],
      body: [
        'If you are in the market for a Toyota Yaris, here is what the market looks like today. Prices depend heavily on model year, mileage, and whether the car has a full service history.',
        'A 2018 model in good condition usually sits between ETB 1.98 million and 2.35 million, while newer low-mileage examples climb steadily toward the top of the range.',
        'Automatic versions command a premium, and buyers are advised to check for accident damage, which remains the biggest variable in the second-hand price.',
      ],
    ),
    NewsArticle(
      id: 'maintenance-checklist',
      category: 'Maintenance',
      title: 'Highland Road Maintenance Checklist for Your Hatchback',
      imageAsset: 'assets/images/photo_2.jpg',
      author: 'Mekdes Alemu',
      timeAgo: '5 days ago',
      views: 1780,
      publishedDate: 'Sep 14, 2026',
      keywords: ['Maintenance', 'Service', 'Checklist', 'Brakes', 'Tyres'],
      body: [
        'Ethiopia’s highland roads are beautiful but demanding on brakes, tyres, and suspension. A short checklist can keep your hatchback safe and reliable for years.',
        'Check brake pads every 10,000 km, rotate tyres with every oil change, and inspect the underbody for rust and stone damage after long trips through the countryside.',
        'Keep an eye on the coolant level, especially during the hot season, and replace the air filter regularly on dusty routes. These small habits prevent expensive repairs.',
      ],
    ),
    NewsArticle(
      id: 'buying-guide-first-car',
      category: 'Buying Guide',
      title: 'First Car in Addis? The 2.5 Million Birr Guide',
      imageAsset: 'assets/images/photo_10.jpg',
      author: 'Our Automotive Team',
      timeAgo: '6 days ago',
      views: 2967,
      publishedDate: 'Sep 13, 2026',
      priceTag: 'Budget up to ETB 2,500,000',
      keywords: ['Buying', 'Guide', 'First Car', 'Birr', 'New Driver'],
      body: [
        'Your first car is a big decision. Around 2.5 million Birr there is a healthy market of dependable hatchbacks and sedans that are easy to maintain in Addis Ababa.',
        'Start with the Toyota Yaris or Honda City if running costs matter most. If you want more space, compact SUVs such as the recently facelifted Hyundai models are worth a test drive.',
        'Always pay for an independent inspection before buying and keep part of your budget for insurance and immediate servicing. Preparation saves thousands of Birr later.',
      ],
    ),
    NewsArticle(
      id: 'news-tucson-spotted',
      category: 'News',
      title: 'Facelifted Hyundai Tucson Spotted Testing in the Capital',
      imageAsset: 'assets/images/photo_6.jpg',
      author: 'Hanna Bekele',
      timeAgo: '1 week ago',
      views: 1355,
      publishedDate: 'Sep 12, 2026',
      keywords: ['Hyundai', 'Tucson', 'Spy', 'Facelift', 'New Cars'],
      body: [
        'A lightly camouflaged version of the Hyundai Tucson was spotted testing around Addis Ababa this week, sparking speculation about a refreshed model for the local market.',
        'Photographers noted revised headlamps and a new front grille, matching changes seen in other markets. Powertrain details were hidden, but a hybrid option is expected.',
        'Hyundai dealers have declined to comment, though insiders suggest an announcement before year end. We will keep you updated as more details emerge.',
      ],
    ),
    NewsArticle(
      id: 'news-taxi-market',
      category: 'News',
      title: 'Special Report: The Future of the Taxi Market in Addis',
      imageAsset: 'assets/images/photo_10.jpg',
      author: 'Biruk Tadesse',
      timeAgo: '2 weeks ago',
      views: 1888,
      publishedDate: 'Sep 8, 2026',
      keywords: ['Taxi', 'Addis', 'Fleet', 'Hatchback', 'Hybrid'],
      body: [
        'Addis Ababa’s taxi market is changing fast. Operators are moving from older saloons toward fuel-efficient hatchbacks and compact SUVs that cut daily running costs.',
        'Finance options and lower price points are making ownership more accessible, and several operators have begun experimenting with hybrid power for long routes.',
        'The shift is reshaping what used car dealers stock, with small, reliable models now turning over faster than any other segment in the capital.',
      ],
    ),
  ];

  static const List<NewsVideo> videos = [
    NewsVideo(
      id: 'video-lc300-walkaround',
      title: 'Toyota Land Cruiser 300 Walkaround',
      imageAsset: 'assets/images/photo_7.jpg',
      category: 'Reviews',
      author: 'Biruk Tadesse',
      timeAgo: '1 day ago',
      views: 644,
      likes: 25,
      duration: '8:12',
      keywords: ['Toyota', 'Land Cruiser', 'Walkaround', '300'],
      description:
          'Join us for a complete walkaround of the Toyota Land Cruiser 300 as we explore the exterior, interior, infotainment, and cargo space from the showroom floor.',
    ),
    NewsVideo(
      id: 'video-yaris-city-drive',
      title: 'Toyota Yaris in the City: A 4-Minute Drive Tour',
      imageAsset: 'assets/images/photo_1.jpg',
      category: 'Road Test',
      author: 'Mekdes Alemu',
      timeAgo: '2 days ago',
      views: 512,
      likes: 19,
      duration: '4:35',
      keywords: ['Toyota', 'Yaris', 'City', 'Drive', 'Road Test'],
      description:
          'A quick 4-minute city drive in the Toyota Yaris through Addis traffic — lane changes, parking, and fuel economy tips from behind the wheel.',
    ),
    NewsVideo(
      id: 'video-honda-vs-yaris',
      title: 'Honda City vs Toyota Yaris: Which to Buy?',
      imageAsset: 'assets/images/photo_10.jpg',
      category: 'Features',
      author: 'Solomon Girma',
      timeAgo: '3 days ago',
      views: 938,
      likes: 41,
      duration: '7:20',
      keywords: ['Honda', 'City', 'Toyota', 'Yaris', 'Compare'],
      description:
          'We line up two of the most trusted small cars in Ethiopia side by side and compare space, running costs, and resale value before the verdict.',
    ),
    NewsVideo(
      id: 'video-ev-charging',
      title: 'EV Charging in Addis: How It Will Work',
      imageAsset: 'assets/images/photo_8.jpg',
      category: 'EV News',
      author: 'Our Automotive Team',
      timeAgo: '4 days ago',
      views: 401,
      likes: 22,
      duration: '6:05',
      keywords: ['EV', 'Electric', 'Charging', 'Addis', 'Station'],
      description:
          'A look at the planned charging network across the capital, home wall boxes, and what EV owners should expect in their first year.',
    ),
    NewsVideo(
      id: 'video-highland-overland',
      title: 'Highland Overlanding in a Land Cruiser',
      imageAsset: 'assets/images/photo_5.jpg',
      category: 'New Cars',
      author: 'Mekdes Alemu',
      timeAgo: '5 days ago',
      views: 1207,
      likes: 88,
      duration: '12:03',
      keywords: ['Overland', 'Land Cruiser', 'Highland', 'Adventure'],
      description:
          'We take the Land Cruiser up through the highland escarpment — cliff roads, river crossings, and camp setup at the summit.',
    ),
    NewsVideo(
      id: 'video-used-car-guide',
      title: 'Used Car Buying Guide for Addis Ababa',
      imageAsset: 'assets/images/photo_6.jpg',
      category: 'Buying Guide',
      author: 'Hanna Bekele',
      timeAgo: '1 week ago',
      views: 730,
      likes: 33,
      duration: '9:48',
      keywords: ['Used', 'Buying', 'Guide', 'Addis', 'Paperwork'],
      description:
          'Paperwork, inspection, and negotiation — everything a first-time used car buyer in Addis Ababa needs to know before handing over Birr.',
    ),
  ];

  static const List<VehicleImageCollection> collections = [
    VehicleImageCollection(
      id: 'col-lc300',
      name: 'Toyota Land Cruiser',
      coverAsset: 'assets/images/photo_7.jpg',
      has360: true,
      keywords: ['Toyota', 'Land Cruiser', '300', 'SUV'],
      galleryAssets: [
        'assets/images/photo_7.jpg',
        'assets/images/photo_5.jpg',
        'assets/images/photo_6.jpg',
        'assets/images/photo_8.jpg',
        'assets/images/photo_1.jpg',
        'assets/images/photo_2.jpg',
        'assets/images/photo_10.jpg',
      ],
    ),
    VehicleImageCollection(
      id: 'col-tucson',
      name: 'Hyundai Tucson',
      coverAsset: 'assets/images/photo_6.jpg',
      has360: true,
      keywords: ['Hyundai', 'Tucson', 'SUV'],
      galleryAssets: [
        'assets/images/photo_6.jpg',
        'assets/images/photo_10.jpg',
        'assets/images/photo_8.jpg',
        'assets/images/photo_1.jpg',
        'assets/images/photo_2.jpg',
        'assets/images/photo_7.jpg',
      ],
    ),
    VehicleImageCollection(
      id: 'col-honda-city',
      name: 'Honda City',
      coverAsset: 'assets/images/photo_10.jpg',
      keywords: ['Honda', 'City', 'Sedan'],
      galleryAssets: [
        'assets/images/photo_10.jpg',
        'assets/images/photo_2.jpg',
        'assets/images/photo_1.jpg',
        'assets/images/photo_6.jpg',
        'assets/images/photo_8.jpg',
        'assets/images/photo_7.jpg',
      ],
    ),
    VehicleImageCollection(
      id: 'col-yaris',
      name: 'Toyota Yaris',
      coverAsset: 'assets/images/photo_1.jpg',
      has360: true,
      keywords: ['Toyota', 'Yaris', 'Hatchback'],
      galleryAssets: [
        'assets/images/photo_1.jpg',
        'assets/images/photo_10.jpg',
        'assets/images/photo_5.jpg',
        'assets/images/photo_2.jpg',
        'assets/images/photo_6.jpg',
        'assets/images/photo_7.jpg',
      ],
    ),
    VehicleImageCollection(
      id: 'col-city-hatch',
      name: 'Honda City Hatchback e:HEV RS',
      coverAsset: 'assets/images/photo_2.jpg',
      keywords: ['Honda', 'City', 'Hatchback', 'Hybrid', 'e:HEV'],
      galleryAssets: [
        'assets/images/photo_2.jpg',
        'assets/images/photo_10.jpg',
        'assets/images/photo_8.jpg',
        'assets/images/photo_1.jpg',
        'assets/images/photo_6.jpg',
        'assets/images/photo_7.jpg',
      ],
    ),
  ];
}
