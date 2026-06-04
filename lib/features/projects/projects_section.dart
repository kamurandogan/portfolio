import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import 'project_card.dart';
import 'project_data.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  final _controller = PageController(viewportFraction: 0.72);
  int _current = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _prev() {
    if (_current > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _next() {
    if (_current < projects.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      width: double.infinity,
      height: h,
      color: AppColors.blue,
      child: Stack(
        children: [
          // Slider
          Padding(
            padding: EdgeInsets.only(
              top: isMobile ? 80 : 100,
              bottom: isMobile ? 96 : 112,
            ),
            child: PageView.builder(
              controller: _controller,
              itemCount: projects.length,
              onPageChanged: (i) => setState(() => _current = i),
              itemBuilder: (context, i) {
                final isActive = i == _current;
                return AnimatedScale(
                  scale: isActive ? 1.0 : 0.88,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ProjectCard(
                      project: projects[i],
                      isActive: isActive,
                    ),
                  ),
                );
              },
            ),
          ),
          // Alt ok butonları
          Positioned(
            left: 0,
            right: 0,
            bottom: isMobile ? 24 : 32,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _ArrowButton(icon: '←', onTap: _prev, enabled: _current > 0),
                const SizedBox(width: 16),
                _ArrowButton(
                  icon: '→',
                  onTap: _next,
                  enabled: _current < projects.length - 1,
                ),
              ],
            ),
          ),
          // Üst etiket
          Positioned(
            left: isMobile ? 24 : 48,
            top: isMobile ? 28 : 36,
            child: Text(
              'PROJECTS',
              style: AppTextStyles.label(color: AppColors.lime, fontSize: 13),
            ),
          ),
          // Sayfa göstergesi
          Positioned(
            right: isMobile ? 24 : 48,
            top: isMobile ? 28 : 36,
            child: Text(
              '${_current + 1} / ${projects.length}',
              style: AppTextStyles.label(color: AppColors.lime, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}

class _ArrowButton extends StatefulWidget {
  final String icon;
  final VoidCallback onTap;
  final bool enabled;

  const _ArrowButton({
    required this.icon,
    required this.onTap,
    required this.enabled,
  });

  @override
  State<_ArrowButton> createState() => _ArrowButtonState();
}

class _ArrowButtonState extends State<_ArrowButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.enabled ? widget.onTap : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: widget.enabled
                ? (_hovered ? AppColors.white : AppColors.lime)
                : AppColors.lime.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: Text(
              widget.icon,
              style: TextStyle(
                fontSize: 20,
                color: widget.enabled ? AppColors.blue : AppColors.lime.withValues(alpha: 0.3),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
