import 'package:flutter/material.dart';
import 'package:starter_app/cubit/theme_cubit.dart';

import '../../../../core/helpers/extensions/responsive_extensions.dart';
import 'menu_item.dart';

class QuickMenuOverlay extends StatelessWidget {
  const QuickMenuOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      physics: const BouncingScrollPhysics(),
      children: [
        _buildSectionCard(context, 'Academics', [
          _buildMenuItem(
            context,
            Icons.check_circle_outline_rounded,
            'Attendance',
            const Color(0xFF5C6BC0),
            const Color(0xFFE8EAF6),
          ),
          _buildMenuItem(
            context,
            Icons.menu_book_rounded,
            'Homework',
            const Color(0xFFFF7043),
            const Color(0xFFFBE9E7),
          ),
          _buildMenuItem(
            context,
            Icons.edit_note_rounded,
            'Class Work',
            const Color(0xFFAB47BC),
            const Color(0xFFF3E5F5),
          ),
          _buildMenuItem(
            context,
            Icons.photo_library_outlined,
            'Gallery',
            const Color(0xFFEC407A),
            const Color(0xFFFCE4EC),
          ),
          _buildMenuItem(
            context,
            Icons.video_library_outlined,
            'Videos',
            const Color(0xFFEF5350),
            const Color(0xFFFFEBEE),
          ),
          _buildMenuItem(
            context,
            Icons.calendar_today_outlined,
            'My Leave',
            const Color(0xFFFFA726),
            const Color(0xFFFFF3E0),
          ),
          _buildMenuItem(
            context,
            Icons.rate_review_outlined,
            'Remarks',
            const Color(0xFF26C6DA),
            const Color(0xFFE0F7FA),
          ),
          _buildMenuItem(
            context,
            Icons.groups_outlined,
            'PTM',
            const Color(0xFF7E57C2),
            const Color(0xFFEDE7F6),
          ),
          _buildMenuItem(
            context,
            Icons.emoji_events_outlined,
            'Achievement',
            const Color(0xFF66BB6A),
            const Color(0xFFE8F5E9),
          ),
          _buildMenuItem(
            context,
            Icons.restaurant_menu_rounded,
            'Meal Menu',
            const Color(0xFF8D6E63),
            const Color(0xFFEFEBE9),
          ),
          _buildMenuItem(
            context,
            Icons.report_problem_outlined,
            'Concern',
            const Color(0xFF546E7A),
            const Color(0xFFECEFF1),
          ),
          _buildMenuItem(
            context,
            Icons.door_back_door,
            'Gatepass',
            const Color(0xFF78909C),
            const Color(0xFFECEFF1),
          ),
        ], const Color(0xFFE3F2FD)),
        SizedBox(height: context.scaleHeight(5)),
        _buildSectionCard(context, 'Downloads', [
          _buildMenuItem(
            context,
            Icons.schedule_rounded,
            'Time Table',
            const Color(0xFF5C6BC0),
            const Color(0xFFE8EAF6),
          ),
          _buildMenuItem(
            context,
            Icons.assignment_outlined,
            'Assignment',
            const Color(0xFFFF7043),
            const Color(0xFFFBE9E7),
          ),
          _buildMenuItem(
            context,
            Icons.list_alt_rounded,
            'Syllabus',
            const Color(0xFFAB47BC),
            const Color(0xFFF3E5F5),
          ),
          _buildMenuItem(
            context,
            Icons.beach_access_rounded,
            'Holiday HW',
            const Color(0xFFEC407A),
            const Color(0xFFFCE4EC),
          ),
        ], const Color(0xFFFFF3E0)),
        _buildSectionCard(context, 'Exam & Results', [
          _buildMenuItem(
            context,
            Icons.calendar_month_rounded,
            'Time Table',
            const Color(0xFF26C6DA),
            const Color(0xFFE0F7FA),
          ),
          _buildMenuItem(
            context,
            Icons.article_outlined,
            'Paper',
            const Color(0xFFFFA726),
            const Color(0xFFFFF3E0),
          ),
          _buildMenuItem(
            context,
            Icons.analytics_outlined,
            'Report Card',
            const Color(0xFF7E57C2),
            const Color(0xFFEDE7F6),
          ),
          _buildMenuItem(
            context,
            Icons.quiz_outlined,
            'Class Test',
            const Color(0xFF66BB6A),
            const Color(0xFFE8F5E9),
          ),
        ], const Color(0xFFF3E5F5)),
        _buildSectionCard(context, 'Social Media', [
          _buildMenuItem(
            context,
            Icons.facebook_rounded,
            'Facebook',
            const Color(0xFF1877F2),
            const Color(0xFFE3F2FD),
          ),
          _buildMenuItem(
            context,
            Icons.camera_alt_outlined,
            'Instagram',
            const Color(0xFFE4405F),
            const Color(0xFFFCE4EC),
          ),
          _buildMenuItem(
            context,
            Icons.play_circle_outline_rounded,
            'Youtube',
            const Color(0xFFFF0000),
            const Color(0xFFFFEBEE),
          ),
          _buildMenuItem(
            context,
            Icons.language_rounded,
            'Website',
            const Color(0xFF4285F4),
            const Color(0xFFE3F2FD),
          ),
          _buildMenuItem(
            context,
            Icons.map_outlined,
            'Google Map',
            const Color(0xFF34A853),
            const Color(0xFFE8F5E9),
          ),
        ], const Color(0xFFE8F5E9)),

        SizedBox(height: context.scaleHeight(100)),
      ],
    );
  }

  Widget _buildSectionCard(
    BuildContext context,
    String title,
    List<Widget> children,
    Color backgroundColor,
  ) {
    return Card(
      color: Colors.white,
      elevation: 2, // Added elevation
      shadowColor: Colors.black.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.scale(16)),
        side: BorderSide(
          color: Colors.grey.withOpacity(0.08), // Light border
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                    color: const Color(0xFF263238), // Dark Blue Grey
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
            SizedBox(height: context.scaleHeight(10)), // Reduced from 12
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              mainAxisSpacing: context.scaleHeight(8), // Reduced from 15
              crossAxisSpacing: context.scale(25), // Reduced from 15
              childAspectRatio: 0.95,
              padding:
                  EdgeInsets.zero, // explicit zero padding to avoid defaults
              children: children,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    IconData icon,
    String label,
    Color color,
    Color bg,
  ) {
    return MenuItem(
      icon: icon,
      label: label,
      color: color,
      backgroundColor: bg,
      onTap: () {
        // Handle navigation
      },
    );
  }
}
