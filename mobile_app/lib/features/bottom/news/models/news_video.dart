import 'package:flutter/material.dart';

import 'news_article.dart';

/// A mock video entry shown in the IMAGES & VIDEOS → Videos tab.
class NewsVideo {
  const NewsVideo({
    required this.id,
    required this.title,
    required this.imageAsset,
    required this.category,
    required this.author,
    required this.timeAgo,
    required this.views,
    required this.likes,
    required this.duration,
    required this.description,
    this.keywords = const [],
  });

  final String id;
  final String title;
  final String imageAsset;
  final String category;
  final String author;
  final String timeAgo;
  final int views;
  final int likes;
  final String duration;
  final String description;
  final List<String> keywords;

  /// View count for the video (alias for [views])
  int get viewCount => views;

  Color get categoryColor => categoryColorOf(category);

  bool searchMatches(String query) {
    final q = query.trim().toLowerCase();
    if (q.isEmpty) return false;
    return title.toLowerCase().contains(q) ||
        category.toLowerCase().contains(q) ||
        keywords.any((k) => k.toLowerCase().contains(q));
  }
}
