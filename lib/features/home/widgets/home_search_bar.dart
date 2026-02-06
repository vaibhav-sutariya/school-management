import 'package:flutter/material.dart';

import '../../../../core/helpers/extensions/responsive_extensions.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.scale(20)),
      child: Container(
        height: context.scaleHeight(35), // Reduced from 50
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(
            0.15,
          ), // Slightly more visible for clarity
          borderRadius: BorderRadius.circular(
            context.scale(12),
          ), // Reduced radius
          border: Border.all(color: Colors.white.withOpacity(0.15), width: 1),
        ),
        child: Row(
          children: [
            SizedBox(width: context.scale(16)),
            Expanded(
              child: Text(
                'Search here...',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: context.scaleFont(13), // Reduced font size
                  letterSpacing: 0.3,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(context.scale(6)),
              padding: EdgeInsets.all(context.scale(6)), // Reduced padding
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(context.scale(8)),
              ),
              child: Icon(
                Icons.search,
                color: Colors.white,
                size: context.scale(18), // Reduced size
              ),
            ),
          ],
        ),
      ),
    );
  }
}
