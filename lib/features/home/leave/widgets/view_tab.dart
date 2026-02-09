import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/extensions/responsive_extensions.dart';
import '../../../../core/routes/app_router.gr.dart';
import '../models/leave_model.dart';

/// VIEW tab content - displays leave applications and status
class ViewTab extends StatelessWidget {
  const ViewTab({super.key});

  @override
  Widget build(BuildContext context) {
    // Get mock data from model
    final leaves = LeaveModel.getMockData();

    return SingleChildScrollView(
      padding: EdgeInsets.all(context.scale(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Leave Applications (without heading)
          ...leaves.map(
            (leave) => Padding(
              padding: EdgeInsets.only(bottom: context.scaleHeight(12)),
              child: _buildLeaveApplicationCard(context, leave: leave),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeaveApplicationCard(
    BuildContext context, {
    required LeaveModel leave,
  }) {
    return GestureDetector(
      onTap: () {
        // Navigate to leave detail page
        context.router.push(LeaveDetailRoute(leaveId: leave.id));
      },
      child: Container(
        padding: EdgeInsets.all(context.scale(16)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(context.scale(12)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    leave.dateRange,
                    style: TextStyle(
                      fontSize: context.scaleFont(14),
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.scale(12),
                    vertical: context.scaleHeight(4),
                  ),
                  decoration: BoxDecoration(
                    color: Color(leave.statusColor).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(context.scale(12)),
                  ),
                  child: Text(
                    leave.statusText,
                    style: TextStyle(
                      fontSize: context.scaleFont(12),
                      fontWeight: FontWeight.w600,
                      color: Color(leave.statusColor),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: context.scaleHeight(8)),
            Text(
              'Reason: ${leave.reason}',
              style: TextStyle(
                fontSize: context.scaleFont(13),
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
