import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GitHubStatsSection extends StatelessWidget {
  const GitHubStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 100),
      child: Column(
        children: [
          const Text(
            'OPEN SOURCE CONTRIBUTIONS',
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w900,
              letterSpacing: 4,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "GitHub Statistics",
            style: Theme.of(
              context,
            ).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 80),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              _statCard(FontAwesomeIcons.codeCommit, "1,200+", "Total Commits"),
              _statCard(FontAwesomeIcons.codeMerge, "45+", "Open Source PRs"),
              _statCard(FontAwesomeIcons.star, "500+", "GitHub Stars"),
              _statCard(FontAwesomeIcons.codeBranch, "120+", "Repositories"),
            ],
          ),
          const SizedBox(height: 60),
          _githubActivityChart(),
        ],
      ),
    );
  }

  Widget _statCard(IconData icon, String value, String label) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withAlpha(13)),
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColors.primary, size: 32),
          const SizedBox(height: 24),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(color: AppColors.textBody, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _githubActivityChart() {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 1000),
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withAlpha(13)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(FontAwesomeIcons.github, color: Colors.white),
              SizedBox(width: 12),
              Text(
                "Activity Graph",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 40),
          // Mock contribution grid
          Wrap(
            spacing: 4,
            runSpacing: 4,
            children: List.generate(
              364,
              (index) => Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: index % 5 == 0
                      ? Colors.green.withAlpha(204)
                      : index % 3 == 0
                      ? Colors.green.withAlpha(102)
                      : Colors.white.withAlpha(13),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
