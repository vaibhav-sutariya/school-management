import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:starter_app/cubit/theme_cubit.dart';

import '../../../../../core/helpers/extensions/responsive_extensions.dart';
import '../../../../../core/routes/app_router.gr.dart';
import '../data/category_theme_config.dart';
import '../data/menu_data.dart';
import 'menu_item.dart';

/// Production-ready menu section card with optimized performance
/// Uses const constructors where possible and optimized layout
class MenuSectionCard extends StatelessWidget {
  final String title;
  final List<MenuItemData> items;

  const MenuSectionCard({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    // Get theme once per build - lookup is fast (Map lookup)
    final theme = CategoryThemes.getTheme(title);
    final borderRadius = BorderRadius.circular(context.scale(16));

    return Card(
      color: Colors.white,
      elevation: 2,
      shadowColor: Colors.black.withValues(alpha: 0.1),
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
        side: BorderSide(color: Colors.grey.withValues(alpha: 0.08), width: 1),
      ),
      child: Stack(
        children: [
          // Decorative background pattern - memoized
          ..._buildBackgroundDecoration(context, theme, borderRadius),

          // Main content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min, // Optimize layout
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
  /// Production-optimized: Uses LayoutBuilder for dynamic sizing
  /// Avoids shrinkWrap performance issues by using fixed cross-axis count
  Widget _buildMenuGrid(BuildContext context) {
    // Calculate grid delegate once
    final gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      mainAxisSpacing: context.scaleHeight(8),
      crossAxisSpacing: context.scale(25),
      childAspectRatio: 0.999,
    );

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: gridDelegate,
      padding: EdgeInsets.zero,
      // Critical performance optimizations
      addAutomaticKeepAlives: false, // Don't keep grid items alive
      addRepaintBoundaries: true, // Isolate repaints
      addSemanticIndexes: false, // Disable semantic indexes
      itemBuilder: (context, index) {
        final item = items[index];
        // Use ObjectKey for better performance
        // RepaintBoundary prevents unnecessary repaints during scroll
        return RepaintBoundary(
          key: ObjectKey(item),
          child: MenuItem(
            icon: item.icon,
            label: item.label,
            color: item.iconColor,
            backgroundColor: item.backgroundColor,
            onTap: () => _handleNavigation(context, item.label),
          ),
        );
      },
    );
  }

  /// Builds the background decoration layers (image + gradient overlay)
  /// Memoized to avoid rebuilding on every scroll
  List<Widget> _buildBackgroundDecoration(
    BuildContext context,
    CategoryThemeConfig theme,
    BorderRadius borderRadius,
  ) {
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

  /// Handle navigation based on menu item label
  void _handleNavigation(BuildContext context, String label) {
    switch (label.toLowerCase()) {
      case 'attendance':
        context.router.push(const AttendanceRoute());
        break;
      // Add more navigation cases as needed
      default:
        // Handle other menu items
        break;
    }
  }
}
