part of 'leave_bloc.dart';

/// Base class for all Leave events
abstract class LeaveEvent {}

/// Event to change the selected tab
class ChangeTabEvent extends LeaveEvent {
  final int tabIndex;

  ChangeTabEvent(this.tabIndex);
}

/// Event to load leave data for VIEW tab
class LoadLeaveDataEvent extends LeaveEvent {}

/// Event to load holiday list data
class LoadHolidayListEvent extends LeaveEvent {}
