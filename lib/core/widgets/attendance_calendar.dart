import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:starter_app/cubit/theme_cubit.dart';

import '../helpers/extensions/responsive_extensions.dart';

/// Attendance status enum for calendar dates
enum AttendanceStatus { present, absent, holiday, notMarked }

/// Calendar date data model
class CalendarDateData {
  final DateTime date;
  final AttendanceStatus status;

  const CalendarDateData({required this.date, required this.status});
}

/// Production-ready reusable attendance calendar component
/// Optimized for performance with minimal rebuilds
class AttendanceCalendar extends StatefulWidget {
  /// Current selected date
  final DateTime? selectedDate;

  /// Map of dates to their attendance status
  final Map<DateTime, AttendanceStatus> attendanceData;

  /// Callback when a date is selected
  final ValueChanged<DateTime>? onDateSelected;

  /// Callback when month changes
  final ValueChanged<DateTime>? onMonthChanged;

  /// Academic year text (e.g., "ACADEMIC YEAR 23/24")
  final String? academicYear;

  const AttendanceCalendar({
    super.key,
    this.selectedDate,
    this.attendanceData = const {},
    this.onDateSelected,
    this.onMonthChanged,
    this.academicYear,
  });

  @override
  State<AttendanceCalendar> createState() => _AttendanceCalendarState();
}

class _AttendanceCalendarState extends State<AttendanceCalendar> {
  late DateTime _currentMonth;
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _currentMonth = DateTime.now();
    _selectedDate = widget.selectedDate ?? DateTime.now();
  }

  @override
  void didUpdateWidget(AttendanceCalendar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedDate != oldWidget.selectedDate &&
        widget.selectedDate != null) {
      _selectedDate = widget.selectedDate!;
      _currentMonth = DateTime(_selectedDate.year, _selectedDate.month);
    }
  }

  void _previousMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1);
    });
    widget.onMonthChanged?.call(_currentMonth);
  }

  void _selectDate(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
    widget.onDateSelected?.call(date);
  }

  List<DateTime> _getDaysInMonth() {
    final firstDay = DateTime(_currentMonth.year, _currentMonth.month, 1);
    final lastDay = DateTime(_currentMonth.year, _currentMonth.month + 1, 0);
    // Convert weekday to Sunday-based (0 = Sunday, 6 = Saturday)
    // DateTime.weekday: 1 = Monday, 7 = Sunday
    // We want: 0 = Sunday, 6 = Saturday
    final firstDayOfWeek =
        firstDay.weekday % 7; // 0 = Sunday, 1-6 = Monday-Saturday

    final days = <DateTime>[];

    // Add empty slots for days before the first day of the month (to align with Sunday start)
    for (int i = 0; i < firstDayOfWeek; i++) {
      days.add(DateTime(0)); // Placeholder for empty cells
    }

    // Add all current month's days (future dates will be disabled in the UI)
    for (int i = 1; i <= lastDay.day; i++) {
      days.add(DateTime(_currentMonth.year, _currentMonth.month, i));
    }

    // Don't add next month's dates - grid will end naturally

    return days;
  }

  Color _getStatusColor(AttendanceStatus status) {
    switch (status) {
      case AttendanceStatus.present:
        return const Color(0xFF4CAF50); // Green
      case AttendanceStatus.absent:
        return const Color(0xFFF44336); // Red
      case AttendanceStatus.holiday:
        return const Color(0xFFFF9800); // Orange
      case AttendanceStatus.notMarked:
        return Colors.transparent;
    }
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  bool _isCurrentMonth(DateTime date) {
    return date.month == _currentMonth.month && date.year == _currentMonth.year;
  }

  @override
  Widget build(BuildContext context) {
    final days = _getDaysInMonth();
    final monthYear = DateFormat('MMMM yyyy').format(_currentMonth);

    return Card(
      color: Colors.white,
      elevation: 2,
      shadowColor: Colors.black.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.scale(20)),
      ),
      margin: EdgeInsets.symmetric(horizontal: context.scale(16)),
      child: Padding(
        padding: EdgeInsets.all(context.scale(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Month navigation header
            _buildMonthHeader(context, monthYear),
            SizedBox(height: context.scaleHeight(16)),
            // Days of week header
            _buildDaysOfWeekHeader(context),
            SizedBox(height: context.scaleHeight(8)),
            // Calendar grid
            _buildCalendarGrid(context, days),
            SizedBox(height: context.scaleHeight(16)),
            // Legend
            _buildLegend(context),
          ],
        ),
      ),
    );
  }

  Widget _buildMonthHeader(BuildContext context, String monthYear) {
    final monthTextStyle = TextStyle(
      fontSize: context.scaleFont(18),
      fontWeight: FontWeight.bold,
      color: context.colors.primary,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: context.colors.primary,
            size: context.scale(24),
          ),
          onPressed: _previousMonth,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
        Text(monthYear, style: monthTextStyle),
        // Next month button - disabled (users can only go back)
        IconButton(
          icon: Icon(
            Icons.chevron_right,
            color: Colors.grey[300], // Disabled color
            size: context.scale(24),
          ),
          onPressed: null, // Disabled
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      ],
    );
  }

  Widget _buildDaysOfWeekHeader(BuildContext context) {
    // Start with Sunday (0 = Sunday, 6 = Saturday)
    const daysOfWeek = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];
    final textStyle = TextStyle(
      fontSize: context.scaleFont(12),
      fontWeight: FontWeight.w600,
      color: Colors.grey[700],
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: daysOfWeek.map((day) {
        return Expanded(
          child: Center(child: Text(day, style: textStyle)),
        );
      }).toList(),
    );
  }

  Widget _buildCalendarGrid(BuildContext context, List<DateTime> days) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisSpacing: context.scaleHeight(8),
        crossAxisSpacing: context.scale(8),
        childAspectRatio: 1.0,
      ),
      itemCount: days.length,
      itemBuilder: (context, index) {
        final date = days[index];

        // Skip empty placeholder dates (DateTime(0))
        if (date.year == 0) {
          return const SizedBox.shrink();
        }

        final isCurrentMonth = _isCurrentMonth(date);
        final isSelected = _isSameDay(date, _selectedDate);
        // Normalize date for lookup (year, month, day only)
        final normalizedDate = DateTime(date.year, date.month, date.day);

        // Check if it's Sunday (weekday == 7) - always mark as holiday
        final isSunday = date.weekday == 7;
        final status = isSunday
            ? AttendanceStatus.holiday
            : (widget.attendanceData[normalizedDate] ??
                  AttendanceStatus.notMarked);
        final hasStatus = status != AttendanceStatus.notMarked;

        return _buildDateCell(
          context,
          date,
          isCurrentMonth,
          isSelected,
          status,
          hasStatus,
        );
      },
    );
  }

  Widget _buildDateCell(
    BuildContext context,
    DateTime date,
    bool isCurrentMonth,
    bool isSelected,
    AttendanceStatus status,
    bool hasStatus,
  ) {
    final dateText = date.day.toString();
    final isToday = _isSameDay(date, DateTime.now());
    final today = DateTime.now();
    final normalizedDate = DateTime(date.year, date.month, date.day);
    final normalizedToday = DateTime(today.year, today.month, today.day);
    final isFutureDate = normalizedDate.isAfter(normalizedToday);
    final isSelectable = !isFutureDate;
    final isSunday = date.weekday == 7;

    // Sundays are always holidays, so always show holiday color
    final effectiveStatus = isSunday ? AttendanceStatus.holiday : status;
    final effectiveHasStatus = isSunday || hasStatus;

    return GestureDetector(
      onTap: isSelectable ? () => _selectDate(date) : null,
      child: Opacity(
        // Reduce opacity for future dates (not Sundays)
        opacity: isFutureDate && !isSunday ? 0.4 : 1.0,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected
                ? context.colors.primary
                : effectiveHasStatus
                ? _getStatusColor(effectiveStatus)
                : Colors.transparent,
            // Add border for today's date when not selected
            border: isToday && !isSelected
                ? Border.all(color: context.colors.primary, width: 2)
                : null,
          ),
          child: Center(
            child: Text(
              dateText,
              style: TextStyle(
                fontSize: context.scaleFont(13),
                fontWeight: isSelected || effectiveHasStatus
                    ? FontWeight.w600
                    : FontWeight.normal,
                color: isSelected
                    ? Colors.white
                    : isFutureDate && !isSunday
                    ? Colors.grey[400]!
                    : effectiveHasStatus
                    ? Colors.white
                    : Colors.black87,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLegend(BuildContext context) {
    final legendTextStyle = TextStyle(
      fontSize: context.scaleFont(11),
      color: Colors.grey[700],
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildLegendItem(
          context,
          const Color(0xFF4CAF50),
          'PRESENT',
          legendTextStyle,
        ),
        SizedBox(width: context.scale(16)),
        _buildLegendItem(
          context,
          const Color(0xFFF44336),
          'ABSENT',
          legendTextStyle,
        ),
        SizedBox(width: context.scale(16)),
        _buildLegendItem(
          context,
          const Color(0xFFFF9800),
          'HOLIDAY',
          legendTextStyle,
        ),
      ],
    );
  }

  Widget _buildLegendItem(
    BuildContext context,
    Color color,
    String label,
    TextStyle textStyle,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: context.scale(12),
          height: context.scale(12),
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        SizedBox(width: context.scale(6)),
        Text(label, style: textStyle),
      ],
    );
  }
}
