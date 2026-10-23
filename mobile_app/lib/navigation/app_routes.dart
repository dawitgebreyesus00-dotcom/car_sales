/// Centralized route names (Phase 7.2).
class AppRoutes {
  AppRoutes._();

  // Root
  static const String root = '/';

  // Bottom navigation tabs
  static const String newCars = '/new-cars';
  static const String usedCars = '/used-cars';
  static const String compare = '/compare';
  static const String news = '/news';
  static const String alerts = '/alerts';

  // Home / navigation
  static const String home = '/home';
  static const String favourites = '/favourites';

  // Sell
  static const String sellCars = '/sell-cars';
  static const String sellCar = '/sell-car';
  static const String myCars = '/my-cars';
  static const String sellEasyPackages = '/sell-easy-packages';

  // Marketplace tools
  static const String carLoan = '/loan';
  static const String emiCalculator = '/emi';

  // Search / location
  static const String searchCars = '/search-cars';
  static const String location = '/location';

  // New Cars catalogue
  static const String findNewCars = '/find-new-cars';
  static const String upcomingCars = '/upcoming-cars';
  static const String compareCars = '/compare-cars';
  static const String popularBrands = '/popular-brands';
  static const String userReviews = '/user-reviews';
  static const String locateDealer = '/locate-dealer';

  // Used Cars catalogue
  static const String exploreUsedCars = '/explore-used-cars';
  static const String carwaleAssured = '/carwale-assured';
  static const String checkCarValuation = '/check-car-valuation';
  static const String popularCities = '/popular-cities';
  static const String myListings = '/my-listings';
  static const String findDealers = '/find-dealers';

  // Settings
  static const String settings = '/settings';
  static const String language = '/settings/language';
  static const String darkMode = '/settings/dark-mode';
  static const String aboutUs = '/settings/about-us';
  static const String appVersion = '/settings/app-version';
  static const String rateUs = '/rate-us';

  // Others / legal
  static const String others = '/others';
  static const String visitorAgreement = '/visitor-agreement';
  static const String privacyPolicy = '/privacy-policy';

  // Company / support
  static const String companyPhone = '/company-phone';
  static const String connectWithUs = '/connect-with-us';
  static const String notifications = '/notifications';

  // Reserved for future / protected routes
  static const String login = '/auth/login';
  static const String loginRequired = '/auth/login-required';
}
