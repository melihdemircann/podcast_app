import 'package:flutter/material.dart';

class AppTheme {
  // Ana renkler
  static const Color primaryColor = Color(0xFF1E1E2C); // Arka plan rengi
  static const Color backgroundColor = Color(0xFF1E1E2C); // Genel arka plan rengi
  static const Color cardColor = Color(0xFF2A2A3D); // Kartların arka plan rengi
  static const Color textColor = Colors.white; // Başlık ve ana metin rengi
  static const Color subTextColor = Colors.white70; // Alt metin rengi
  static const Color accentColor = Colors.blueAccent; // Vurgulamak istediğiniz renk

  // Filtre çip renkleri
  static const Color filterChipSelectedColor = Color(0xFF4A4A6A); // Seçili filtre çip rengi
  static const Color filterChipUnselectedColor = Color(0xFF2A2A3D); // Seçili olmayan filtre çip rengi

  // Diğer renkler
  static const Color iconColor = Colors.white; // İkon rengi
  static const Color searchBarColor = Color(0xFF2A2A3D); // Arama çubuğu rengi

  // Progress Bar Colors
  static const Color progressBarBackgroundColor = Colors.grey;
  static const Color progressBarColor = Colors.green;

  static final Color bottomNavigationBarColor = Color(0xFF1E1E2C);
  static final Color selectedItemColor = Color(0xFFFFFFFF);
  static final Color unselectedItemColor = Color(0xFFBBBBBB);
}
