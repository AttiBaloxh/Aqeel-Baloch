import 'package:flutter/material.dart';
import 'package:personal_portfolio/core/constants/app_colors.dart';

class ClientSlider extends StatelessWidget {
  const ClientSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Column(
        children: [
          Text(
            'TRUSTED BY INNOVATIVE COMPANIES',
            style: TextStyle(
              color: AppColors.textBody.withAlpha(128),
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 40),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            child: Row(
              children: [
                // Doubling the list for infinite scrolling effect
                ..._buildLogos(),
                ..._buildLogos(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildLogos() {
    final companies = [
      'Google',
      'Meta',
      'Amazon',
      'Netflix',
      'Tesla',
      'SpaceX',
    ];
    return companies.map((name) => _LogoItem(name: name)).toList();
  }
}

class _LogoItem extends StatelessWidget {
  final String name;
  const _LogoItem({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: Opacity(
        opacity: 0.4,
        child: Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w900,
            letterSpacing: -0.5,
          ),
        ),
      ),
    );
  }
}
