import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../widgets/custom_cursor.dart';
import '../widgets/hero_section.dart';
import '../widgets/navbar.dart';
import '../widgets/projects_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/about_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/testimonials_section.dart';
import '../widgets/services_section.dart';
import '../widgets/client_slider.dart';
import '../widgets/github_stats_section.dart';
import '../widgets/blog_section.dart';
import '../widgets/faq_section.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<double> _scrollProgressNotifier = ValueNotifier(0);
  final ValueNotifier<int> _activeIndexNotifier = ValueNotifier(0);

  final heroKey = GlobalKey();
  final aboutKey = GlobalKey();
  final servicesKey = GlobalKey();
  final skillsKey = GlobalKey();
  final experienceKey = GlobalKey();
  final projectsKey = GlobalKey();
  final testimonialsKey = GlobalKey();
  final faqKey = GlobalKey();
  final contactKey = GlobalKey<ContactSectionState>();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _scrollProgressNotifier.dispose();
    _activeIndexNotifier.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    // Progress calculation
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    _scrollProgressNotifier.value = (currentScroll / maxScroll).clamp(0, 1);

    // Active Index calculation
    final sectionKeys = [
      heroKey,
      aboutKey,
      servicesKey,
      skillsKey,
      experienceKey,
      projectsKey,
      testimonialsKey,
      faqKey,
      contactKey,
    ];

    int newIndex = 0;
    double minDistance = double.infinity;
    const double navbarHeight = 80;

    for (int i = 0; i < sectionKeys.length; i++) {
      final context = sectionKeys[i].currentContext;
      if (context != null) {
        final box = context.findRenderObject() as RenderBox;
        final offset = box.localToGlobal(Offset.zero).dy;

        // We want the section that is closest to the navbar bottom (top of screen + height)
        // Adjust weight: sections already passed (negative offset) are less likely unless they are still covering the screen
        final distance = (offset - navbarHeight).abs();

        if (distance < minDistance) {
          minDistance = distance;
          newIndex = i;
        }
      }
    }

    if (_activeIndexNotifier.value != newIndex) {
      _activeIndexNotifier.value = newIndex;
    }
  }

  void scrollToSection(GlobalKey key) {
    if (key.currentContext == null) return;
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.fastOutSlowIn,
      alignment: 0.05, // Slight alignment adjustment to account for navbar
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomCursor(
        child: SelectionArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    HeroSection(key: heroKey),
                    const ClientSlider(),
                    AboutSection(key: aboutKey),
                    ServicesSection(key: servicesKey),
                    SkillsSection(key: skillsKey),
                    ExperienceSection(key: experienceKey),
                    const GitHubStatsSection(),
                    ProjectsSection(key: projectsKey),
                    const BlogSection(),
                    TestimonialsSection(key: testimonialsKey),
                    FaqSection(key: faqKey),
                    ContactSection(key: contactKey),
                    _buildFooter(),
                  ],
                ),
              ),
              // Sticky Navbar & Progress Bar
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.background.withAlpha(204),
                            AppColors.background.withAlpha(0),
                          ],
                        ),
                      ),
                      child: ValueListenableBuilder<int>(
                        valueListenable: _activeIndexNotifier,
                        builder: (context, activeIndex, child) {
                          return Navbar(
                            selectedIndex: activeIndex,
                            onHomeTap: () => scrollToSection(heroKey),
                            onAboutTap: () => scrollToSection(aboutKey),
                            onServicesTap: () => scrollToSection(servicesKey),
                            onSkillsTap: () => scrollToSection(skillsKey),
                            onExperienceTap: () =>
                                scrollToSection(experienceKey),
                            onProjectsTap: () => scrollToSection(projectsKey),
                            onTestimonialsTap: () =>
                                scrollToSection(testimonialsKey),
                            onFaqTap: () => scrollToSection(faqKey),
                            onContactTap: () => scrollToSection(contactKey),
                          );
                        },
                      ),
                    ),
                    // Progress Bar
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ValueListenableBuilder<double>(
                        valueListenable: _scrollProgressNotifier,
                        builder: (context, progress, child) {
                          return Container(
                            height: 3,
                            width: MediaQuery.of(context).size.width * progress,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.primary,
                                  AppColors.secondary,
                                  AppColors.accent,
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      width: double.infinity,
      color: AppColors.surface.withAlpha(128),
      child: const Column(
        children: [
          Text(
            'Built with Flutter 💙',
            style: TextStyle(color: AppColors.textBody),
          ),
          SizedBox(height: 8),
          Text(
            '© 2026 Personal Portfolio. All rights reserved.',
            style: TextStyle(color: AppColors.textBody, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
