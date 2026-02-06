import 'package:flutter/material.dart';

import '../../../../core/helpers/extensions/responsive_extensions.dart';
import '../data/menu_data.dart';
import 'menu_section_card.dart';

class QuickMenuOverlay extends StatelessWidget {
  const QuickMenuOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16),
      physics: const BouncingScrollPhysics(),
      // Add bottom padding for better scroll experience
      itemCount: QuickMenuData.sections.length + 1,
      itemBuilder: (context, index) {
        // Last item is just spacing
        if (index == QuickMenuData.sections.length) {
          return SizedBox(height: context.scaleHeight(100));
        }

        final section = QuickMenuData.sections[index];
        return Padding(
          padding: EdgeInsets.only(bottom: context.scaleHeight(5)),
          child: MenuSectionCard(title: section.title, items: section.items),
        );
      },
    );
  }
}
