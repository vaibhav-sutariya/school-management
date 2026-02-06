import 'package:flutter/material.dart';

import '../../../../core/utils/responsive.dart';
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
    // Ensure Responsive is initialized if not already (it should be from main, but for safety)
    // Responsive().init(context); // removed as it is initialized in main.dart context extension

    return SizedBox(
      height: Responsive().scaleHeight(70),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          // Background Bar
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Responsive().scaleHeight(80),
              margin: EdgeInsets.fromLTRB(
                Responsive().scale(20),
                0,
                Responsive().scale(20),
                Responsive().scaleHeight(20),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Responsive().scale(30)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: Responsive().scale(25),
                    spreadRadius: Responsive().scale(2),
                    offset: Offset(0, Responsive().scaleHeight(8)),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: _buildNavItem(
                        context,
                        1,
                        Icons.calendar_month_rounded,
                        'Calendar',
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: _buildNavItem(
                        context,
                        2,
                        Icons.explore_rounded,
                        'Summary',
                      ),
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ), // Space for floating button
                  Expanded(
                    child: Center(
                      child: _buildNavItem(
                        context,
                        3,
                        Icons.notifications_rounded,
                        'Notice',
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: _buildNavItem(
                        context,
                        4,
                        Icons.person_rounded,
                        'Me',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -30,
            child: GestureDetector(
              onTap: () {
                onTabSelected(0); // Select Home tab (index 0)
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: Responsive().scale(50),
                    height: Responsive().scale(50),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFFA726), Color(0xFFFFCC80)],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFFFA726).withOpacity(0.5),
                          blurRadius: Responsive().scale(16),
                          spreadRadius: Responsive().scale(2),
                          offset: Offset(0, Responsive().scaleHeight(6)),
                        ),
                      ],
                      // Highlight if selected
                      border: activeIndex == 0
                          ? Border.all(
                              color: Colors.white,
                              width: Responsive().scale(2),
                            )
                          : null,
                    ),
                    child: Icon(
                      Icons.home_rounded,
                      color: activeIndex == 0 ? Colors.white : Colors.black,
                      size: Responsive().scale(28),
                    ),
                  ),
                  SizedBox(height: Responsive().scaleHeight(5)),
                  Text(
                    'Home',
                    style: TextStyle(
                      fontSize: Responsive().scaleFont(11),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                      color: activeIndex == 0
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
            size: Responsive().scale(20),
          ),
          SizedBox(height: Responsive().scaleHeight(4)),
          Text(
            label,
            style: TextStyle(
              fontSize: Responsive().scaleFont(11),
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? primaryColor : Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
