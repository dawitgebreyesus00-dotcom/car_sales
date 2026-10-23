import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_icons.dart';
import '../screens/article_detail_screen.dart';
import '../screens/image_gallery_screen.dart';
import '../models/news_article.dart';
import '../models/news_video.dart';
import '../utils/format_utils.dart';
import '../screens/video_details_screen.dart';

/// News search screen with category filters and search functionality.
class NewsSearchScreen extends StatelessWidget {
  const NewsSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Search'),
      ),
      body: Center(
        child: Text('News Search Screen'),
      ),
    );
  }

  /// Build the search bar with hint text.
  SearchField buildSearchField(BuildContext context) {
    return SearchField(
      hintText: 'Search for car, model, or review',
      icon: AppIcons.search,
      color: AppColors.textSecondary,
    );
  }

  /// Build category filter pills.
  FilterPills buildFilterPills() {
    return FilterPills(
      items: ['All', 'Reviews', 'Special Reports'],
      colors: [AppColors.teal, AppColors.surface, AppColors.divider],
    );
  }
}

/// Search field widget.
class SearchField extends StatelessWidget {
  const SearchField({
    required this.hintText,
    required this.icon,
    required this.color,
    super.key,
  });

  final String hintText;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon, color: color),
        border: OutlineInputBorder(),
      ),
    );
  }
}

/// Filter pills widget.
class FilterPills extends StatelessWidget {
  const FilterPills({
    required this.items,
    required this.colors,
    super.key,
  });

  final List<String> items;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppDimens.sm,
      children: items.map((item) => FilterChip(
        label: Text(item),
        selected: false,
        onSelected: (_) {},
        labelStyle: const TextStyle(fontSize: 12),
        backgroundColor: colors[1],
      )).toList(),
    );
  }
}