import 'package:flutter/material.dart';

/// Empty drawer (placeholder).
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(child: SizedBox.shrink());
  }
}
