import 'package:flutter/material.dart';
import 'package:starter_app/cubit/theme_cubit.dart';

import '../../../../core/helpers/extensions/responsive_extensions.dart';
import '../data/menu_data.dart';
import 'menu_item.dart';

class MenuSectionCard extends StatelessWidget {
  final String title;
  final List<MenuItemData> items;

  const MenuSectionCard({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      shadowColor: Colors.black.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.scale(16)),
        side: BorderSide(color: Colors.grey.withOpacity(0.08), width: 1),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section Title
            Row(
              children: [
                Container(
                  width: context.scale(4),
                  height: context.scaleHeight(12),
                  decoration: BoxDecoration(
                    color: context.colors.primary,
                    borderRadius: BorderRadius.circular(context.scale(4)),
                  ),
                ),
                SizedBox(width: context.scale(8)),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: context.scaleFont(15),
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF263238),
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
            SizedBox(height: context.scaleHeight(10)),

            // Grid of Items
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: context.scaleHeight(8),
                crossAxisSpacing: context.scale(25),
                childAspectRatio: 0.95,
              ),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                final item = items[index];
                return MenuItem(
                  icon: item.icon,
                  label: item.label,
                  color: item.iconColor,
                  backgroundColor: item.backgroundColor,
                  onTap: () {
                    // Handle navigation
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
