import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimens.dart';

/// Reusable top bar used on pages without [TabPageShell].
class PageTopBar extends StatelessWidget {
  const PageTopBar({
    super.key,
    required this.title,
    this.leading,
    this.trailing,
    this.centerTitle = false,
  });

  final String title;
  final Widget? leading;
  final List<Widget>? trailing;
  final bool centerTitle;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        color: AppColors.surface,
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
      ),
    );
  }
}