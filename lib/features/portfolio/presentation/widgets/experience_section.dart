import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../../core/constants/app_colors.dart';
import '../../data/models/experience_model.dart';

class ExperienceSection extends StatefulWidget {
  const ExperienceSection({super.key});

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection> {
  bool _hasAnimated = false;

  final List<ExperienceModel> experiences = const [
    ExperienceModel(
      period: '2023 - Present',
      role: 'Senior Flutter Developer',
      company: 'TechFlow Solutions',
      description:
          'Leading the mobile development team in building enterprise-grade applications using Flutter and Clean Architecture.',
    ),
    ExperienceModel(
      period: '2021 - 2023',
      role: 'Mobile App Developer',
      company: 'AppScale Studios',
      description:
          'Developed and maintained various cross-platform applications for international clients with focus on performance.',
    ),
    ExperienceModel(
      period: '2019 - 2021',
      role: 'Junior Developer',
      company: 'Creative Minds Inc.',
      description:
          'Started professional journey as a web developer, eventually moving into mobile development with Flutter.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('experience-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2 && !_hasAnimated) {
          setState(() => _hasAnimated = true);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 100),
        color: AppColors.background,
        child: Column(
          children: [
            FadeInDown(
              animate: _hasAnimated,
              child: const Text(
                'EXPERIENCE',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 6,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 16),
            FadeInDown(
              animate: _hasAnimated,
              delay: const Duration(milliseconds: 200),
              child: Text(
                "My Professional Journey",
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w900),
              ),
            ),
            const SizedBox(height: 80),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: Column(
                children: List.generate(
                  experiences.length,
                  (index) => _ExperienceItem(
                    experience: experiences[index],
                    isLast: index == experiences.length - 1,
                    index: index,
                    animate: _hasAnimated,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExperienceItem extends StatelessWidget {
  final ExperienceModel experience;
  final bool isLast;
  final int index;
  final bool animate;

  const _ExperienceItem({
    required this.experience,
    required this.isLast,
    required this.index,
    required this.animate,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _TimelineIndicator(isLast: isLast),
          const SizedBox(width: 40),
          Expanded(
            child: FadeInRight(
              animate: animate,
              delay: Duration(milliseconds: 200 + (index * 100)),
              child: _ExperienceContent(experience: experience),
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelineIndicator extends StatelessWidget {
  final bool isLast;
  const _TimelineIndicator({required this.isLast});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary,
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withAlpha(102),
                blurRadius: 10,
              ),
            ],
          ),
        ),
        if (!isLast)
          Expanded(
            child: Container(width: 2, color: AppColors.primary.withAlpha(51)),
          ),
      ],
    );
  }
}

class _ExperienceContent extends StatelessWidget {
  final ExperienceModel experience;
  const _ExperienceContent({required this.experience});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          experience.period,
          style: const TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          experience.role,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        Text(
          experience.company,
          style: TextStyle(color: Colors.white.withAlpha(153), fontSize: 18),
        ),
        const SizedBox(height: 16),
        Text(
          experience.description,
          style: const TextStyle(
            color: AppColors.textBody,
            fontSize: 16,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 60),
      ],
    );
  }
}
