import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/responsive.dart';

class FaqSection extends StatefulWidget {
  const FaqSection({super.key});

  @override
  State<FaqSection> createState() => _FaqSectionState();
}

class _FaqSectionState extends State<FaqSection> {
  bool _hasAnimated = false;
  int? _expandedIndex;

  final List<Map<String, String>> faqs = [
    {
      'question': 'Are you open to relocation?',
      'answer':
          'While I primarily work remotely, I am open to relocation for the right opportunity, especially in major tech hubs.',
    },
    {
      'question': 'What is your preferred state management?',
      'answer':
          'I have extensive experience with Riverpod and Bloc. My choice depends on the project scope, but Riverpod is my current go-to for its robustness and ease of testing.',
    },
    {
      'question': 'How do you handle project architecture?',
      'answer':
          'I strictly follow Clean Architecture principles to ensure codebase is maintainable, scalable, and independent of external frameworks.',
    },
    {
      'question': 'Do you work with startups?',
      'answer':
          'Yes! I enjoy the fast-paced environment of startups. I help them move from MVP to a production-ready application quickly.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('faq-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2 && !_hasAnimated) {
          setState(() => _hasAnimated = true);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 120),
        color: AppColors.background,
        child: Column(
          children: [
            FadeInDown(
              animate: _hasAnimated,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary.withAlpha(26),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: AppColors.primary.withAlpha(51)),
                ),
                child: const Text(
                  'QUESTIONS',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 4,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            FadeInDown(
              animate: _hasAnimated,
              delay: const Duration(milliseconds: 200),
              child: Text(
                "Frequently Asked Questions",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 80),
            Responsive(
              mobile: _buildFaqList(),
              desktop: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: FadeInLeft(
                      animate: _hasAnimated,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Have any other\nquestions?",
                            style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              height: 1.1,
                            ),
                          ),
                          const SizedBox(height: 32),
                          const Text(
                            "If you can't find what you're looking for, feel free to reach out to me directly through the contact section below.",
                            style: TextStyle(
                              color: AppColors.textBody,
                              fontSize: 18,
                              height: 1.6,
                            ),
                          ),
                          const SizedBox(height: 48),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                                vertical: 24,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              "Get in Touch",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 80),
                  Expanded(flex: 1, child: _buildFaqList()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFaqList() {
    return Column(
      children: List.generate(
        faqs.length,
        (index) => _FaqItem(
          faq: faqs[index],
          isExpanded: _expandedIndex == index,
          onToggle: () {
            setState(() {
              _expandedIndex = _expandedIndex == index ? null : index;
            });
          },
          index: index,
          hasAnimated: _hasAnimated,
        ),
      ),
    );
  }
}

class _FaqItem extends StatelessWidget {
  final Map<String, String> faq;
  final bool isExpanded;
  final VoidCallback onToggle;
  final int index;
  final bool hasAnimated;

  const _FaqItem({
    required this.faq,
    required this.isExpanded,
    required this.onToggle,
    required this.index,
    required this.hasAnimated,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      animate: hasAnimated,
      delay: Duration(milliseconds: 200 + (index * 100)),
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: isExpanded
              ? AppColors.surface.withAlpha(204)
              : AppColors.surface.withAlpha(77),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isExpanded
                ? AppColors.primary.withAlpha(128)
                : Colors.white.withAlpha(13),
          ),
        ),
        child: InkWell(
          onTap: onToggle,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        faq['question']!,
                        style: TextStyle(
                          color: isExpanded ? AppColors.primary : Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    AnimatedRotation(
                      turns: isExpanded ? 0.5 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: Icon(
                        Icons.expand_more_rounded,
                        color: isExpanded ? AppColors.primary : Colors.white54,
                      ),
                    ),
                  ],
                ),
                AnimatedCrossFade(
                  firstChild: const SizedBox(width: double.infinity),
                  secondChild: Column(
                    children: [
                      const SizedBox(height: 24),
                      Text(
                        faq['answer']!,
                        style: const TextStyle(
                          color: AppColors.textBody,
                          fontSize: 16,
                          height: 1.8,
                        ),
                      ),
                    ],
                  ),
                  crossFadeState: isExpanded
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 300),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
