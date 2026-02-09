import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/holiday_model.dart';
import '../models/leave_model.dart';

part 'leave_event.dart';
part 'leave_state.dart';

/// Bloc for managing Leave feature state
/// Handles tab switching, month filtering, and data loading with minimal rebuilds
class LeaveBloc extends Bloc<LeaveEvent, LeaveState> {
  final List<LeaveModel> _allLeaves = LeaveModel.getMockData();
  final List<HolidayModel> _allHolidays = HolidayModel.getMockData();

  LeaveBloc() : super(LeaveInitial()) {
    on<LoadLeaveData>(_onLoadLeaveData);
    on<ChangeTabEvent>(_onChangeTab);
    on<MonthChanged>(_onMonthChanged);
    on<RefreshLeaveData>(_onRefreshLeaveData);
  }

  /// Handle load leave data event
  Future<void> _onLoadLeaveData(
    LoadLeaveData event,
    Emitter<LeaveState> emit,
  ) async {
    emit(LeaveLoading());

    try {
      // Simulate API delay
      await Future.delayed(const Duration(milliseconds: 800));

      // Default to current month
      final now = DateTime.now();
      final currentMonth = DateTime(now.year, now.month, 1);

      final filteredLeaves = _filterLeavesByMonth(currentMonth);
      final filteredHolidays = _filterHolidaysByMonth(currentMonth);

      emit(
        LeaveLoadedState(
          leaveList: filteredLeaves,
          holidayList: filteredHolidays,
          selectedTabIndex: 0,
          selectedMonth: currentMonth,
        ),
      );
    } catch (e) {
      emit(LeaveError(e.toString()));
    }
  }

  /// Handle tab change event
  void _onChangeTab(ChangeTabEvent event, Emitter<LeaveState> emit) {
    if (state is LeaveLoadedState) {
      final currentState = state as LeaveLoadedState;
      emit(currentState.copyWith(selectedTabIndex: event.tabIndex));
    }
  }

  /// Handle month change event
  void _onMonthChanged(MonthChanged event, Emitter<LeaveState> emit) {
    if (state is LeaveLoadedState) {
      final currentState = state as LeaveLoadedState;

      // Normalize month to first day
      final selectedMonth = DateTime(event.month.year, event.month.month, 1);

      // Filter data by selected month
      final filteredLeaves = _filterLeavesByMonth(selectedMonth);
      final filteredHolidays = _filterHolidaysByMonth(selectedMonth);

      emit(
        currentState.copyWith(
          selectedMonth: selectedMonth,
          leaveList: filteredLeaves,
          holidayList: filteredHolidays,
        ),
      );
    }
  }

  /// Handle refresh leave data event
  Future<void> _onRefreshLeaveData(
    RefreshLeaveData event,
    Emitter<LeaveState> emit,
  ) async {
    if (state is LeaveLoadedState) {
      final currentState = state as LeaveLoadedState;
      try {
        // Simulate API delay
        await Future.delayed(const Duration(milliseconds: 500));

        final filteredLeaves = _filterLeavesByMonth(currentState.selectedMonth);
        final filteredHolidays = _filterHolidaysByMonth(
          currentState.selectedMonth,
        );

        emit(
          currentState.copyWith(
            leaveList: filteredLeaves,
            holidayList: filteredHolidays,
          ),
        );
      } catch (e) {
        emit(LeaveError(e.toString()));
      }
    }
  }

  /// Filter leaves by month
  List<LeaveModel> _filterLeavesByMonth(DateTime month) {
    return _allLeaves.where((leave) {
      return leave.startDate.year == month.year &&
          leave.startDate.month == month.month;
    }).toList();
  }

  /// Filter holidays by month
  List<HolidayModel> _filterHolidaysByMonth(DateTime month) {
    return _allHolidays.where((holiday) {
      return holiday.date.year == month.year &&
          holiday.date.month == month.month;
    }).toList();
  }
}
