import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../shared/common/car_details/car_details_screen.dart';
import '../../../../shared/common/filter_results/filter_results.dart';
import '../../../../features/bottom/news/data/mock_news_repository.dart';
import '../../../../shared/widgets/page_top_bar.dart';
import '../../../../shared/widgets/placeholder_screen.dart';
import '../../../../shared/common/search/search.dart';
import 'data/notifications_store.dart';
import 'models/app_notification.dart';

/// Alerts page: a frontend-only notification feed with read/unread states,
/// swipe-to-dismiss, clear-all, and an empty "All Caught Up" state.
class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: NotificationsStore.instance,
      builder: (context, _) {
        final store = NotificationsStore.instance;
        return ColoredBox(
          color: AppColors.surface,
          child: SafeArea(
            child: Column(
              children: [
                _buildHeader(store),
                Expanded(
                  child: store.hasNotifications
                      ? _buildNotificationList(store)
                      : const _EmptyState(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(NotificationsStore store) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(bottom: BorderSide(color: AppColors.divider)),
      ),
      child: PageTopBar(
        title: 'Notifications',
        trailing: [
          if (store.hasNotifications)
            TextButton(
              onPressed: clearAll,
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(horizontal: 8),
              ),
              child: const Text(
                'Clear all',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildNotificationList(NotificationsStore store) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(top: AppDimens.xs),
      itemCount: store.items.length,
      separatorBuilder: (_, _) =>
          const Divider(height: 1, color: AppColors.divider),
      itemBuilder: (context, index) {
        final notification = store.items[index];
        return Dismissible(
          key: ValueKey(notification.id),
          direction: DismissDirection.endToStart,
          onDismissed: (_) => store.dismiss(notification.id),
          background: Container(
            color: AppColors.red,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: AppDimens.xl),
            child: const Icon(Icons.delete_outline, color: Colors.white),
          ),
          child: _NotificationRow(notification: notification),
        );
      },
    );
  }

  void clearAll() {
    NotificationsStore.instance.clearAll();
  }
}

/// Single notification row with read/unread styling, optional car thumbnail,
/// an optional action button, and tap-to-open behaviour.
class _NotificationRow extends StatelessWidget {
  const _NotificationRow({required this.notification});

  final AppNotification notification;

  bool get _unread => !notification.read;

  Color _iconColor() {
    switch (notification.type) {
      case AppNotificationType.car:
        return AppColors.teal;
      case AppNotificationType.article:
        return AppColors.primary;
      case AppNotificationType.savedSearch:
        return AppColors.success;
      case AppNotificationType.general:
        return const Color(0xFF8D6E63);
    }
  }

  IconData _icon() {
    switch (notification.type) {
      case AppNotificationType.car:
        return Icons.directions_car_outlined;
      case AppNotificationType.article:
        return AppIcons.news;
      case AppNotificationType.savedSearch:
        return Icons.search;
      case AppNotificationType.general:
        return AppIcons.notification;
    }
  }

  void _handleTap(BuildContext context) {
    final store = NotificationsStore.instance;
    store.markRead(notification.id);
    final navigator = Navigator.of(context);
    switch (notification.type) {
      case AppNotificationType.car:
        final car = allCars
            .where(
              (c) =>
                  notification.targetCarName != null &&
                  c.name.toLowerCase().contains(
                    notification.targetCarName!.toLowerCase(),
                  ),
            )
            .firstOrNull;
        if (car != null) {
          navigator.push(
            MaterialPageRoute<void>(builder: (_) => CarDetailsScreen(car: car)),
          );
        } else {
          navigator.push(
            MaterialPageRoute<void>(
              builder: (_) => const PlaceholderScreen(
                title: 'Car Details',
                subtitle: 'This vehicle is being prepared.',
              ),
            ),
          );
        }
      case AppNotificationType.article:
        final article = MockNewsRepository.articles
            .where((a) => a.id == notification.targetArticleId)
            .firstOrNull;
        if (article != null) {
          navigator.push(
            MaterialPageRoute<void>(
              builder: (_) => const PlaceholderScreen(
                title: 'News Article',
                subtitle: 'This article is being prepared.',
              ),
            ),
          );
        } else {
          navigator.push(
            MaterialPageRoute<void>(
              builder: (_) => const PlaceholderScreen(
                title: 'News Article',
                subtitle: 'This article is being prepared.',
              ),
            ),
          );
        }
      case AppNotificationType.savedSearch:
        navigator.push(
          MaterialPageRoute<void>(builder: (_) => const CarSearchScreen()),
        );
      case AppNotificationType.general:
        navigator.push(
          MaterialPageRoute<void>(
            builder: (_) => const PlaceholderScreen(
              title: 'Notice',
              subtitle: 'More details are coming soon.',
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final read = notification.read;
    final iconColor = _iconColor();
    final icon = _icon();
    return InkWell(
      onTap: () => _handleTap(context),
      child: Container(
        color: read ? AppColors.surface : const Color(0xFFF7FAFF),
        padding: const EdgeInsets.all(AppDimens.lg),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: read
                    ? const Color(0xFFF0F1F4)
                    : iconColor.withValues(alpha: 0.14),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 22,
                color: read ? AppColors.textDisabled : iconColor,
              ),
            ),
            const SizedBox(width: AppDimens.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          notification.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(
                                fontWeight: read
                                    ? FontWeight.w400
                                    : FontWeight.w400,
                                color: read
                                    ? AppColors.textSecondary
                                    : AppColors.textPrimary,
                                height: 1.25,
                              ),
                        ),
                      ),
                      if (_unread) ...[
                        const SizedBox(width: 8),
                        Container(
                          width: 8,
                          height: 8,
                          margin: const EdgeInsets.only(top: 4),
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    notification.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: read
                          ? AppColors.textDisabled
                          : AppColors.textSecondary,
                      height: 1.35,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        notification.timeAgo,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: AppColors.textDisabled,
                        ),
                      ),
                      if (notification.actionLabel != null) const Spacer(),
                      if (notification.actionLabel != null)
                        TextButton(
                          onPressed: () => _handleTap(context),
                          style: TextButton.styleFrom(
                            foregroundColor: AppColors.primary,
                            visualDensity: VisualDensity.compact,
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            minimumSize: const Size(0, 32),
                          ),
                          child: Text(
                            notification.actionLabel!,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            if (notification.carImage != null) ...[
              const SizedBox(width: AppDimens.md),
              ClipRRect(
                borderRadius: BorderRadius.circular(AppDimens.radiusSm),
                child: SizedBox(
                  width: 60,
                  height: 52,
                  child: Image.asset(
                    notification.carImage!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const ColoredBox(
                          color: Color(0xFFEEF1F4),
                          child: Icon(
                            Icons.image_not_supported_outlined,
                            color: AppColors.textDisabled,
                            size: 20,
                          ),
                        ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// "All Caught Up" empty state with an automotive-themed illustration.
class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 72),
        Text(
          'All Caught Up',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'You have seen all notifications',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary),
        ),
        const Expanded(child: SizedBox.shrink()),
        const _AutomotiveEmptyIllustration(),
        const SizedBox(height: 32),
      ],
    );
  }
}

/// Clean automotive-themed illustration (bell + small car) shown near the
/// bottom of the empty state.
class _AutomotiveEmptyIllustration extends StatelessWidget {
  const _AutomotiveEmptyIllustration();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 172,
      height: 172,
      decoration: const BoxDecoration(
        color: Color(0xFFE9F1FB),
        shape: BoxShape.circle,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Icon(
            Icons.notifications_none_rounded,
            size: 80,
            color: AppColors.primaryLight,
          ),
          Positioned(
            right: 8,
            bottom: 8,
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.surface,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.divider),
              ),
              child: const Icon(
                Icons.directions_car,
                size: 22,
                color: AppColors.teal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}






