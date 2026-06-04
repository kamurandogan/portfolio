import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

const _skills = [
  'Flutter', 'Dart 3', 'Riverpod', 'Bloc', 'Cubit',
  'Clean Architecture', 'MVVM',
  'Supabase', 'Firebase', 'SQLite', 'SQL', 'Hive',
  'Firebase Auth', 'Supabase Auth',
  'RAG Pipeline', 'Prompt Engineering',
  'GoRouter', 'Freezed', 'json_serializable',
  'RevenueCat', 'Google Mobile Ads', 'IAP',
  'Codemagic', 'GitHub', 'Figma', 'Postman',
  'App Store Connect', 'Google Play Console',
];

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final size = MediaQuery.of(context).size;

    return VisibilityDetector(
      key: const Key('skills-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2 && !_visible) {
          setState(() => _visible = true);
        }
      },
      child: Container(
        width: double.infinity,
        height: size.height,
        color: AppColors.lime,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : 48,
              vertical: isMobile ? 48 : 64,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'TECH STACK',
                  style: isMobile
                      ? AppTextStyles.headline(color: AppColors.black, fontSize: 52)
                      : AppTextStyles.headline(color: AppColors.black),
                  textAlign: TextAlign.center,
                )
                    .animate(target: _visible ? 1 : 0)
                    .fadeIn(duration: 500.ms)
                    .slideY(begin: 0.1, end: 0, duration: 500.ms),
                const SizedBox(height: 40),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 720),
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    alignment: WrapAlignment.center,
                    children: _skills.asMap().entries.map((entry) {
                      return _PillChip(
                        label: entry.value,
                        delay: (entry.key * 30).ms,
                        visible: _visible,
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PillChip extends StatefulWidget {
  final String label;
  final Duration delay;
  final bool visible;

  const _PillChip({
    required this.label,
    required this.delay,
    required this.visible,
  });

  @override
  State<_PillChip> createState() => _PillChipState();
}

class _PillChipState extends State<_PillChip> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: _hovered ? AppColors.white : AppColors.black,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(
          widget.label.toUpperCase(),
          style: AppTextStyles.pill(
            color: _hovered ? AppColors.black : AppColors.white,
          ).copyWith(fontSize: 13),
        ),
      )
          .animate(target: widget.visible ? 1 : 0, delay: widget.delay)
          .fadeIn(duration: 400.ms)
          .slideY(begin: 0.15, end: 0, duration: 400.ms),
    );
  }
}
