import 'package:flutter_bloc/flutter_bloc.dart';

part 'leave_event.dart';
part 'leave_state.dart';

/// Bloc for managing Leave feature state
/// Handles tab switching and data loading with minimal rebuilds
class LeaveBloc extends Bloc<LeaveEvent, LeaveState> {
  LeaveBloc() : super(LeaveState.initial()) {
    on<ChangeTabEvent>(_onChangeTab);
    on<LoadLeaveDataEvent>(_onLoadLeaveData);
    on<LoadHolidayListEvent>(_onLoadHolidayList);
  }

  /// Handle tab change event
  void _onChangeTab(ChangeTabEvent event, Emitter<LeaveState> emit) {
    emit(state.copyWith(selectedTabIndex: event.tabIndex));
  }

  /// Handle load leave data event
  Future<void> _onLoadLeaveData(
    LoadLeaveDataEvent event,
    Emitter<LeaveState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    try {
      // TODO: Implement actual data loading from repository
      // For now, just simulate loading
      await Future.delayed(const Duration(milliseconds: 500));

      emit(state.copyWith(isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  /// Handle load holiday list event
  Future<void> _onLoadHolidayList(
    LoadHolidayListEvent event,
    Emitter<LeaveState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    try {
      // TODO: Implement actual data loading from repository
      // For now, just simulate loading
      await Future.delayed(const Duration(milliseconds: 500));

      emit(state.copyWith(isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
