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
    final cardPadding = isMobile ? 24.0 : 36.0;

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
          child: Stack(
            children: [
              // Scrollable içerik — alt bar yüksekliği kadar padding bırak
              Positioned.fill(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(cardPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Logo + store ikonları aynı satırda
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              widget.project.iconPath,
                              width: isMobile ? 72 : 88,
                              height: isMobile ? 72 : 88,
                              fit: BoxFit.cover,
                              cacheWidth: 176,
                              errorBuilder: (ctx, err, st) => const SizedBox.shrink(),
                            ),
                          ),
                          const Spacer(),
                          if (widget.project.appStoreUrl != null)
                            _StoreIcon(
                              icon: Icons.apple,
                              tooltip: 'App Store',
                              onTap: () => _launch(widget.project.appStoreUrl),
                            ),
                          if (widget.project.playStoreUrl != null) ...[
                            const SizedBox(width: 8),
                            _StoreIcon(
                              icon: Icons.android,
                              tooltip: 'Play Store',
                              onTap: () => _launch(widget.project.playStoreUrl),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 24),
                      // Proje adı
                      Text(
                        widget.project.name,
                        style: AppTextStyles.cardTitle(
                          color: AppColors.blue,
                          fontSize: isMobile ? 36 : 64,
                        ),
                      ),
                      const SizedBox(height: 6),
                      // Tagline
                      Text(
                        widget.project.tagline,
                        style: AppTextStyles.tagline(color: AppColors.blue).copyWith(
                          fontSize: isMobile ? 15 : 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Tech stack chips
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: widget.project.techStack.map((tech) {
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.blue, width: 1.5),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Text(
                              tech,
                              style: AppTextStyles.label(color: AppColors.blue, fontSize: 11),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 20),
                      // Açıklama
                      Text(
                        widget.project.description,
                        style: AppTextStyles.body(
                          color: AppColors.blue.withValues(alpha: 0.75),
                          fontSize: isMobile ? 13 : 15,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Ekran görüntüleri
                      if (widget.project.screenshotPaths.isNotEmpty)
                        SizedBox(
                          height: MediaQuery.of(context).size.height * (isMobile ? 0.22 : 0.38),
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
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StoreIcon extends StatefulWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;

  const _StoreIcon({required this.icon, required this.tooltip, required this.onTap});

  @override
  State<_StoreIcon> createState() => _StoreIconState();
}

class _StoreIconState extends State<_StoreIcon> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.tooltip,
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: _hovered ? AppColors.blue : Colors.transparent,
              border: Border.all(color: AppColors.blue, width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              
              widget.icon,
              color: _hovered ? AppColors.pink : AppColors.blue,
              size: 22,
            ),
          ),
        ),
      ),
    );
  }
}
