import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_icons.dart';
import '../data/favorites_store.dart';
import '../models/vehicle_image_collection.dart';

/// Frontend-only image gallery screen displaying a collection of vehicle images.
class ImageGalleryScreen extends StatelessWidget {
  const ImageGalleryScreen({
    required this.collection,
    super.key,
  });

  final VehicleImageCollection collection;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(collection.name),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: collection.galleryAssets.length,
              itemBuilder: (context, index) {
                final imageUrl = collection.galleryAssets[index];
                return Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(child: CircularProgressIndicator());
                  },
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(AppDimens.lg),
            child: Text(
              'Tap to save favorite',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}