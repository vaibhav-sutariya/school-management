import 'package:flutter/material.dart';

import '../../../../core/helpers/extensions/responsive_extensions.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final Color backgroundColor;
  final VoidCallback? onTap;

  const MenuItem({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
    required this.backgroundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        elevation: 4, // Increased elevation
        shadowColor: Colors.black.withOpacity(0.5), // Darker shadow
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.scale(16)),
          side: const BorderSide(
            color: Color(0xFFEEEEEE), // Solid light grey border
            width: 1,
          ),
        ),
        margin: EdgeInsets.zero, // Let grid spacing handle margins
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(context.scale(10)),
              decoration: BoxDecoration(
                color: backgroundColor,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: context.scale(22)),
            ),
            SizedBox(height: context.scaleHeight(8)),
            Text(
              label,
              style: TextStyle(
                fontSize: context.scaleFont(11),
                fontWeight: FontWeight.w600,
                color: Colors.black87,
                letterSpacing: 0.3,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
