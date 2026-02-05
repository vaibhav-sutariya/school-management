import 'package:flutter/material.dart';

import '../../../../cubit/theme_cubit.dart';

class DashboardBottomBar extends StatelessWidget {
  final int activeIndex;
  final Function(int) onTabSelected;

  const DashboardBottomBar({
    super.key,
    required this.activeIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          // Background Bar
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 80,
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(
                    context,
                    0,
                    Icons.calendar_month_rounded,
                    'Calendar',
                  ),
                  _buildNavItem(context, 1, Icons.explore_rounded, 'Summary'),
                  const SizedBox(width: 48), // Space for floating button
                  _buildNavItem(
                    context,
                    3,
                    Icons.notifications_rounded,
                    'Notice',
                  ),
                  _buildNavItem(context, 4, Icons.person_rounded, 'Me'),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: GestureDetector(
              onTap: () {
                onTabSelected(2); // Select Home tab (index 2)
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFFA726), Color(0xFFFFCC80)],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFFFA726).withOpacity(0.4),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                      // Highlight if selected
                      border: activeIndex == 2
                          ? Border.all(color: Colors.white, width: 2)
                          : null,
                    ),
                    child: Icon(
                      Icons.home_rounded,
                      color: activeIndex == 2 ? Colors.white : Colors.black,
                      size: 32,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 12, // Increased font size slightly
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                      color: activeIndex == 2
                          ? context.colors.primary
                          : Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    int index,
    IconData icon,
    String label,
  ) {
    final bool isSelected = activeIndex == index;
    final primaryColor = context.colors.primary;

    return GestureDetector(
      onTap: () => onTabSelected(index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? primaryColor : Colors.grey[600],
            size: 28,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? primaryColor : Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
