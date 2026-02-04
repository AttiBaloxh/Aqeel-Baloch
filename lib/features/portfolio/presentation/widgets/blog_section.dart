import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class BlogSection extends StatelessWidget {
  const BlogSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 100),
      color: AppColors.surface.withAlpha(77),
      child: Column(
        children: [
          const Text(
            'ARTICLES & INSIGHTS',
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w900,
              letterSpacing: 4,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Recent Blog Posts",
            style: Theme.of(
              context,
            ).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 80),
          LayoutBuilder(
            builder: (context, constraints) {
              return Wrap(
                spacing: 32,
                runSpacing: 40,
                alignment: WrapAlignment.center,
                children: [
                  _blogCard(
                    "Optimizing Flutter Web Performance",
                    "A deep dive into tree shaking and canvas-kit vs html renderers.",
                    "Feb 10, 2024",
                  ),
                  _blogCard(
                    "Responsive Architecture in Flutter",
                    "How to build apps that look great on any screen size.",
                    "Jan 28, 2024",
                  ),
                  _blogCard(
                    "State Management in 2024",
                    "Riverpod vs Bloc - which one should you choose for your next project?",
                    "Jan 15, 2024",
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _blogCard(String title, String excerpt, String date) {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withAlpha(13)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            date,
            style: const TextStyle(color: AppColors.primary, fontSize: 12),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            excerpt,
            style: const TextStyle(
              color: AppColors.textBody,
              fontSize: 14,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 32),
          TextButton(
            onPressed: () {},
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Read More",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward_rounded, size: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
