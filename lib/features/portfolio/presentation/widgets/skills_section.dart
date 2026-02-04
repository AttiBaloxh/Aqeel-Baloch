import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../../core/constants/app_colors.dart';
import '../../domain/entities/skill.dart';
import '../providers/portfolio_providers.dart';

class SkillsSection extends ConsumerStatefulWidget {
  const SkillsSection({super.key});

  @override
  ConsumerState<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends ConsumerState<SkillsSection> {
  final ScrollController _scrollController = ScrollController();
  Timer? _timer;
  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAutoScroll();
    });
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      if (_scrollController.hasClients) {
        final maxScroll = _scrollController.position.maxScrollExtent;
        final currentScroll = _scrollController.offset;

        if (currentScroll >= maxScroll) {
          _scrollController.jumpTo(0);
        } else {
          _scrollController.jumpTo(currentScroll + 1);
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final skillsAsync = ref.watch(skillsProvider);

    return VisibilityDetector(
      key: const Key('skills-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2 && !_hasAnimated) {
          setState(() {
            _hasAnimated = true;
          });
        }
      },
      child: RepaintBoundary(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 80),
          color: AppColors.background,
          child: FadeInUp(
            animate: _hasAnimated,
            duration: const Duration(milliseconds: 800),
            child: Column(
              children: [
                const Text(
                  'SKILLS & TOOLS',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 6,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Technologies I Master",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 60),
                skillsAsync.when(
                  data: (skills) => _SkillsList(
                    skills: skills,
                    controller: _scrollController,
                  ),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (err, stack) => Center(child: Text('Error: $err')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SkillsList extends StatelessWidget {
  final List<Skill> skills;
  final ScrollController controller;

  const _SkillsList({required this.skills, required this.controller});

  @override
  Widget build(BuildContext context) {
    final displaySkills = [...skills, ...skills];
    return SizedBox(
      height: 180,
      child: ListView.builder(
        controller: controller,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: displaySkills.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: _HoverCard(skill: displaySkills[index]),
          );
        },
      ),
    );
  }
}

class _HoverCard extends StatefulWidget {
  final Skill skill;

  const _HoverCard({required this.skill});

  @override
  State<_HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<_HoverCard> {
  bool _isHovered = false;

  Color _getBrandColor(String name) {
    final lowerName = name.toLowerCase();
    if (lowerName.contains('flutter')) return const Color(0xFF02569B);
    if (lowerName.contains('dart')) return const Color(0xFF0175C2);
    if (lowerName.contains('react')) return const Color(0xFF61DAFB);
    if (lowerName.contains('next.js')) return Colors.white;
    if (lowerName.contains('js') || lowerName.contains('javascript')) {
      return const Color(0xFFF7DF1E);
    }
    if (lowerName.contains('firebase')) return const Color(0xFFFFA611);
    if (lowerName.contains('python')) return const Color(0xFF3776AB);
    if (lowerName.contains('node')) return const Color(0xFF339933);
    if (lowerName.contains('aws')) return const Color(0xFFFF9900);
    if (lowerName.contains('git')) return const Color(0xFFF05032);
    if (lowerName.contains('docker')) return const Color(0xFF2496ED);
    if (lowerName.contains('swift')) return const Color(0xFFFA7343);
    if (lowerName.contains('kotlin')) return const Color(0xFF7F52FF);
    return Colors.white70;
  }

  IconData _getIcon(String name) {
    final lowerName = name.toLowerCase();
    if (lowerName.contains('flutter')) return FontAwesomeIcons.flutter;
    if (lowerName.contains('dart')) return Icons.bolt;
    if (lowerName.contains('react')) return FontAwesomeIcons.react;
    if (lowerName.contains('js') || lowerName.contains('javascript')) {
      return FontAwesomeIcons.js;
    }
    if (lowerName.contains('python')) return FontAwesomeIcons.python;
    if (lowerName.contains('node')) return FontAwesomeIcons.nodeJs;
    if (lowerName.contains('aws')) return FontAwesomeIcons.aws;
    if (lowerName.contains('git')) return FontAwesomeIcons.gitAlt;
    if (lowerName.contains('docker')) return FontAwesomeIcons.docker;
    if (lowerName.contains('swift')) return FontAwesomeIcons.swift;
    if (lowerName.contains('kotlin')) return Icons.android;
    if (lowerName.contains('figma')) return FontAwesomeIcons.figma;
    return Icons.code;
  }

  @override
  Widget build(BuildContext context) {
    final brandColor = _getBrandColor(widget.skill.name);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 130,
        decoration: BoxDecoration(
          color: _isHovered ? Colors.white.withAlpha(13) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _isHovered
                ? brandColor.withAlpha(128)
                : Colors.white.withAlpha(13),
            width: 1.5,
          ),
          boxShadow: [
            if (_isHovered)
              BoxShadow(
                color: brandColor.withAlpha(38),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.matrix(
                _isHovered
                    ? [
                        1,
                        0,
                        0,
                        0,
                        0,
                        0,
                        1,
                        0,
                        0,
                        0,
                        0,
                        0,
                        1,
                        0,
                        0,
                        0,
                        0,
                        0,
                        1,
                        0,
                      ]
                    : [
                        0.2126,
                        0.7152,
                        0.0722,
                        0,
                        0,
                        0.2126,
                        0.7152,
                        0.0722,
                        0,
                        0,
                        0.2126,
                        0.7152,
                        0.0722,
                        0,
                        0,
                        0,
                        0,
                        0,
                        1,
                        0,
                      ],
              ),
              child: AnimatedScale(
                scale: _isHovered ? 1.1 : 1.0,
                duration: const Duration(milliseconds: 300),
                child: FaIcon(
                  _getIcon(widget.skill.name),
                  size: 40,
                  color: _isHovered ? brandColor : Colors.white24,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.skill.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: _isHovered ? Colors.white : Colors.white24,
                fontSize: 11,
                fontWeight: _isHovered ? FontWeight.bold : FontWeight.normal,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
