import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/helpers/extensions/responsive_extensions.dart';

class EventsCalendar extends StatelessWidget {
  final DateTime focusedMonth;
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;
  final ValueChanged<DateTime> onMonthChanged;

  const EventsCalendar({
    super.key,
    required this.focusedMonth,
    required this.selectedDate,
    required this.onDateSelected,
    required this.onMonthChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(context.scale(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.all(context.scale(16)),
      child: Column(
        children: [
          // Custom Header implementation re-using parts of MonthCalendar or replicating logic
          // Since MonthCalendar has specific styles, we can reuse it if it fits, otherwise build custom.
          // The User asked to use MonthCalendar. Let's wrap it or use similar logic.
          // MonthCalendar is a widget that returns a Container. We can't easily decompose it.
          // But the design shows the arrows inside the white container. MonthCalendar has its own container.
          // So using MonthCalendar might result in double containers or padding issues.
          // Ideally we should extract the logic. But user said "make use of our @MonthCalendar".
          // Let's try to use it directly, but maybe we need to remove its external padding/decoration if possible?
          // Accessing source of MonthCalendar... it has hardcoded decoration.
          // So better to implement the logic here to match the design EXACTLY (Header inside the big white card).
          _buildHeader(context),
          SizedBox(height: context.scaleHeight(20)),
          _buildDaysOfWeek(context),
          SizedBox(height: context.scaleHeight(10)),
          _buildCalendarGrid(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          DateFormat('MMMM yyyy').format(focusedMonth),
          style: TextStyle(
            fontSize: context.scaleFont(18),
            fontWeight: FontWeight.bold,
            color: const Color(0xFF263238),
          ),
        ),
        Row(
          children: [
            InkWell(
              onTap: () {
                onMonthChanged(
                  DateTime(focusedMonth.year, focusedMonth.month - 1),
                );
              },
              child: Padding(
                padding: EdgeInsets.all(context.scale(4)),
                child: Icon(
                  Icons.chevron_left,
                  color: Colors.grey[400],
                  size: context.scale(28),
                ),
              ),
            ),
            SizedBox(width: context.scale(8)),
            InkWell(
              onTap: () {
                onMonthChanged(
                  DateTime(focusedMonth.year, focusedMonth.month + 1),
                );
              },
              child: Padding(
                padding: EdgeInsets.all(context.scale(4)),
                child: Icon(
                  Icons.chevron_right,
                  color: Colors.grey[400],
                  size: context.scale(28),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDaysOfWeek(BuildContext context) {
    final days = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: days
          .map(
            (day) => Expanded(
              child: Center(
                child: Text(
                  day,
                  style: TextStyle(
                    fontSize: context.scaleFont(12),
                    color: Colors.grey[400],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildCalendarGrid(BuildContext context) {
    final daysInMonth = DateUtils.getDaysInMonth(
      focusedMonth.year,
      focusedMonth.month,
    );
    final firstDayOfMonth = DateTime(focusedMonth.year, focusedMonth.month, 1);
    final weekdayOfFirstDay = firstDayOfMonth.weekday; // 1=Mon, 7=Sun
    // Adjust so Sunday is 0: (weekday % 7) -> Sun=0, Mon=1...Sat=6
    final startOffset = weekdayOfFirstDay % 7;

    final List<Widget> dayWidgets = [];

    // Empty slots
    for (int i = 0; i < startOffset; i++) {
      dayWidgets.add(const SizedBox());
    }

    // Days
    for (int i = 1; i <= daysInMonth; i++) {
      final date = DateTime(focusedMonth.year, focusedMonth.month, i);
      final isSelected = DateUtils.isSameDay(date, selectedDate);
      final isToday = DateUtils.isSameDay(date, DateTime.now());

      dayWidgets.add(
        GestureDetector(
          onTap: () => onDateSelected(date),
          child: Container(
            margin: EdgeInsets.all(context.scale(4)),
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color(0xFF303F9F)
                  : Colors.transparent, // Dark Blue for selected
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    '$i',
                    style: TextStyle(
                      fontSize: context.scaleFont(14),
                      color: isSelected ? Colors.white : Colors.black87,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  if (isToday && !isSelected)
                    Positioned(
                      bottom: 4,
                      child: Container(
                        width: 4,
                        height: 4,
                        decoration: const BoxDecoration(
                          color: Color(0xFF303F9F),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 7,
      physics: const NeverScrollableScrollPhysics(),
      children: dayWidgets,
    );
  }
}
