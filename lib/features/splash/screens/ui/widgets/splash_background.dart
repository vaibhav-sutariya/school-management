import 'package:flutter/material.dart';

import 'splash_bubble.dart';

class SplashBackground extends StatelessWidget {
  final Animation<double> scaleAnimation;
  final Animation<double> fadeAnimation;
  final Animation<double> breatheAnimation;
  final AnimationController breathingController;

  static const Color _primaryColor = Color(0xFF050076);
  static const Color _secondaryColor = Color(0xFF00B8FF);

  const SplashBackground({
    super.key,
    required this.scaleAnimation,
    required this.fadeAnimation,
    required this.breatheAnimation,
    required this.breathingController,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Top Right Large Bubble
        Positioned(
          top: -100,
          right: -100,
          child: ScaleTransition(
            scale: scaleAnimation,
            child: const SplashBubble(
              size: 350,
              color: _primaryColor,
              shape: BoxShape.circle,
            ),
          ),
        ),
        // Bottom Left Large Bubble
        Positioned(
          bottom: -150,
          left: -100,
          child: ScaleTransition(
            scale: scaleAnimation,
            child: const SplashBubble(
              size: 450,
              color: _primaryColor,
              shape: BoxShape.circle,
            ),
          ),
        ),
        // Top Left Small Ring
        Positioned(
          top: 50,
          left: -20,
          child: FadeTransition(
            opacity: fadeAnimation,
            child: AnimatedBuilder(
              animation: breatheAnimation,
              builder: (context, child) =>
                  Transform.scale(scale: breatheAnimation.value, child: child),
              child: SplashBubble(
                size: 100,
                color: _secondaryColor.withValues(alpha: 0.2),
                shape: BoxShape.circle,
                isOutlined: true,
              ),
            ),
          ),
        ),
        // Top Center Floating Ring
        Positioned(
          top: 80,
          left: MediaQuery.of(context).size.width * 0.6,
          child: FadeTransition(
            opacity: fadeAnimation,
            child: AnimatedBuilder(
              animation: breatheAnimation,
              builder: (context, child) => Transform.scale(
                scale: breatheAnimation.value * 1.1, // Offset phase
                child: child,
              ),
              child: const SplashBubble(
                size: 60,
                color: _primaryColor,
                shape: BoxShape.circle,
                isOutlined: true,
                strokeWidth: 2,
              ),
            ),
          ),
        ),
        // Bottom Right Small Dot
        Positioned(
          bottom: 250,
          right: 80,
          child: ScaleTransition(
            scale: scaleAnimation,
            child: const SplashBubble(
              size: 20,
              color: _secondaryColor,
              shape: BoxShape.circle,
            ),
          ),
        ),
        // Center Left Small Dot
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.4,
          left: 40,
          child: ScaleTransition(
            scale: scaleAnimation,
            child: const SplashBubble(
              size: 15,
              color: _secondaryColor,
              shape: BoxShape.circle,
            ),
          ),
        ),
        // Random decorative square/diamond
        Positioned(
          bottom: 180,
          left: 120,
          child: RotationTransition(
            turns: breathingController,
            child: FadeTransition(
              opacity: fadeAnimation,
              child: SplashBubble(
                size: 30,
                color: _secondaryColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
        // Ring near bottom large bubble
        Positioned(
          bottom: 120,
          left: 160,
          child: FadeTransition(
            opacity: fadeAnimation,
            child: const SplashBubble(
              size: 40,
              color: _primaryColor,
              shape: BoxShape.circle,
              isOutlined: true,
            ),
          ),
        ),
        // Arc/Line decoration
        Positioned(
          top: 150,
          right: 40,
          child: FadeTransition(
            opacity: fadeAnimation,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: _primaryColor.withValues(alpha: 0.3),
                  width: 1,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 200,
          left: -50,
          child: FadeTransition(
            opacity: fadeAnimation,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: _primaryColor.withValues(alpha: 0.3),
                  width: 1,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
