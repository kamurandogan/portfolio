import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class ProjectData {
  final String name;
  final String tagline;
  final String description;
  final Color cardColor;
  final String iconPath;
  final List<String> imagePaths;
  final List<String> techStack;
  final List<String> screenshotPaths;
  final String? appStoreUrl;
  final String? playStoreUrl;

  const ProjectData({
    required this.name,
    required this.tagline,
    required this.description,
    required this.cardColor,
    required this.iconPath,
    required this.imagePaths,
    required this.techStack,
    required this.screenshotPaths,
    this.appStoreUrl,
    this.playStoreUrl,
  });
}

final projects = <ProjectData>[
  ProjectData(
    name: 'BROCCOLAI',
    tagline: 'AI Football Predictions',
    description:
        'Analyzes upcoming matches across top leagues using AI — delivering confidence scores, value bet detection, and a coupon builder. Available on iOS & Android with a freemium model across 7 languages.',
    cardColor: AppColors.broccolaiCard,
    iconPath: 'assets/broccolai/icon.png',
    imagePaths: [
      'assets/broccolai/home_dashboard.png',
      'assets/broccolai/matches.png',
      'assets/broccolai/match_analysis.png',
    ],
    techStack: [
      'Flutter', 'Dart', 'Supabase', 'Edge Functions',
      'Riverpod', 'RevenueCat', 'Firebase', 'Hive',
    ],
    screenshotPaths: [
      'assets/broccolai/ss/home.png',
      'assets/broccolai/ss/matches.png',
      'assets/broccolai/ss/match_analysis.png',
      'assets/broccolai/ss/coupon.png',
    ],
    appStoreUrl: 'https://apps.apple.com/tr/app/broccolai-futbol-tahminleri/id6758902023?l=tr',
    playStoreUrl: 'https://play.google.com/store/apps/details?id=com.kamurandev.broccolai&hl=tr',
  ),
  ProjectData(
    name: 'WEDLIST',
    tagline: 'Wedding & Dowry List Manager',
    description:
        'Helps couples collaboratively manage their wedding wish and dowry lists in real time. Country-aware content, Firebase sync, and in-app purchases — available on iOS & Android.',
    cardColor: AppColors.wedlistCard,
    iconPath: 'assets/wedlist/icon.png',
    imagePaths: [
      'assets/wedlist/logo.png',
      'assets/wedlist/planning.png',
      'assets/wedlist/harcama.png',
      'assets/wedlist/takip.png',
    ],
    techStack: [
      'Flutter', 'Dart', 'Firebase', 'Firestore',
      'Bloc', 'GoRouter', 'IAP', 'Google Ads',
    ],
    screenshotPaths: [
      'assets/wedlist/ss/ss1.png',
      'assets/wedlist/ss/ss2.png',
      'assets/wedlist/ss/ss3.png',
      'assets/wedlist/ss/ss4.png',
      'assets/wedlist/ss/ss5.png',
    ],
    appStoreUrl: 'https://apps.apple.com/tr/app/wedlist-wedding-wish-list/id6752911302?l=tr',
    playStoreUrl: 'https://play.google.com/store/apps/details?id=com.kamurandev.wedlist.wedlist&hl=tr',
  ),
];
