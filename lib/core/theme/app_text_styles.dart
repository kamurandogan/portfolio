import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class AppTextStyles {
  static TextStyle display({
    required Color color,
    double? fontSize,
    double letterSpacing = -0.04,
  }) =>
      GoogleFonts.bricolageGrotesque(
        fontSize: fontSize ?? 120,
        fontWeight: FontWeight.w800,
        color: color,
        letterSpacing: letterSpacing,
        height: 0.9,
      );

  static TextStyle displayMobile({required Color color}) =>
      display(color: color, fontSize: 56, letterSpacing: -0.02);

  static TextStyle headline({required Color color, double? fontSize}) =>
      GoogleFonts.bricolageGrotesque(
        fontSize: fontSize ?? 72,
        fontWeight: FontWeight.w800,
        color: color,
        letterSpacing: -0.03,
        height: 1.0,
      );

  static TextStyle navLink({required Color color}) =>
      GoogleFonts.hankenGrotesk(
        fontSize: 64,
        fontWeight: FontWeight.w700,
        color: color,
        letterSpacing: -0.02,
        height: 1.1,
      );

  static TextStyle body({required Color color, double? fontSize}) =>
      GoogleFonts.hankenGrotesk(
        fontSize: fontSize ?? 18,
        fontWeight: FontWeight.w400,
        color: color,
        height: 1.5,
      );

  static TextStyle label({required Color color, double? fontSize}) =>
      GoogleFonts.hankenGrotesk(
        fontSize: fontSize ?? 14,
        fontWeight: FontWeight.w700,
        color: color,
        letterSpacing: 0.05,
      );

  static TextStyle pill({required Color color}) =>
      GoogleFonts.hankenGrotesk(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: color,
        letterSpacing: 0.02,
      );

  static TextStyle tagline({required Color color}) =>
      GoogleFonts.bricolageGrotesque(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: color,
        letterSpacing: -0.01,
      );

  static TextStyle taglineMobile({required Color color}) =>
      tagline(color: color).copyWith(fontSize: 20);

  static TextStyle logo({required Color color}) =>
      GoogleFonts.bricolageGrotesque(
        fontSize: 28,
        fontWeight: FontWeight.w800,
        color: color,
        letterSpacing: -0.02,
      );

  static TextStyle menuTrigger({required Color color}) =>
      GoogleFonts.hankenGrotesk(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: color,
        letterSpacing: 0.02,
      );

  static TextStyle contactItem({required Color color}) =>
      GoogleFonts.hankenGrotesk(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: color,
        decoration: TextDecoration.underline,
        decorationColor: color,
      );

  static TextStyle contactIndex({required Color color}) =>
      GoogleFonts.hankenGrotesk(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: color.withValues(alpha: 0.6),
      );

  static TextStyle cardTitle({required Color color, double? fontSize}) =>
      GoogleFonts.bricolageGrotesque(
        fontSize: fontSize ?? 52,
        fontWeight: FontWeight.w800,
        color: color,
        letterSpacing: -0.03,
        height: 1.0,
      );

  static TextStyle cardTagline({required Color color}) =>
      GoogleFonts.hankenGrotesk(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: color,
        letterSpacing: 0.08,
      );
}
