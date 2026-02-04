import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/responsive.dart';

class Navbar extends ConsumerWidget {
  final int selectedIndex;
  final VoidCallback onHomeTap;
  final VoidCallback onAboutTap;
  final VoidCallback onServicesTap;
  final VoidCallback onSkillsTap;
  final VoidCallback onExperienceTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onTestimonialsTap;
  final VoidCallback onFaqTap;
  final VoidCallback onContactTap;

  const Navbar({
    super.key,
    required this.selectedIndex,
    required this.onHomeTap,
    required this.onAboutTap,
    required this.onServicesTap,
    required this.onSkillsTap,
    required this.onExperienceTap,
    required this.onProjectsTap,
    required this.onTestimonialsTap,
    required this.onFaqTap,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Text(
                'PORTFOLIO',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(width: 12),
              _availabilityBadge(),
            ],
          ),
          if (!Responsive.isMobile(context))
            Row(
              children: [
                _navItem('Home', 0, onHomeTap),
                const SizedBox(width: 24),
                _navItem('About', 1, onAboutTap),
                const SizedBox(width: 24),
                _navItem('Services', 2, onServicesTap),
                const SizedBox(width: 24),
                _navItem('Skills', 3, onSkillsTap),
                const SizedBox(width: 24),
                _navItem('Experience', 4, onExperienceTap),
                const SizedBox(width: 24),
                _navItem('Projects', 5, onProjectsTap),
                const SizedBox(width: 24),
                _navItem('Reviews', 6, onTestimonialsTap),
                const SizedBox(width: 24),
                _navItem('FAQ', 7, onFaqTap),
                const SizedBox(width: 24),
                _navItem('Contact', 8, onContactTap),
                const SizedBox(width: 32),

                _ctaButton(),
              ],
            )
          else
            IconButton(
              icon: const Icon(Icons.menu, color: AppColors.primary),
              onPressed: () {},
            ),
        ],
      ),
    );
  }

  Widget _availabilityBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.green.withAlpha(26),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.green.withAlpha(51)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(color: Colors.green, blurRadius: 4, spreadRadius: 1),
              ],
            ),
          ),
          const SizedBox(width: 6),
          const Text(
            'Available for Work',
            style: TextStyle(
              color: Colors.green,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _navItem(String title, int index, VoidCallback onTap) {
    final isSelected = selectedIndex == index;
    return InkWell(
      onTap: onTap,
      hoverColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              color: isSelected ? AppColors.primary : AppColors.textHeader,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 2,
            width: isSelected ? 20 : 0,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(2),
              boxShadow: [
                if (isSelected)
                  BoxShadow(
                    color: AppColors.primary.withAlpha(128),
                    blurRadius: 4,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _ctaButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.secondary],
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Text(
        'Hire Me',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
