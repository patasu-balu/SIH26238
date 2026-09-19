import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary Palette - Deep Teal / Emerald & Warm Gold (Symbolic of Empowerment & Education)
  static const Color primary = Color(0xFF0D5C75);
  static const Color primaryLight = Color(0xFF197897);
  static const Color primaryDark = Color(0xFF083E50);

  static const Color secondary = Color(0xFFE68310);
  static const Color secondaryLight = Color(0xFFF79A2B);

  static const Color accent = Color(0xFF10B981); // Vibrant Emerald

  // Background & Neutral Colors
  static const Color lightBackground = Color(0xFFF8FAFC);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightCard = Color(0xFFFFFFFF);

  static const Color darkBackground = Color(0xFF0F172A);
  static const Color darkSurface = Color(0xFF1E293B);
  static const Color darkCard = Color(0xFF1E293B);

  // Border & Divider Colors
  static const Color lightBorder = Color(0xFFE2E8F0);
  static const Color darkBorder = Color(0xFF334155);

  // Text Colors
  static const Color textPrimaryLight = Color(0xFF0F172A);
  static const Color textSecondaryLight = Color(0xFF64748B);
  static const Color textPrimaryDark = Color(0xFFF8FAFC);
  static const Color textSecondaryDark = Color(0xFF94A3B8);

  // Status & Badge Colors
  static const Color statusUnderVerificationBg = Color(0xFFFEF3C7);
  static const Color statusUnderVerificationText = Color(0xFF92400E);
  static const Color badgeEligibleBg = Color(0xFFD1FAE5);
  static const Color badgeEligibleText = Color(0xFF065F46);

  // Stage Progress Tracker Colors
  static const Color stageCompleted = Color(0xFF10B981);
  static const Color stageActive = Color(0xFF0D5C75);
  static const Color stagePendingLight = Color(0xFFCBD5E1);
  static const Color stagePendingDark = Color(0xFF475569);

  // Avatar Placeholder Accent
  static const Color avatarBg = Color(0xFFE0F2FE);
  static const Color avatarText = Color(0xFF0369A1);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF0D5C75), Color(0xFF197897)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
