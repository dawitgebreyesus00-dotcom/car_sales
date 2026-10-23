import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_icons.dart';
import '../data/favorites_store.dart';
import '../data/mock_news_repository.dart';
import '../models/news_article.dart';
import '../utils/format_utils.dart';

/// Frontend-only article detail: hero image, meta row, article body, and
/// related news cards. Backed entirely by the mock [NewsArticle] passed in.
class ArticleDetailScreen extends StatelessWidget {
  const ArticleDetailScreen({super.key, required this.article});

  final NewsArticle article;

  List<NewsArticle> get _related {
    final all = MockNewsRepository.articles
        .where((a) => a.id != article.id)
        .toList();
    final sameCategory = all
        .where((a) => a.category == article.category)
        .toList();
    final rest = all.where((a) => a.category != article.category).toList();
    return [...sameCategory, ...rest];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimens.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: article.id,
              child: Image.network(
                article.imageUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: AppDimens.lg),
            Text(
              article.meta,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: AppDimens.lg),
            Text(
              article.body.join('\n\n'),
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: AppDimens.lg),
            ...?_related.map((related) => ListTile(
              title: Text(related.title),
              onTap: () {
                // Navigate to related article detail
              },
            )),
          ],
        ),
      ),
    );
  }
}