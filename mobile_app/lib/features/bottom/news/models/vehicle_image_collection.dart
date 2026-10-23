/// A vehicle image collection card for the IMAGES & VIDEOS → Images tab.
/// Each collection bundles a cover shot plus a gallery of local images.
class VehicleImageCollection {
  const VehicleImageCollection({
    required this.id,
    required this.name,
    required this.coverAsset,
    required this.galleryAssets,
    this.has360 = false,
    this.keywords = const [],
  });

  final String id;
  final String name;

  /// Cover image shown on the collection card.
  final String coverAsset;

  /// Full-screen gallery images (local assets). Also drives the image counter.
  final List<String> galleryAssets;

  /// Whether the card shows the "360° View" indicator.
  final bool has360;

  final List<String> keywords;

  int get imageCount => galleryAssets.length;

  bool searchMatches(String query) {
    final q = query.trim().toLowerCase();
    if (q.isEmpty) return false;
    return name.toLowerCase().contains(q) ||
        keywords.any((k) => k.toLowerCase().contains(q));
  }
}
