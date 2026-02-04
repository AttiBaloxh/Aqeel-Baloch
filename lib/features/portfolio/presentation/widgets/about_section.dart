import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/responsive.dart';

import '../../data/models/stat_model.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  bool _hasAnimated = false;

  final List<StatModel> stats = const [
    StatModel(value: '5+', label: 'Years of Exp.'),
    StatModel(value: '50+', label: 'Projects Done'),
    StatModel(value: '20+', label: 'Happy Clients'),
  ];

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('about-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2 && !_hasAnimated) {
          setState(() => _hasAnimated = true);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 100),
        color: AppColors.surface.withAlpha(77),
        child: Responsive(
          mobile: _AboutContent(
            isMobile: true,
            hasAnimated: _hasAnimated,
            stats: stats,
          ),
          desktop: _AboutContent(
            isMobile: false,
            hasAnimated: _hasAnimated,
            stats: stats,
          ),
        ),
      ),
    );
  }
}

class _AboutContent extends StatelessWidget {
  final bool isMobile;
  final bool hasAnimated;
  final List<StatModel> stats;

  const _AboutContent({
    required this.isMobile,
    required this.hasAnimated,
    required this.stats,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeInDown(
          animate: hasAnimated,
          child: const Text(
            'ABOUT ME',
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
          animate: hasAnimated,
          delay: const Duration(milliseconds: 200),
          child: Text(
            "Designing with Purpose,\nDeveloping with Passion",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.w900,
              fontSize: isMobile ? 32 : 48,
            ),
          ),
        ),
        const SizedBox(height: 60),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isMobile) ...[
              const Expanded(child: _AboutImage()),
              const SizedBox(width: 80),
            ],
            Expanded(
              child: FadeInRight(
                animate: hasAnimated,
                child: Column(
                  crossAxisAlignment: isMobile
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
                  children: [
                    Text(
                      "I am a results-oriented Flutter Developer with a passion for building high-quality, scalable mobile and web applications. With years of experience in the industry, I have mastered the art of transforming complex business requirements into elegant, user-friendly solutions.",
                      textAlign: isMobile ? TextAlign.center : TextAlign.start,
                      style: const TextStyle(
                        color: AppColors.textBody,
                        fontSize: 18,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 32),
                    _StatsGrid(stats: stats),
                    const SizedBox(height: 48),
                    const _ResumeButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _AboutImage extends StatelessWidget {
  const _AboutImage();

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      child: Container(
        height: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withAlpha(26),
              blurRadius: 40,
              offset: const Offset(0, 20),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Image.asset(
            'assets/images/hero_illustration.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class _StatsGrid extends StatelessWidget {
  final List<StatModel> stats;
  const _StatsGrid({required this.stats});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 40,
      runSpacing: 40,
      children: stats.map((stat) => _StatItem(stat: stat)).toList(),
    );
  }
}

class _StatItem extends StatelessWidget {
  final StatModel stat;
  const _StatItem({required this.stat});

  @override
  Widget build(BuildContext context) {
    // Extract the number from string (e.g. "50+" -> 50)
    final numericPart =
        double.tryParse(stat.value.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
    final suffix = stat.value.replaceAll(RegExp(r'[0-9]'), '');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: numericPart),
          duration: const Duration(seconds: 2),
          curve: Curves.easeOutExpo,
          builder: (context, value, child) {
            return Text(
              '${value.toInt()}$suffix',
              style: const TextStyle(
                color: AppColors.primary,
                fontSize: 32,
                fontWeight: FontWeight.w900,
              ),
            );
          },
        ),
        Text(
          stat.label,
          style: const TextStyle(
            color: Colors.white54,
            fontSize: 14,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}

class _ResumeButton extends StatelessWidget {
  const _ResumeButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: const Text(
        'Download Resume',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
