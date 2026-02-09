part of 'leave_bloc.dart';

/// State for Leave feature
class LeaveState {
  /// Currently selected tab index (0 = VIEW, 1 = HOLIDAY LIST)
  final int selectedTabIndex;

  /// Loading state
  final bool isLoading;

  /// Error message if any
  final String? errorMessage;

  const LeaveState({
    required this.selectedTabIndex,
    this.isLoading = false,
    this.errorMessage,
  });

  /// Initial state
  factory LeaveState.initial() {
    return const LeaveState(selectedTabIndex: 0, isLoading: false);
  }

  /// Copy with method for immutable state updates
  LeaveState copyWith({
    int? selectedTabIndex,
    bool? isLoading,
    String? errorMessage,
  }) {
    return LeaveState(
      selectedTabIndex: selectedTabIndex ?? this.selectedTabIndex,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
