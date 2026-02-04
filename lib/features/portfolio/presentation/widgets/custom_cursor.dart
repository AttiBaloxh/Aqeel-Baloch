import 'package:flutter/material.dart';
import 'package:personal_portfolio/core/constants/app_colors.dart';

class CustomCursor extends StatefulWidget {
  final Widget child;
  const CustomCursor({super.key, required this.child});

  @override
  State<CustomCursor> createState() => _CustomCursorState();
}

class _CustomCursorState extends State<CustomCursor> {
  Offset _pointerPos = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.none,
      onHover: (event) {
        setState(() {
          _pointerPos = event.position;
        });
      },
      child: Stack(
        children: [
          widget.child,
          // Outer ring (smooth follow)
          AnimatedPositioned(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOutCubic,
            left: _pointerPos.dx - 20,
            top: _pointerPos.dy - 20,
            child: IgnorePointer(
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.primary.withAlpha(128),
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ),
          // Inner dot (snappy follow)
          Positioned(
            left: _pointerPos.dx - 4,
            top: _pointerPos.dy - 4,
            child: IgnorePointer(
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
