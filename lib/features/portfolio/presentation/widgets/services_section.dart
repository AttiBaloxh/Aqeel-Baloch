import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/responsive.dart';

import '../../data/models/service_model.dart';

class ServicesSection extends StatefulWidget {
  const ServicesSection({super.key});

  @override
  State<ServicesSection> createState() => _ServicesSectionState();
}

class _ServicesSectionState extends State<ServicesSection> {
  bool _hasAnimated = false;

  final List<ServiceModel> services = const [
    ServiceModel(
      title: 'Mobile Development',
      description:
          'Building high-performance, cross-platform mobile apps using Flutter with a focus on native feel and smooth animations.',
      icon: Icons.phone_android_rounded,
      index: '01',
    ),
    ServiceModel(
      title: 'Web Development',
      description:
          'Creating responsive and interactive web applications that scale. Expertise in Flutter Web and modern web standards.',
      icon: Icons.web_rounded,
      index: '02',
    ),
    ServiceModel(
      title: 'UI/UX Design',
      description:
          'Designing intuitive user interfaces and experiences that delight users. Focus on modern aesthetics and usability.',
      icon: Icons.design_services_rounded,
      index: '03',
    ),
    ServiceModel(
      title: 'Backend Integration',
      description:
          'Seamlessly connecting apps with robust backends like Firebase, Node.js, and external REST/GraphQL APIs.',
      icon: Icons.cloud_sync_rounded,
      index: '04',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('services-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2 && !_hasAnimated) {
          setState(() => _hasAnimated = true);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 120),
        decoration: const BoxDecoration(color: AppColors.background),
        child: Column(
          children: [
            FadeInDown(
              animate: _hasAnimated,
              child: const _SectionHeader(title: 'OUR EXPERTISE'),
            ),
            const SizedBox(height: 24),
            FadeInDown(
              animate: _hasAnimated,
              delay: const Duration(milliseconds: 200),
              child: const _SectionTitle(
                title: "Custom Solutions For\nYour Digital Growth",
              ),
            ),
            const SizedBox(height: 80),
            Responsive(
              mobile: Column(
                children: services
                    .map((s) => _ServiceCard(service: s))
                    .toList(),
              ),
              desktop: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 32,
                  mainAxisSpacing: 32,
                  childAspectRatio: 2.2,
                ),
                itemCount: services.length,
                itemBuilder: (context, index) =>
                    _ServiceCard(service: services[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.primary.withAlpha(26),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.primary.withAlpha(51)),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.w900,
          letterSpacing: 4,
          fontSize: 12,
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.displaySmall?.copyWith(
        fontWeight: FontWeight.w900,
        height: 1.2,
        color: Colors.white,
      ),
    );
  }
}

class _ServiceCard extends StatefulWidget {
  final ServiceModel service;
  const _ServiceCard({required this.service});

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOutCubic,
        margin: const EdgeInsets.only(bottom: 24),
        transform: Matrix4.translationValues(0, _isHovered ? -10 : 0, 0),
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          color: _isHovered
              ? AppColors.surface.withAlpha(204)
              : AppColors.surface.withAlpha(77),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: _isHovered
                ? AppColors.primary.withAlpha(128)
                : Colors.white.withAlpha(13),
          ),
          boxShadow: [
            if (_isHovered)
              BoxShadow(
                color: AppColors.primary.withAlpha(26),
                blurRadius: 40,
                offset: const Offset(0, 20),
              ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              right: -10,
              top: -10,
              child: Text(
                widget.service.index,
                style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.w900,
                  color: Colors.white.withAlpha(8),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: _isHovered
                        ? AppColors.primary
                        : AppColors.primary.withAlpha(26),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      if (_isHovered)
                        BoxShadow(
                          color: AppColors.primary.withAlpha(102),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                    ],
                  ),
                  child: Icon(
                    widget.service.icon,
                    color: _isHovered ? Colors.white : AppColors.primary,
                    size: 32,
                  ),
                ),
                const SizedBox(width: 32),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.service.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        widget.service.description,
                        style: TextStyle(
                          color: _isHovered
                              ? Colors.white.withAlpha(204)
                              : AppColors.textBody,
                          fontSize: 16,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
