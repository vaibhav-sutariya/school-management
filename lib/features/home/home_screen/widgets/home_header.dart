import 'package:flutter/material.dart';

import '../../../../../core/helpers/extensions/responsive_extensions.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.scale(20)),
      child: Row(
        children: [
          CircleAvatar(
            radius: context.scale(24),
            backgroundImage: const NetworkImage(
              'https://i.pravatar.cc/150?u=a042581f4e29026024d',
            ), // Placeholder image
          ),
          SizedBox(width: context.scale(12)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good Morning,',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: context.scaleFont(12),
                ),
              ),
              Text(
                'Alex Johnson',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: context.scaleFont(18),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            padding: EdgeInsets.all(context.scale(8)),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.notifications_rounded,
              color: Colors.white,
              size: context.scale(24),
            ),
          ),
        ],
      ),
    );
  }
}
