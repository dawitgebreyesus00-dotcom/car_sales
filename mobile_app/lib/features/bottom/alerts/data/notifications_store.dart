import 'package:flutter/foundation.dart';

import '../models/app_notification.dart';
import 'mock_notifications.dart';

/// In-memory notification store for the Alerts page. Frontend only — when a
/// real backend arrives, keep this class's API (items, unreadCount, markRead,
/// dismiss, clearAll) and swap the data source; the UI does not change.
class NotificationsStore extends ChangeNotifier {
  NotificationsStore._();

  static final NotificationsStore instance = NotificationsStore._();

  List<AppNotification> _items = List<AppNotification>.of(mockNotifications);

  List<AppNotification> get items => List<AppNotification>.unmodifiable(_items);

  bool get hasNotifications => _items.isNotEmpty;

  int get unreadCount => _items.where((n) => !n.read).length;

  void markRead(String id) {
    var changed = false;
    final updated = <AppNotification>[];
    for (final n in _items) {
      if (n.id == id && !n.read) {
        updated.add(n.copyWith(read: true));
        changed = true;
      } else {
        updated.add(n);
      }
    }
    if (!changed) return;
    _items = updated;
    notifyListeners();
  }

  void dismiss(String id) {
    final length = _items.length;
    _items = _items.where((n) => n.id != id).toList();
    if (_items.length != length) notifyListeners();
  }

  void clearAll() {
    if (_items.isEmpty) return;
    _items = [];
    notifyListeners();
  }

  /// Test-only hook to reset the singleton between sessions.
  @visibleForTesting
  void reset() {
    _items = List<AppNotification>.of(mockNotifications);
    notifyListeners();
  }
}
