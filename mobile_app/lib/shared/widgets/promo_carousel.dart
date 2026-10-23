import 'dart:async';

import 'package:flutter/material.dart';

/// Auto-scrolling image carousel used for hero banners.
class PromoCarousel extends StatefulWidget {
  const PromoCarousel({
    super.key,
    required this.images,
    required this.height,
    required this.interval,
    this.borderRadius = BorderRadius.zero,
  });

  final List<String> images;
  final double height;
  final Duration interval;
  final BorderRadius borderRadius;

  @override
  State<PromoCarousel> createState() => _PromoCarouselState();
}

class _PromoCarouselState extends State<PromoCarousel> {
  late final PageController _controller = PageController();
  int _index = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(widget.interval, (_) {
      if (!mounted) return;
      _index = (_index + 1) % widget.images.length;
      _controller.animateToPage(_index, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: widget.borderRadius,
      child: SizedBox(
        height: widget.height,
        child: PageView.builder(
          controller: _controller,
          itemCount: widget.images.length,
          itemBuilder: (context, index) => Image.asset(
            'assets/images/${widget.images[index]}',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              color: Theme.of(context).colorScheme.outlineVariant,
              child: const Center(
                child: Icon(Icons.image_not_supported_outlined, size: 48, color: Colors.grey),
              ),
            ),
          ),
        ),
      ),
    );
  }
}