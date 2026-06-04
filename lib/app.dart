import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_theme.dart';
import 'features/contact/contact_section.dart';
import 'features/hero/hero_section.dart';
import 'features/nav/floating_nav.dart';
import 'features/nav/menu_panel.dart';
import 'features/projects/projects_section.dart';
import 'features/skills/skills_section.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kamuran Doğan | Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const _PortfolioPage(),
    );
  }
}

class _PortfolioPage extends ConsumerStatefulWidget {
  const _PortfolioPage();

  @override
  ConsumerState<_PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends ConsumerState<_PortfolioPage> {
  final _heroKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _skillsKey = GlobalKey();
  final _contactKey = GlobalKey();

  late final Map<String, GlobalKey> _sectionKeys;
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      final page = _pageController.page?.round() ?? 0;
      if (page != _currentPage) setState(() => _currentPage = page);
    });
    _sectionKeys = {
      'hero': _heroKey,
      'projects': _projectsKey,
      'skills': _skillsKey,
      'contact': _contactKey,
    };
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _scrollToSection(GlobalKey key) {
    final index = [_heroKey, _projectsKey, _skillsKey, _contactKey].indexOf(key);
    if (index != -1) {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 50),
        curve: Curves.elasticIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            children: [
              KeyedSubtree(key: _heroKey, child: const HeroSection()),
              KeyedSubtree(key: _projectsKey, child: const ProjectsSection()),
              KeyedSubtree(key: _skillsKey, child: const SkillsSection()),
              KeyedSubtree(key: _contactKey, child: const ContactSection()),
            ],
          ),
          if (_currentPage == 0)
            FloatingNav(sectionKeys: _sectionKeys, onNavTap: _scrollToSection),
          MenuPanel(sectionKeys: _sectionKeys, onNavTap: _scrollToSection),
        ],
      ),
    );
  }
}
