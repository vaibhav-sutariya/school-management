import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../cubit/theme_cubit.dart';
import '../helpers/extensions/responsive_extensions.dart';

class ReusableCalendarStrip extends StatefulWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;
  final bool disableFutureDates;

  const ReusableCalendarStrip({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
    this.disableFutureDates = false,
  });

  @override
  State<ReusableCalendarStrip> createState() => _ReusableCalendarStripState();
}

class _ReusableCalendarStripState extends State<ReusableCalendarStrip> {
  late DateTime _currentWeekStart;

  @override
  void initState() {
    super.initState();
    // Calculate start of the week (Monday) based on selected date initially
    _currentWeekStart = _getStartOfWeek(widget.selectedDate);
  }

  // Update week view if selected date jumps to another week (optional, depending on UX)
  // For now, let's keep week view independent unless explicit navigation,
  // OR if the selected date changes significantly (e.g. from parent date picker).
  @override
  void didUpdateWidget(ReusableCalendarStrip oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedDate != oldWidget.selectedDate) {
      // If the new selected date is not in the current view, should we scroll to it?
      // The user prompt implies week navigation is manual.
      // But if the parent FORCES a date (e.g. today), we should probably show it.
      // Let's check if the new date is outside current week.
      final newDateWeekStart = _getStartOfWeek(widget.selectedDate);
      if (!_isSameWeek(_currentWeekStart, newDateWeekStart)) {
        _currentWeekStart = newDateWeekStart;
      }
    }
  }

  bool _isSameWeek(DateTime week1, DateTime week2) {
    return DateUtils.isSameDay(week1, week2);
  }

  DateTime _getStartOfWeek(DateTime date) {
    // Strip time to ensure valid comparisons
    final justDate = DateTime(date.year, date.month, date.day);
    // Assuming Monday is the start of the week
    return justDate.subtract(Duration(days: justDate.weekday - 1));
  }

  void _nextWeek() {
    if (_isNextEnabled()) {
      setState(() {
        _currentWeekStart = _currentWeekStart.add(const Duration(days: 7));
      });
    }
  }

  bool _isNextEnabled() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final currentRealWeekStart = _getStartOfWeek(today);
    return _currentWeekStart.isBefore(currentRealWeekStart);
  }

  void _previousWeek() {
    setState(() {
      _currentWeekStart = _currentWeekStart.subtract(const Duration(days: 7));
    });
  }

  /// Helper method to check if a date should be disabled
  /// Returns true if the date is in the future and disableFutureDates is enabled
  bool _isDateDisabled(DateTime date, DateTime today) {
    if (!widget.disableFutureDates) return false;
    return date.isAfter(today);
  }

  @override
  Widget build(BuildContext context) {
    // Cache today's date (normalized) for performance - computed once per build
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    // Create list of 7 days
    final weekDays = List.generate(7, (index) {
      return _currentWeekStart.add(Duration(days: index));
    });

    final monthYearString = DateFormat('MMMM yyyy').format(_currentWeekStart);

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: context.scaleHeight(16)),
      child: Column(
        children: [
          // Header with Navigation
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.scale(16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  monthYearString,
                  style: TextStyle(
                    fontSize: context.scaleFont(18),
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF263238),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.scale(12),
                    vertical: context.scaleHeight(6),
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8EAF6),
                    borderRadius: BorderRadius.circular(context.scale(20)),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: _previousWeek,
                        child: Icon(
                          Icons.chevron_left_rounded,
                          color: const Color(0xFF3F51B5),
                          size: context.scale(24),
                        ),
                      ),
                      SizedBox(width: context.scale(8)),
                      Container(
                        height: context.scaleHeight(16),
                        width: 1,
                        color: const Color(0xFFC5CAE9),
                      ),
                      SizedBox(width: context.scale(8)),
                      GestureDetector(
                        onTap: _isNextEnabled() ? _nextWeek : null,
                        child: Icon(
                          Icons.chevron_right_rounded,
                          color: _isNextEnabled()
                              ? const Color(0xFF3F51B5)
                              : Colors.grey.withValues(alpha: 0.5),
                          size: context.scale(24),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: context.scaleHeight(20)),

          // Seven Days Row
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.scale(16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: weekDays.map((date) {
                // Check if this date should be disabled
                final isDisabled = _isDateDisabled(date, today);

                // Check if this is today's date
                final isToday = DateUtils.isSameDay(date, today);

                // Use widget.selectedDate instead of local state
                final isSelected = DateUtils.isSameDay(
                  date,
                  widget.selectedDate,
                );
                final dayName = DateFormat('E').format(date).toUpperCase();
                final dayNumber = date.day.toString();

                return GestureDetector(
                  // Disable tap for future dates
                  onTap: isDisabled
                      ? null
                      : () {
                          // Only notify parent, do not set local state
                          widget.onDateSelected(date);
                        },
                  child: Opacity(
                    // Reduce opacity for disabled dates
                    opacity: isDisabled ? 0.4 : 1.0,
                    child: Container(
                      width: context.scale(40),
                      padding: EdgeInsets.symmetric(
                        vertical: context.scaleHeight(8),
                      ),
                      decoration: BoxDecoration(
                        color: isSelected && !isDisabled
                            ? context.colors.primary
                            : Colors.transparent,
                        // Add border for today's date when not selected
                        border: isToday && !isSelected && !isDisabled
                            ? Border.all(
                                color: context.colors.primary,
                                width: 2,
                              )
                            : null,
                        borderRadius: BorderRadius.circular(context.scale(24)),
                      ),
                      child: Column(
                        children: [
                          Text(
                            dayName,
                            style: TextStyle(
                              fontSize: context.scaleFont(11),
                              fontWeight: FontWeight.w600,
                              color: isSelected && !isDisabled
                                  ? Colors.white
                                  : const Color(0xFF90A4AE),
                            ),
                          ),
                          SizedBox(height: context.scaleHeight(4)),
                          Text(
                            dayNumber,
                            style: TextStyle(
                              fontSize: context.scaleFont(16),
                              fontWeight: FontWeight.bold,
                              color: isSelected && !isDisabled
                                  ? Colors.white
                                  : const Color(0xFF455A64),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
