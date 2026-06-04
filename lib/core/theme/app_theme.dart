import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract final class AppTheme {
  static ThemeData get theme => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.coral,
        colorScheme: const ColorScheme.light(
          primary: AppColors.coral,
          secondary: AppColors.lime,
          surface: AppColors.white,
        ),
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
      );
}
