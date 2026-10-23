/// What a notification links to when tapped.
enum AppNotificationType {
  /// A matching/new vehicle listing — opens a car details screen.
  car,

  /// A new article — opens the article detail screen.
  article,

  /// A saved-search hit — opens the vehicle search screen.
  savedSearch,

  /// Generic alert — opens a simple placeholder screen.
  general,
}

/// A single notification shown on the Alerts page (frontend mock).
class AppNotification {
  const AppNotification({
    required this.id,
    required this.type,
    required this.title,
    required this.description,
    required this.timeAgo,
    this.read = false,
    this.carImage,
    this.actionLabel,
    this.targetArticleId,
    this.targetCarName,
  });

  final String id;
  final AppNotificationType type;
  final String title;
  final String description;
  final String timeAgo;
  final bool read;

  /// Optional vehicle thumbnail shown on the right side of the row.
  final String? carImage;

  /// Optional action button label shown on the row.
  final String? actionLabel;

  /// Navigation target: news article id.
  final String? targetArticleId;

  /// Navigation target: used-car listing name (see Car catalogue).
  final String? targetCarName;

  AppNotification copyWith({bool? read}) => AppNotification(
    id: id,
    type: type,
    title: title,
    description: description,
    timeAgo: timeAgo,
    read: read ?? this.read,
    carImage: carImage,
    actionLabel: actionLabel,
    targetArticleId: targetArticleId,
    targetCarName: targetCarName,
  );
}
