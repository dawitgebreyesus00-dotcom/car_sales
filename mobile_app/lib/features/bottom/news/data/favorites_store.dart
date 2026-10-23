import 'package:flutter/foundation.dart';

/// In-memory favourite store for News content. Frontend only — swap the
/// implementation with a backend-backed store later without touching the UI.
class FavoritesStore extends ChangeNotifier {
  FavoritesStore._();

  static final FavoritesStore instance = FavoritesStore._();

  final Set<String> _ids = {};

  bool isFavorite(String id) => _ids.contains(id);

  void toggle(String id) {
    if (!_ids.remove(id)) _ids.add(id);
    notifyListeners();
  }
}
