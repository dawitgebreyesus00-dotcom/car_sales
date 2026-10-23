import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';

/// Car brand logo helper using Simple Icons
/// Provides consistent brand logos across the app
class BrandLogos {
  BrandLogos._();

  /// Get brand icon by brand name
  static IconData? getIcon(String brand) {
    final normalized = brand.toLowerCase().trim();
    return _brandIcons[normalized];
  }

  /// Get icon widget with consistent styling
  static Widget icon(
    String brand, {
    double size = 24,
    Color? color,
  }) {
    final iconData = getIcon(brand);
    if (iconData == null) {
      return _fallbackIcon(brand, size: size, color: color);
    }
    return Icon(
      iconData,
      size: size,
      color: color,
    );
  }

  /// Get colored brand logo widget
  static Widget logo(
    String brand, {
    double size = 32,
    Color? color,
    Color? backgroundColor,
    double borderRadius = 8,
  }) {
    final iconData = getIcon(brand);
    if (iconData == null) {
      return _fallbackLogo(brand, size: size, color: color, backgroundColor: backgroundColor);
    }
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Center(
        child: Icon(
          iconData,
          size: size * 0.6,
          color: color,
        ),
      ),
    );
  }

  static Widget _fallbackIcon(String brand, {double size = 24, Color? color}) {
    return Text(
      brand.isNotEmpty ? brand[0].toUpperCase() : '?',
      style: TextStyle(
        fontSize: size * 0.6,
        fontWeight: FontWeight.w700,
        color: color,
      ),
    );
  }

  static Widget _fallbackLogo(String brand, {
    double size = 32,
    Color? color,
    Color? backgroundColor,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor ?? const Color(0xFFE0E0E0),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          brand.isNotEmpty ? brand[0].toUpperCase() : '?',
          style: TextStyle(
            fontSize: size * 0.5,
            fontWeight: FontWeight.w700,
            color: color ?? Colors.black54,
          ),
        ),
      ),
    );
  }

  /// Mapping of brand names to Simple Icons
  /// Only includes brands confirmed available in simple_icons package
  static final Map<String, IconData> _brandIcons = {
    // Major Japanese brands
    'toyota': SimpleIcons.toyota,
    'honda': SimpleIcons.honda,
    'nissan': SimpleIcons.nissan,
    'mazda': SimpleIcons.mazda,
    'subaru': SimpleIcons.subaru,
    'mitsubishi': SimpleIcons.mitsubishi,
    'suzuki': SimpleIcons.suzuki,

// German
    'bmw': SimpleIcons.bmw,
    'audi': SimpleIcons.audi,
    'volkswagen': SimpleIcons.volkswagen,
    'vw': SimpleIcons.volkswagen,
    'porsche': SimpleIcons.porsche,
    'opel': SimpleIcons.opel,

    // American
    'ford': SimpleIcons.ford,
    'chevrolet': SimpleIcons.chevrolet,
    'chevy': SimpleIcons.chevrolet,
    'jeep': SimpleIcons.jeep,
    'chrysler': SimpleIcons.chrysler,
    'cadillac': SimpleIcons.cadillac,
    'tesla': SimpleIcons.tesla,

    // Korean
    'hyundai': SimpleIcons.hyundai,
    'kia': SimpleIcons.kia,

    // European
    'volvo': SimpleIcons.volvo,
    'fiat': SimpleIcons.fiat,
    'peugeot': SimpleIcons.peugeot,
    'citroen': SimpleIcons.citroen,
    'renault': SimpleIcons.renault,
    'dacia': SimpleIcons.dacia,
    'skoda': SimpleIcons.skoda,
    'seat': SimpleIcons.seat,
    'ferrari': SimpleIcons.ferrari,
    'lamborghini': SimpleIcons.lamborghini,
    'maserati': SimpleIcons.maserati,
    'bentley': SimpleIcons.bentley,
    'rollsroyce': SimpleIcons.rollsroyce,
    'rolls-royce': SimpleIcons.rollsroyce,
    'astonmartin': SimpleIcons.astonmartin,
    'mclaren': SimpleIcons.mclaren,

    // Japanese (other)
    'infiniti': SimpleIcons.infiniti,
    'acura': SimpleIcons.acura,
  };

  /// List of all supported brands
  static List<String> get supportedBrands => _brandIcons.keys.toList()..sort();

  /// Check if brand is supported
  static bool isSupported(String brand) => _brandIcons.containsKey(brand.toLowerCase().trim());
}