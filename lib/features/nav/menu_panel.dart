import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import 'menu_provider.dart';

class MenuPanel extends ConsumerWidget {
  final Map<String, GlobalKey> sectionKeys;
  final void Function(GlobalKey) onNavTap;

  const MenuPanel({super.key, required this.sectionKeys, required this.onNavTap});

  void _go(WidgetRef ref, GlobalKey key) {
    ref.read(menuOpenProvider.notifier).state = false;
    Future.delayed(const Duration(milliseconds: 300), () => onNavTap(key));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOpen = ref.watch(menuOpenProvider);
    final width = MediaQuery.of(context).size.width;
    final panelWidth = width < 600 ? width : width * 0.42;

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
      top: 0,
      bottom: 0,
      right: isOpen ? 0 : -panelWidth,
      width: panelWidth,
      child: Container(
        color: AppColors.pink,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => ref.read(menuOpenProvider.notifier).state = false,
                    child: Text(
                      'Close ×',
                      style: AppTextStyles.menuTrigger(color: AppColors.black)
                          .copyWith(fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                _NavItem(
                  label: 'HOME',
                  onTap: () => _go(ref, sectionKeys['hero']!),
                ),
                _NavItem(
                  label: 'PROJECTS',
                  onTap: () => _go(ref, sectionKeys['projects']!),
                ),
                _NavItem(
                  label: 'SKILLS',
                  onTap: () => _go(ref, sectionKeys['skills']!),
                ),
                _NavItem(
                  label: "LET'S TALK",
                  onTap: () => _go(ref, sectionKeys['contact']!),
                ),
                const Spacer(),
                _ContactLine('kamurandgn@gmail.com'),
                const SizedBox(height: 6),
                _ContactLine('github.com/kamurandogan'),
                const SizedBox(height: 6),
                _ContactLine('linkedin.com/in/kamurandogan'),
                const SizedBox(height: 24),
                Text(
                  'TR | EN',
                  style: AppTextStyles.label(
                    color: AppColors.black.withValues(alpha: 0.4),
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

class _NavItem extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _NavItem({required this.label, required this.onTap});

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
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
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: _hovered ? 16 : 0),
          decoration: BoxDecoration(
            color: _hovered ? AppColors.coral : Colors.transparent,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.label,
                style: AppTextStyles.navLink(
                  color: _hovered ? AppColors.lime : AppColors.black,
                ).copyWith(fontSize: 36),
              ),
              Text(
                '↗',
                style: AppTextStyles.navLink(
                  color: _hovered ? AppColors.lime : AppColors.black,
                ).copyWith(fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactLine extends StatelessWidget {
  final String text;
  const _ContactLine(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyles.body(color: AppColors.black, fontSize: 14),
    );
  }
}
