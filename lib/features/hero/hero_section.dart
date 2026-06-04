import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isMobile = w < 600;

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      color: AppColors.coral,
      child: Stack(
        children: [
          // Ana içerik — tam ortada
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 48,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Devasa başlık
                  Text(
                    'FLUTTER\nDEVELOPER.',
                    style: isMobile
                        ? AppTextStyles.displayMobile(color: AppColors.pink)
                        : AppTextStyles.display(
                            color: AppColors.pink,
                            fontSize: MediaQuery.of(context).size.width * 0.115,
                          ),
                  )
                      .animate()
                      .fadeIn(duration: 600.ms)
                      .slideY(begin: 0.15, end: 0, duration: 600.ms, curve: Curves.easeOut),
                  const SizedBox(height: 28),
                  // Tagline
                  Text(
                    'Building apps that ship.',
                    style: isMobile
                        ? AppTextStyles.taglineMobile(color: AppColors.lime)
                        : AppTextStyles.tagline(color: AppColors.lime),
                  )
                      .animate(delay: 200.ms)
                      .fadeIn(duration: 500.ms)
                      .slideY(begin: 0.1, end: 0, duration: 500.ms, curve: Curves.easeOut),
                ],
              ),
            ),
          ),
          // Sol alt: isim + mail
          Positioned(
            left: isMobile ? 24 : 48,
            bottom: isMobile ? 28 : 36,
            child: Text(
              'Kamuran Doğan — kamurandgn@gmail.com',
              style: AppTextStyles.label(
                color: AppColors.lime,
                fontSize: isMobile ? 12 : 14,
              ),
            )
                .animate(delay: 400.ms)
                .fadeIn(duration: 500.ms),
          ),
          // Sağ alt: scroll indicator
          Positioned(
            right: isMobile ? 24 : 48,
            bottom: isMobile ? 28 : 36,
            child: _ScrollIndicator(),
          ),
        ],
      ),
    );
  }
}

class _ScrollIndicator extends StatefulWidget {
  @override
  State<_ScrollIndicator> createState() => _ScrollIndicatorState();
}

class _ScrollIndicatorState extends State<_ScrollIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);
    _anim = Tween<double>(begin: 0, end: 8).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _anim,
      builder: (context, child) => Transform.translate(
        offset: Offset(0, _anim.value),
        child: Text(
          '↓ SCROLL',
          style: AppTextStyles.label(color: AppColors.lime, fontSize: 12),
        ),
      ),
    );
  }
}

