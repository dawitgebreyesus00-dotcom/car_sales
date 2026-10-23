import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_icons.dart';

// Navigation item data - only New item has pale teal capsule
class NavItem {
  final IconData icon;
  final String label;
  final Color inactiveIconColor;
  final Color activeIconColor;
  final Color inactiveLabelColor;
  final Color activeLabelColor;
  final bool hasCapsule; // ONLY New item has capsule
  final Color selectedCapsuleColor;
  final double iconSize;

  const NavItem({
    required this.icon,
    required this.label,
    required this.inactiveIconColor,
    required this.activeIconColor,
    required this.inactiveLabelColor,
    required this.activeLabelColor,
    required this.hasCapsule,
    required this.selectedCapsuleColor,
    required this.iconSize,
  });
}

// All 5 nav items - only index 0 (New) has capsule
// Labels: New, Used, Compare, News, Alerts
const List<NavItem> navItems = const [
  // NEW ITEM (index 0) - Has pale teal capsule
  NavItem(
    icon: AppIcons.newCars,
    label: 'New',
    inactiveIconColor: Color(0xFF62666A),
    inactiveLabelColor: Color(0xFF55585C),
    activeIconColor: Color(0xFF267F78),
    activeLabelColor: Color(0xFF267F78),
    hasCapsule: true,
    selectedCapsuleColor: Color(0xFFE8F6F4),
    iconSize: 26,
  ),
  // USED ITEM (index 1) - No capsule, just color change
  NavItem(
    icon: AppIcons.usedCars,
    label: 'Used',
    inactiveIconColor: Color(0xFF62666A),
    inactiveLabelColor: Color(0xFF55585C),
    activeIconColor: Color(0xFF267F78),
    activeLabelColor: Color(0xFF267F78),
    hasCapsule: false,
    selectedCapsuleColor: Color(0xFFE8F6F4),
    iconSize: 26,
  ),
  // COMPARE ITEM (index 2) - No capsule, just color change
  NavItem(
    icon: AppIcons.compare,
    label: 'Compare',
    inactiveIconColor: Color(0xFF62666A),
    inactiveLabelColor: Color(0xFF55585C),
    activeIconColor: Color(0xFF267F78),
    activeLabelColor: Color(0xFF267F78),
    hasCapsule: false,
    selectedCapsuleColor: Color(0xFFE8F6F4),
    iconSize: 26,
  ),
  // NEWS ITEM (index 3) - No capsule, just color change
  NavItem(
    icon: AppIcons.news,
    label: 'News',
    inactiveIconColor: Color(0xFF62666A),
    inactiveLabelColor: Color(0xFF55585C),
    activeIconColor: Color(0xFF267F78),
    activeLabelColor: Color(0xFF267F78),
    hasCapsule: false,
    selectedCapsuleColor: Color(0xFFE8F6F4),
    iconSize: 26,
  ),
  // ALERTS ITEM (index 4) - No capsule, just color change
  NavItem(
    icon: AppIcons.alerts,
    label: 'Alerts',
    inactiveIconColor: Color(0xFF62666A),
    inactiveLabelColor: Color(0xFF55585C),
    activeIconColor: Color(0xFF267F78),
    activeLabelColor: Color(0xFF267F78),
    hasCapsule: false,
    selectedCapsuleColor: Color(0xFFE8F6F4),
    iconSize: 26,
  ),
];