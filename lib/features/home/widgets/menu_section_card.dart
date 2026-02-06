import 'package:flutter/material.dart';
import 'package:starter_app/cubit/theme_cubit.dart';

import '../../../../core/helpers/extensions/responsive_extensions.dart';
import '../data/category_theme_config.dart';
import '../data/menu_data.dart';
import 'menu_item.dart';

class MenuSectionCard extends StatelessWidget {
  final String title;
  final List<MenuItemData> items;

  const MenuSectionCard({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    final theme = CategoryThemes.getTheme(title);

    return Card(
      color: Colors.white,
      elevation: 2,
      shadowColor: Colors.black.withValues(alpha: 0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.scale(16)),
        side: BorderSide(color: Colors.grey.withValues(alpha: 0.08), width: 1),
      ),
      child: Stack(
        children: [
          // Decorative background pattern
          ..._buildBackgroundDecoration(context, theme),

          // Main content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle(context),
                SizedBox(height: context.scaleHeight(10)),
                _buildMenuGrid(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the section title with decorative accent
  Widget _buildSectionTitle(BuildContext context) {
    return Row(
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
    );
  }

  /// Builds the grid of menu items
  Widget _buildMenuGrid(BuildContext context) {
    return GridView.builder(
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
    );
  }

  /// Builds the background decoration layers (image + gradient overlay)
  List<Widget> _buildBackgroundDecoration(
    BuildContext context,
    CategoryThemeConfig theme,
  ) {
    final borderRadius = BorderRadius.circular(context.scale(16));

    return [
      // Background image layer
      _buildBackgroundImage(context, theme, borderRadius),
      // Gradient overlay layer
      _buildGradientOverlay(context, theme, borderRadius),
    ];
  }

  /// Builds the background image layer
  Widget _buildBackgroundImage(
    BuildContext context,
    CategoryThemeConfig theme,
    BorderRadius borderRadius,
  ) {
    return Positioned.fill(
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Opacity(
          opacity: theme.imageOpacity,
          child: theme.backgroundImage.image(fit: BoxFit.cover),
        ),
      ),
    );
  }

  /// Builds the gradient overlay layer
  Widget _buildGradientOverlay(
    BuildContext context,
    CategoryThemeConfig theme,
    BorderRadius borderRadius,
  ) {
    return Positioned.fill(
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                theme.overlayColor.withValues(alpha: theme.overlayStartOpacity),
                theme.overlayColor.withValues(alpha: theme.overlayEndOpacity),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
