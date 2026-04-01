import 'package:flutter/material.dart';

class AppColors {
  // 🎯 BASE
  static const Color background = Color(0xFFF0FAF7);
  static const Color border = Color(0xFFD0EDE4);

  // 📝 TEXT
  static const Color textBlack = Color(0xFF000000);
  static const Color textPrimary = Color(0xFF1A2E3B);
  static const Color textSecondary = Color(0xFF6B9E8C);
  static const Color textWhite = Color(0xFFFFFFFF);

  // 🌿 PRIMARY (Button & Accent)
  static const Color primary = Color(0xFF2DD4A0);
  static const Color primaryLight = Color(0xFF6EE7C8);
  static const Color primaryDark = Color(0xFF1FA97E);

  // 🚨 STATUS
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color danger = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // 🎨 SOFT BACKGROUND (buat card/status badge)
  static const Color dangerBg = Color(0xFFFFE4E4);
  static const Color warningBg = Color(0xFFFFF3E0);
  static const Color primaryBg = Color(0xFFE6FBF5);

  // 📊 PRIORITY (ML mapping)
  static const Color low = primary;
  static const Color medium = warning;
  static const Color high = danger;

  // 🧊 OPTIONAL GREY (biar fleksibel)
  static const Color greyLight = Color(0xFFE5E7EB);
  static const Color grey = Color(0xFF9CA3AF);
}