import 'dart:math' as math;
import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/responsive.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: const BoxDecoration(color: AppColors.background),
        child: Stack(
          children: [
            // Background Animated Shapes
            const RepaintBoundary(
              child: Stack(
                children: [
                  _AnimatedBackgroundShape(index: 0),
                  _AnimatedBackgroundShape(index: 1),
                  _AnimatedBackgroundShape(index: 2),
                  _AnimatedBackgroundShape(index: 3),
                  _AnimatedBackgroundShape(index: 4),
                ],
              ),
            ),

            // Main Content
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Responsive(
                  mobile: _buildMobileLayout(context),
                  desktop: _buildDesktopLayout(context),
                ),
              ),
            ),

            // Scroll Indicator
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: RepaintBoundary(
                child: FadeInUp(
                  duration: const Duration(seconds: 2),
                  delay: const Duration(seconds: 2),
                  child: Column(
                    children: [
                      Text(
                        'SCROLL',
                        style: TextStyle(
                          color: AppColors.primary.withAlpha(128),
                          fontSize: 10,
                          letterSpacing: 4,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Icon(
                        Icons.keyboard_double_arrow_down_rounded,
                        color: AppColors.primary,
                        size: 24,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      children: [
        const Expanded(flex: 12, child: _HeroContent(isMobile: false)),
        const Spacer(flex: 1),
        Expanded(
          flex: 10,
          child: FadeInRight(
            duration: const Duration(seconds: 1),
            child: const _HeroIllustration(),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: FadeInDown(
            duration: const Duration(seconds: 1),
            child: const _HeroIllustration(),
          ),
        ),
        const _HeroContent(isMobile: true),
        const SizedBox(height: 80),
      ],
    );
  }
}

class _HeroIllustration extends StatelessWidget {
  const _HeroIllustration();

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 450,
            width: 450,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withAlpha(51),
                  blurRadius: 100,
                  spreadRadius: 20,
                ),
                BoxShadow(
                  color: AppColors.secondary.withAlpha(26),
                  blurRadius: 80,
                  spreadRadius: 10,
                ),
              ],
            ),
          ),
          Hero(
            tag: 'hero_img',
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Image.asset(
                'assets/images/hero_illustration.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroContent extends StatelessWidget {
  final bool isMobile;
  const _HeroContent({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        FadeInDown(
          duration: const Duration(milliseconds: 800),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.primary.withAlpha(26),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.primary.withAlpha(51)),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.bolt, color: AppColors.primary, size: 16),
                SizedBox(width: 8),
                Text(
                  'AVAILABLE FOR FREELANCE',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 32),
        FadeInLeft(
          duration: const Duration(milliseconds: 800),
          child: Column(
            crossAxisAlignment: isMobile
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [
              Text(
                "Hi, I'm a professional",
                style: TextStyle(
                  color: Colors.white.withAlpha(179),
                  fontSize: isMobile ? 20 : 28,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 8),
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [
                    AppColors.primary,
                    AppColors.secondary,
                    AppColors.accent,
                  ],
                ).createShader(bounds),
                child: Text(
                  "FLUTTER DEVELOPER",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isMobile ? 40 : 72,
                    height: 1.1,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -1,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        FadeInLeft(
          duration: const Duration(milliseconds: 1000),
          child: SizedBox(
            height: isMobile ? 60 : 80,
            child: DefaultTextStyle(
              style: TextStyle(
                color: AppColors.textBody,
                fontSize: isMobile ? 18 : 24,
                height: 1.5,
                fontWeight: FontWeight.w400,
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    "Crafting premium digital experiences.",
                  ),
                  TypewriterAnimatedText(
                    "Turning complex ideas into simple UIs.",
                  ),
                  TypewriterAnimatedText(
                    "Building scalable cross-platform apps.",
                  ),
                ],
                repeatForever: true,
              ),
            ),
          ),
        ),
        const SizedBox(height: 48),
        FadeInUp(
          duration: const Duration(milliseconds: 1200),
          child: _CTAButtons(isMobile: isMobile),
        ),
      ],
    );
  }
}

class _CTAButtons extends StatelessWidget {
  final bool isMobile;
  const _CTAButtons({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
      children: [
        _HeroButton(
          label: 'View My Work',
          icon: Icons.arrow_forward_rounded,
          onPressed: () {},
          isPrimary: true,
        ),
        _HeroButton(
          label: 'Resume',
          icon: Icons.download_rounded,
          onPressed: () {},
          isPrimary: false,
        ),
      ],
    );
  }
}

class _HeroButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  final bool isPrimary;

  const _HeroButton({
    required this.label,
    required this.icon,
    required this.onPressed,
    required this.isPrimary,
  });

  @override
  Widget build(BuildContext context) {
    if (isPrimary) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withAlpha(77),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 0,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(width: 12),
              Icon(icon, size: 18),
            ],
          ),
        ),
      );
    }
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: BorderSide(color: Colors.white.withAlpha(26)),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 12),
          Icon(icon, size: 18, color: AppColors.primary),
        ],
      ),
    );
  }
}

class _AnimatedBackgroundShape extends StatefulWidget {
  final int index;
  const _AnimatedBackgroundShape({required this.index});

  @override
  State<_AnimatedBackgroundShape> createState() =>
      _AnimatedBackgroundShapeState();
}

class _AnimatedBackgroundShapeState extends State<_AnimatedBackgroundShape>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late double _top;
  late double _left;
  late double _size;
  late Color _color;

  @override
  void initState() {
    super.initState();
    final random = math.Random(widget.index);
    _top = random.nextDouble() * 800;
    _left = random.nextDouble() * 1200;
    _size = 100 + random.nextDouble() * 200;
    _color = [
      AppColors.primary,
      AppColors.secondary,
      AppColors.accent,
    ][random.nextInt(3)].withAlpha(13);

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10 + random.nextInt(10)),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final sinVal = math.sin(_controller.value * 2 * math.pi) * 50;
        final cosVal = math.cos(_controller.value * 2 * math.pi) * 50;
        return Positioned(
          top: _top + sinVal,
          left: _left + cosVal,
          child: Transform.rotate(
            angle: _controller.value * 2 * math.pi,
            child: child,
          ),
        );
      },
      child: Container(
        width: _size,
        height: _size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.index % 2 == 0 ? 40 : 100),
          border: Border.all(color: _color, width: 2),
        ),
      ),
    );
  }
}
