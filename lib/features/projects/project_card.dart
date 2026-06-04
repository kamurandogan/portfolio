import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import 'project_data.dart';

class ProjectCard extends StatefulWidget {
  final ProjectData project;
  final bool isActive;

  const ProjectCard({super.key, required this.project, required this.isActive});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _hovered = false;

  Future<void> _launch(String? url) async {
    if (url == null) return;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final cardPadding = isMobile ? 28.0 : 40.0;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedScale(
        scale: _hovered && widget.isActive ? 1.02 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.pink,
            borderRadius: BorderRadius.circular(32),
          ),
          padding: EdgeInsets.all(cardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo
              Container(
                width: isMobile ? 72 : 88,
                height: isMobile ? 72 : 88,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.blue.withValues(alpha: 0.08),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    widget.project.iconPath,
                    fit: BoxFit.cover,
                    errorBuilder: (ctx, err, st) => const SizedBox.shrink(),
                  ),
                ),
              ),
              const SizedBox(height: 28),
              // Proje adı
              Text(
                widget.project.name,
                style: AppTextStyles.cardTitle(
                  color: AppColors.blue,
                  fontSize: isMobile ? 40 : 64,
                ),
              ),
              const SizedBox(height: 8),
              // Tagline
              Text(
                widget.project.tagline,
                style: AppTextStyles.tagline(color: AppColors.blue).copyWith(
                  fontSize: isMobile ? 16 : 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 24),
              // Tech stack chips
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: widget.project.techStack.map((tech) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.blue, width: 1.5),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      tech,
                      style: AppTextStyles.label(
                        color: AppColors.blue,
                        fontSize: 12,
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),
              // Açıklama metni
              Text(
                widget.project.description,
                style: AppTextStyles.body(
                  color: AppColors.blue.withValues(alpha: 0.75),
                  fontSize: isMobile ? 13 : 15,
                ),
              ),
              const SizedBox(height: 24),
              // Ekran görüntüleri — kalan dikey alanı kaplar
              if (widget.project.screenshotPaths.isNotEmpty)
                Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.project.screenshotPaths.length,
                    separatorBuilder: (context, i) => const SizedBox(width: 10),
                    itemBuilder: (context, i) => ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        widget.project.screenshotPaths[i],
                        fit: BoxFit.contain,
                        errorBuilder: (ctx, err, st) => const SizedBox.shrink(),
                      ),
                    ),
                  ),
                )
              else
                const Spacer(),
              const SizedBox(height: 20),
              // Store butonları
              Row(
                children: [
                  if (widget.project.appStoreUrl != null)
                    _StoreButton(
                      label: 'App Store',
                      onTap: () => _launch(widget.project.appStoreUrl),
                    ),
                  if (widget.project.playStoreUrl != null) ...[
                    const SizedBox(width: 10),
                    _StoreButton(
                      label: 'Play Store',
                      onTap: () => _launch(widget.project.playStoreUrl),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StoreButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _StoreButton({required this.label, required this.onTap});

  @override
  State<_StoreButton> createState() => _StoreButtonState();
}

class _StoreButtonState extends State<_StoreButton> {
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: _hovered ? AppColors.blue : Colors.transparent,
            border: Border.all(color: AppColors.blue, width: 2),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Text(
            widget.label,
            style: AppTextStyles.label(
              color: _hovered ? AppColors.pink : AppColors.blue,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}
