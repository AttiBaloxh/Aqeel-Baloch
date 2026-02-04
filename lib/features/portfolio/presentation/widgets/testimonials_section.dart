import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../../core/constants/app_colors.dart';

class TestimonialsSection extends StatefulWidget {
  const TestimonialsSection({super.key});

  @override
  State<TestimonialsSection> createState() => _TestimonialsSectionState();
}

class _TestimonialsSectionState extends State<TestimonialsSection> {
  bool _hasAnimated = false;

  final List<Map<String, String>> testimonials = [
    {
      'name': 'Sarah Johnson',
      'role': 'CEO at TechStart',
      'comment':
          'Working with this developer was an absolute pleasure. Their attention to detail and ability to deliver high-quality code on time is unmatched.',
      'image': 'SJ',
    },
    {
      'name': 'Michael Chen',
      'role': 'Product Manager',
      'comment':
          'The mobile app developed exceed all our expectations. The UI is stunning and the performance is flawless. Highly recommended!',
      'image': 'MC',
    },
    {
      'name': 'Emma Davis',
      'role': 'Founder of GreenEase',
      'comment':
          'Great communication and technical skills. They truly understood our vision and brought it to life with Flutter.',
      'image': 'ED',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('testimonials-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2 && !_hasAnimated) {
          setState(() => _hasAnimated = true);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 100),
        color: AppColors.surface.withAlpha(77),
        child: Column(
          children: [
            FadeInDown(
              animate: _hasAnimated,
              child: const Text(
                'TESTIMONIALS',
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
                "Feedback From Clients",
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w900),
              ),
            ),
            const SizedBox(height: 80),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: testimonials.map((t) => _testimonialCard(t)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _testimonialCard(Map<String, String> t) {
    return FadeInUp(
      animate: _hasAnimated,
      child: Container(
        width: 350,
        margin: const EdgeInsets.only(right: 32),
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white.withAlpha(13)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(26),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.format_quote_rounded,
              color: AppColors.primary,
              size: 40,
            ),
            const SizedBox(height: 24),
            Text(
              t['comment']!,
              style: const TextStyle(
                color: AppColors.textBody,
                fontSize: 16,
                height: 1.6,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.primary.withAlpha(26),
                  child: Text(
                    t['image']!,
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      t['name']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      t['role']!,
                      style: TextStyle(
                        color: Colors.white.withAlpha(128),
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
