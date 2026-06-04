import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import 'menu_provider.dart';

class FloatingNav extends ConsumerWidget {
  final Map<String, GlobalKey> sectionKeys;
  final void Function(GlobalKey) onNavTap;

  const FloatingNav({super.key, required this.sectionKeys, required this.onNavTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('KD', style: AppTextStyles.logo(color: AppColors.lime)),
            GestureDetector(
              onTap: () => ref.read(menuOpenProvider.notifier).state = true,
              child: Text(
                'Menu +',
                style: AppTextStyles.menuTrigger(color: AppColors.lime),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
