import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimens.dart';

/// Page shell with top bar and trailing actions for tab pages.
/// Uses a simple Column (no Expanded) to work with PageView's infinite height.
/// The child should be a scrollable widget (ListView, CustomScrollView, etc.).
class TabPageShell extends StatelessWidget {
  const TabPageShell({
    super.key,
    required this.title,
    this.leading,
    this.trailing,
    required this.child,
  });

  final String title;
  final Widget? leading;
  final List<Widget>? trailing;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _TopBar(
              title: title,
              leading: leading,
              trailing: trailing,
            ),
            Flexible(
              fit: FlexFit.loose,
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({
    required this.title,
    this.leading,
    this.trailing,
  });

  final String title;
  final Widget? leading;
  final List<Widget>? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.md, vertical: AppDimens.sm),
      child: Row(
        children: [
          if (leading != null) ...[
            leading!,
            const SizedBox(width: AppDimens.sm),
          ],
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.textPrimary,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (trailing != null) ...[
            const SizedBox(width: AppDimens.sm),
            ...trailing!,
          ],
        ],
      ),
    );
  }
}