import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

/// News categories supported by the News page (frontend mock).
const List<String> newsCategories = [
  'News',
  'Reviews',
  'Road Test',
  'Features',
  'Special Reports',
  'EV News',
  'New Cars',
  'Used Cars',
  'Car Prices',
  'Maintenance',
  'Buying Guide',
];

/// Accent colour used for a category badge/tag. Kept deterministic so every
/// article with the same category renders consistently.
Color categoryColorOf(String category) {
  switch (category) {
    case 'Reviews':
      return AppColors.accent;
    case 'Road Test':
      return AppColors.teal;
    case 'Features':
      return const Color(0xFF5E35B1);
    case 'Special Reports':
      return AppColors.red;
    case 'EV News':
      return AppColors.success;
    case 'New Cars':
      return AppColors.primaryLight;
    case 'Used Cars':
      return const Color(0xFF6D4C41);
    case 'Car Prices':
      return const Color(0xFFF57F17);
    case 'Maintenance':
      return const Color(0xFF546E7A);
    case 'Buying Guide':
      return const Color(0xFF7B1FA2);
    case 'News':
    default:
      return AppColors.primary;
  }
}

/// A single automotive news article shown in the News tab (frontend mock).
class NewsArticle {
  const NewsArticle({
    required this.id,
    required this.category,
    required this.title,
    required this.imageAsset,
    required this.author,
    required this.timeAgo,
    required this.views,
    required this.body,
    this.publishedDate = '',
    this.priceTag,
    this.keywords = const [],
  });

  final String id;
  final String category;
  final String title;
  final String imageAsset;
  final String author;
  final String timeAgo;
  final int views;
  final List<String> body;
  final String publishedDate;
  final String? priceTag;
  final List<String> keywords;

  /// Image URL for the article (alias for imageAsset)
  String get imageUrl => imageAsset;

  /// Meta information/subtitle for the article
  String get meta => '$author · $timeAgo';

  Color get categoryColor => categoryColorOf(category);

  /// Case-insensitive match against title, category, and search keywords so
  /// users can search by brand, model, article title, or category.
  bool searchMatches(String query) {
    final q = query.trim().toLowerCase();
    if (q.isEmpty) return false;
    return title.toLowerCase().contains(q) ||
        category.toLowerCase().contains(q) ||
        keywords.any((k) => k.toLowerCase().contains(q));
  }
}

