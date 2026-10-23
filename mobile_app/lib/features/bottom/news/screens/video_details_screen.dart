import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_icons.dart';
import '../data/favorites_store.dart';
import '../models/news_video.dart';
import '../utils/format_utils.dart';

/// Frontend-only video details screen showing video metadata and related videos.
class VideoDetailsScreen extends StatelessWidget {
  const VideoDetailsScreen({
    required this.video,
    super.key,
  });

  final NewsVideo video;

  /// Format view count from numeric value to human-readable string.
  String formatViews(int views) {
    if (views >= 1000000) {
      return '~${(views / 1000000).toStringAsFixed(1)}M views';
    } else if (views >= 1000) {
      return '~${(views / 1000).toStringAsFixed(0)}K views';
    }
    return '~$views views';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(video.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimens.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Placeholder for video player
            Container(
              height: 200,
              color: AppColors.surface,
              child: const Center(
                child: Icon(Icons.video_library, size: 80, color: AppColors.disabled),
              ),
            ),
            const SizedBox(height: AppDimens.lg),
            Text(
              video.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: AppDimens.lg),
            Text(
              'Views: ${formatViews(video.viewCount)}',
              style: const TextStyle(fontSize: 14, color: AppColors.textSecondary),
            ),
            const SizedBox(height: AppDimens.lg),
          ],
        ),
      ),
    );
  }
}