import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../navigation/app_routes.dart';
import '../../../../shared/widgets/page_top_bar.dart';
import '../data/favorites_store.dart';
import '../data/mock_news_repository.dart';
import '../utils/format_utils.dart';
import 'article_detail_screen.dart';
import 'image_gallery_screen.dart';
import '../models/news_article.dart';
import '../models/news_video.dart';
import '../models/vehicle_image_collection.dart';
import 'video_details_screen.dart';
import '../search/news_search_screen.dart';
import '../widgets/news_skeleton_cards.dart';

/// News tab: NEWS & REVIEWS (with category filters) plus an
/// IMAGES & VIDEOS section (with Images / Videos sub-tabs). Frontend only —
/// content comes from [MockNewsRepository] and is ready to be wired to an API.
class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  static const List<String> _mainTabs = ['NEWS & REVIEWS', 'IMAGES & VIDEOS'];

  static const List<String> _mediaTabs = ['Images', 'Videos'];

  static const List<String> _filters = ['All', 'Reviews', 'Special Reports'];

  int _mainTab = 0;
  int _mediaSubTab = 0;
  String _filter = 'All';
  bool _loading = true;

  List<NewsArticle> _articles = const [];
  List<NewsVideo> _videos = const [];
  List<VehicleImageCollection> _collections = const [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final articlesFuture = MockNewsRepository.fetchArticles();
    final videosFuture = MockNewsRepository.fetchVideos();
    final collectionsFuture = MockNewsRepository.fetchCollections();
    final articles = await articlesFuture;
    final videos = await videosFuture;
    final collections = await collectionsFuture;
    if (!mounted) return;
    setState(() {
      _articles = articles;
      _videos = videos;
      _collections = collections;
      _loading = false;
    });
  }

  List<NewsArticle> get _filteredArticles {
    switch (_filter) {
      case 'Reviews':
        return _articles
            .where((a) => a.category == 'Reviews' || a.category == 'Road Test')
            .toList();
      case 'Special Reports':
        return _articles.where((a) => a.category == 'Special Reports').toList();
      default:
        return _articles;
    }
  }

  void _openArticle(NewsArticle article) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => ArticleDetailScreen(article: article),
      ),
    );
  }

  void _openGallery(VehicleImageCollection collection) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => ImageGalleryScreen(collection: collection),
      ),
    );
  }

  void _openVideo(NewsVideo video) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => VideoDetailsScreen(video: video)),
    );
  }

  void _openSearch() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute<void>(builder: (_) => const NewsSearchScreen()));
  }

  void _toggleFavorite(String id) {
    final saved = FavoritesStore.instance.isFavorite(id);
    FavoritesStore.instance.toggle(id);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          saved ? 'Removed from favourites' : 'Saved to favourites',
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              expandedHeight: 250.0,
              floating: false,
              pinned: true,
              title: const Text('Car News'),
              bottom: const TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.remove_red_eye)),
                  Tab(icon: Icon(Icons.image)),
                ],
              ),
            ),
          ],
          body: TabBarView(
            children: [
              _buildNewsTab(),
              _buildMediaTab(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNewsTab() {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppDimens.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Latest Car Reviews',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: AppDimens.lg),
          ...?_filteredArticles.map((article) => ListTile(
            title: Text(article.title),
            subtitle: Text(article.meta),
            onTap: () => _openArticle(article),
          )),
          const SizedBox(height: AppDimens.lg),
          _buildFilterPills(),
        ],
      ),
    );
  }

  Widget _buildMediaTab() {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppDimens.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Image & Video Gallery',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: AppDimens.lg),
          ...?_collections.map((collection) => ListTile(
            title: Text(collection.name),
            onTap: () => _openGallery(collection),
          )),
          const SizedBox(height: AppDimens.lg),
          _buildFilterPills(),
        ],
      ),
    );
  }

  Widget _buildFilterPills() {
    return Wrap(
      spacing: AppDimens.sm,
      children: [
        for (var filter in _filters)
          FilterChip(
            label: Text(filter),
            selected: _filter == filter,
            onSelected: (selected) {
              setState(() => _filter = selected ? filter : 'All');
            },
          ),
      ],
    );
  }
}