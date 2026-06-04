import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
      color: AppColors.coral,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : 48,
              vertical: isMobile ? 80 : 100,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "LET'S TALK.",
                  style: isMobile
                      ? AppTextStyles.headline(color: AppColors.pink, fontSize: 56)
                      : AppTextStyles.headline(color: AppColors.pink, fontSize: 88),
                )
                    .animate()
                    .fadeIn(duration: 600.ms)
                    .slideY(begin: 0.1, end: 0, duration: 600.ms),
                const SizedBox(height: 16),
                Text(
                  'Open to full-time roles and freelance projects.',
                  style: AppTextStyles.tagline(color: AppColors.lime).copyWith(
                    fontSize: isMobile ? 18 : 24,
                    fontWeight: FontWeight.w500,
                  ),
                )
                    .animate(delay: 150.ms)
                    .fadeIn(duration: 500.ms),
                const SizedBox(height: 56),
                _ContactItem(
                  index: '01',
                  label: 'kamurandgn@gmail.com',
                  onTap: () => _launch('mailto:kamurandgn@gmail.com'),
                ),
                const SizedBox(height: 20),
                _ContactItem(
                  index: '02',
                  label: 'github.com/kamurandogan',
                  onTap: () => _launch('https://github.com/kamurandogan'),
                ),
                const SizedBox(height: 20),
                _ContactItem(
                  index: '03',
                  label: 'linkedin.com/in/kamurandogan',
                  onTap: () => _launch('https://linkedin.com/in/kamurandogan'),
                ),
                const SizedBox(height: 80),
                // Footer
                Text(
                  '© 2026 Kamuran Doğan. Crafted with Flutter.',
                  style: AppTextStyles.label(
                    color: AppColors.pink.withValues(alpha: 0.6),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          // Download CV — sağ alt
          Positioned(
            right: isMobile ? 24 : 48,
            bottom: isMobile ? 28 : 48,
            child: _DownloadCvButton(onTap: () => _launch(
              'https://raw.githubusercontent.com/kamurandogan/portfolio/main/assets/cv/Kamuran_Dogan_Flutter_AI_CV.pdf',
            )),
          ),
        ],
      ),
    );
  }
}

class _ContactItem extends StatefulWidget {
  final String index;
  final String label;
  final VoidCallback onTap;

  const _ContactItem({
    required this.index,
    required this.label,
    required this.onTap,
  });

  @override
  State<_ContactItem> createState() => _ContactItemState();
}

class _ContactItemState extends State<_ContactItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              '${widget.index}  ',
              style: AppTextStyles.contactIndex(color: AppColors.lime),
            ),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 150),
              style: AppTextStyles.contactItem(
                color: _hovered ? AppColors.white : AppColors.lime,
              ).copyWith(fontSize: 20),
              child: Text(widget.label),
            ),
          ],
        ),
      ),
    );
  }
}

class _DownloadCvButton extends StatefulWidget {
  final VoidCallback onTap;
  const _DownloadCvButton({required this.onTap});

  @override
  State<_DownloadCvButton> createState() => _DownloadCvButtonState();
}

class _DownloadCvButtonState extends State<_DownloadCvButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          decoration: BoxDecoration(
            color: _hovered ? AppColors.lime : Colors.transparent,
            border: Border.all(color: AppColors.lime, width: 2),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Text(
            'DOWNLOAD CV  ↓',
            style: AppTextStyles.label(
              color: _hovered ? AppColors.black : AppColors.lime,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
