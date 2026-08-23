import 'package:flutter/material.dart';

abstract class KayanTypography {
  static const String fontHeadlines = 'Bodoni Moda';
  static const String fontBody = 'Inter';

  static const TextStyle displayLg = TextStyle(
    fontFamily: fontHeadlines,
    fontSize: 64,
    fontWeight: FontWeight.w700,
    height: 1.1,
    letterSpacing: -0.02 * 64,
  );

  static const TextStyle headlineLg = TextStyle(
    fontFamily: fontHeadlines,
    fontSize: 40,
    fontWeight: FontWeight.w600,
    height: 1.2,
  );

  static const TextStyle headlineLgMobile = TextStyle(
    fontFamily: fontHeadlines,
    fontSize: 32,
    fontWeight: FontWeight.w600,
    height: 1.2,
  );

  static const TextStyle headlineMd = TextStyle(
    fontFamily: fontHeadlines,
    fontSize: 28,
    fontWeight: FontWeight.w500,
    height: 1.3,
  );

  static const TextStyle bodyLg = TextStyle(
    fontFamily: fontBody,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 1.6,
  );

  static const TextStyle bodyMd = TextStyle(
    fontFamily: fontBody,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.6,
  );

  static const TextStyle labelCaps = TextStyle(
    fontFamily: fontBody,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 1.4,
    letterSpacing: 0.1 * 12,
  );

  static const TextStyle buttonText = TextStyle(
    fontFamily: fontBody,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.0,
    letterSpacing: 0.05 * 14,
  );
}