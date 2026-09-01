import 'package:flutter/material.dart';

/// Centralized application icon choices (Phase 6.5).
/// Using IconData constants keeps icon usage consistent across the app.
class AppIcons {
  AppIcons._();

  // Navigation
  static const IconData newCars = Icons.directions_car;
  static const IconData usedCars = Icons.car_repair;
  static const IconData compare = Icons.compare_arrows;
  static const IconData news = Icons.article;
  static const IconData alerts = Icons.notifications_active_outlined;

  // Common
  static const IconData search = Icons.search;
  static const IconData favorite = Icons.favorite;
  static const IconData favoriteBorder = Icons.favorite_border;
  static const IconData notification = Icons.notifications_outlined;
  static const IconData menu = Icons.menu;
  static const IconData location = Icons.location_on_outlined;
  static const IconData home = Icons.home_outlined;

  // Marketplace / tools
  static const IconData sell = Icons.sell_outlined;
  static const IconData carLoan = Icons.account_balance_wallet_outlined;
  static const IconData emi = Icons.calculate_outlined;
  static const IconData settings = Icons.settings_outlined;
  static const IconData star = Icons.star_outline;
  static const IconData moreHoriz = Icons.more_horiz;
}
