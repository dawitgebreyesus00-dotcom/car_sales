import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimens.dart';

/// Standalone placeholder screen (own Scaffold + AppBar). Used by pushed
/// routes (e.g. drawer items) until real feature screens replace them.
class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({
    super.key,
    required this.title,
    this.subtitle,
  });

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: PlaceholderContent(title: title, subtitle: subtitle),
    );
  }
}

/// Placeholder content without its own Scaffold. Used inside the navigation
/// shell so the shell can provide the drawer + app bar for tab pages.
class PlaceholderContent extends StatelessWidget {
  const PlaceholderContent({
    super.key,
    required this.title,
    this.subtitle,
  });

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.construction, size: 64, color: AppColors.primary),
            const SizedBox(height: AppDimens.lg),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            if (subtitle != null) ...[
              const SizedBox(height: AppDimens.md),
              Text(
                subtitle!,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
            const SizedBox(height: AppDimens.lg),
            Text(
              'እየተዘጋጀ ነው',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}