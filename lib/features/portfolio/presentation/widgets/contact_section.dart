import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/responsive.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => ContactSectionState();
}

class ContactSectionState extends State<ContactSection> {
  bool _hasAnimated = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('contact-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1 && !_hasAnimated) {
          setState(() {
            _hasAnimated = true;
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 100),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.background,
              AppColors.background.withAlpha(204),
              AppColors.surface.withAlpha(51),
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 100,
              left: -50,
              child: _ContactGlow(color: AppColors.primary.withAlpha(26)),
            ),
            Positioned(
              bottom: 100,
              right: -50,
              child: _ContactGlow(color: AppColors.secondary.withAlpha(26)),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  FadeInDown(
                    animate: _hasAnimated,
                    child: const Text(
                      'CONTACT ME',
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
                      "Let's Forge The Future\nTogether",
                      style: Theme.of(context).textTheme.displayMedium
                          ?.copyWith(fontWeight: FontWeight.w900, height: 1.1),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 80),
                  _ContactMainContent(hasAnimated: _hasAnimated),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactGlow extends StatelessWidget {
  final Color color;
  const _ContactGlow({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 400,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withAlpha(38),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
        child: Container(color: Colors.transparent),
      ),
    );
  }
}

class _ContactMainContent extends StatelessWidget {
  final bool hasAnimated;
  const _ContactMainContent({required this.hasAnimated});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: Column(
        children: const [
          _ContactInfoSide(isMobile: true),
          SizedBox(height: 60),
          _ContactFormSide(),
        ],
      ),
      desktop: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Expanded(child: _ContactInfoSide(isMobile: false)),
          SizedBox(width: 80),
          Expanded(flex: 2, child: _ContactFormSide()),
        ],
      ),
    );
  }
}

class _ContactInfoSide extends StatelessWidget {
  final bool isMobile;
  const _ContactInfoSide({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: isMobile
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          const Text(
            "WANT TO CHAT?",
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w900,
              fontSize: 32,
              letterSpacing: 4,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "I'm always open to new opportunities and interesting projects.",
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w800,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 48),
          _ModernContactTile(
            icon: FontAwesomeIcons.solidEnvelope,
            title: "Email Me At",
            value: "hello@yourdomain.com",
            color: Colors.redAccent,
          ),
          const SizedBox(height: 20),
          _ModernContactTile(
            icon: FontAwesomeIcons.linkedinIn,
            title: "LinkedIn Profile",
            value: "linkedin.com/in/yourname",
            color: const Color(0xFF0077B5),
          ),
          const SizedBox(height: 20),
          _ModernContactTile(
            icon: FontAwesomeIcons.github,
            title: "GitHub Warehouse",
            value: "github.com/yourusername",
            color: Colors.white70,
          ),
          const SizedBox(height: 48),
          const _SocialSection(),
        ],
      ),
    );
  }
}

class _ModernContactTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color color;

  const _ModernContactTile({
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(5),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withAlpha(13)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withAlpha(26),
              borderRadius: BorderRadius.circular(16),
            ),
            child: FaIcon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white38,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SocialSection extends StatelessWidget {
  const _SocialSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "FOLLOW ME ON",
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w900,
            fontSize: 10,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: const [
            _SocialCircle(icon: FontAwesomeIcons.twitter),
            _SocialCircle(icon: FontAwesomeIcons.instagram),
            _SocialCircle(icon: FontAwesomeIcons.dribbble),
          ],
        ),
      ],
    );
  }
}

class _SocialCircle extends StatelessWidget {
  final IconData icon;
  const _SocialCircle({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(8),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withAlpha(26)),
      ),
      child: FaIcon(icon, color: Colors.white70, size: 18),
    );
  }
}

class _ContactFormSide extends StatelessWidget {
  const _ContactFormSide();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(48),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(5),
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: Colors.white.withAlpha(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(51),
            blurRadius: 40,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Send a Message",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.5,
            ),
          ),
          SizedBox(height: 40),
          _ContactTextField(label: "Name", hint: "Enter your name"),
          SizedBox(height: 24),
          _ContactTextField(label: "Email", hint: "Enter your email"),
          SizedBox(height: 24),
          _ContactTextField(
            label: "Description",
            hint: "Briefly describe your project",
            isMultiLine: true,
          ),
          SizedBox(height: 48),
          _SubmitButton(),
        ],
      ),
    );
  }
}

class _ContactTextField extends StatelessWidget {
  final String label;
  final String hint;
  final bool isMultiLine;

  const _ContactTextField({
    required this.label,
    required this.hint,
    this.isMultiLine = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: const TextStyle(
            color: AppColors.primary,
            fontSize: 11,
            fontWeight: FontWeight.w900,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          maxLines: isMultiLine ? 4 : 1,
          style: const TextStyle(color: Colors.white, fontSize: 16),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.white24, fontSize: 15),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 18,
              horizontal: 20,
            ),
            filled: true,
            fillColor: Colors.white.withAlpha(8),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.white.withAlpha(13)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: AppColors.primary, width: 1),
            ),
          ),
        ),
      ],
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 64,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withAlpha(77),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.background,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Launch Message",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                letterSpacing: 1,
              ),
            ),
            SizedBox(width: 12),
            Icon(Icons.rocket_launch_rounded, size: 20),
          ],
        ),
      ),
    );
  }
}
