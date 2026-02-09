import 'package:freezed_annotation/freezed_annotation.dart';

part 'leave_model.freezed.dart';
part 'leave_model.g.dart';

/// Leave status enum
enum LeaveStatus {
  @JsonValue('approved')
  approved,
  @JsonValue('pending')
  pending,
  @JsonValue('rejected')
  rejected,
}

/// Leave model - ready for API integration
@freezed
abstract class LeaveModel with _$LeaveModel {
  const factory LeaveModel({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'studentId') String? studentId,
    @JsonKey(name: 'startDate') required DateTime startDate,
    @JsonKey(name: 'endDate') required DateTime endDate,
    @JsonKey(name: 'reason') required String reason,
    @JsonKey(name: 'status') required LeaveStatus status,
    @JsonKey(name: 'days') required int days,
    @JsonKey(name: 'appliedDate') DateTime? appliedDate,
    @JsonKey(name: 'approvedBy') String? approvedBy,
  }) = _LeaveModel;

  factory LeaveModel.fromJson(Map<String, dynamic> json) =>
      _$LeaveModelFromJson(json);

  /// Static mock data for development
  static List<LeaveModel> getMockData() {
    return [
      LeaveModel(
        id: '1',
        studentId: 'STU001',
        startDate: DateTime(2024, 1, 15),
        endDate: DateTime(2024, 1, 17),
        reason: 'Family Function',
        status: LeaveStatus.approved,
        days: 3,
        appliedDate: DateTime(2024, 1, 10),
        approvedBy: 'Jigna Panchal',
      ),
      LeaveModel(
        id: '2',
        studentId: 'STU001',
        startDate: DateTime(2024, 2, 5),
        endDate: DateTime(2024, 2, 5),
        reason: 'Medical Emergency',
        status: LeaveStatus.pending,
        days: 1,
        appliedDate: DateTime(2024, 2, 3),
      ),
      LeaveModel(
        id: '3',
        studentId: 'STU001',
        startDate: DateTime(2023, 12, 28),
        endDate: DateTime(2023, 12, 28),
        reason: 'Personal Work',
        status: LeaveStatus.rejected,
        days: 1,
        appliedDate: DateTime(2023, 12, 25),
      ),
    ];
  }
}

/// Extension for helper methods
extension LeaveModelExtension on LeaveModel {
  /// Get status color
  int get statusColor {
    switch (status) {
      case LeaveStatus.approved:
        return 0xFF4CAF50;
      case LeaveStatus.pending:
        return 0xFFFFA726;
      case LeaveStatus.rejected:
        return 0xFFF44336;
    }
  }

  /// Get status display text
  String get statusText {
    switch (status) {
      case LeaveStatus.approved:
        return 'Approved';
      case LeaveStatus.pending:
        return 'Pending';
      case LeaveStatus.rejected:
        return 'Rejected';
    }
  }

  /// Get formatted date range
  String get dateRange {
    if (startDate.year == endDate.year &&
        startDate.month == endDate.month &&
        startDate.day == endDate.day) {
      return '${startDate.day} ${_getMonthName(startDate.month)} ${startDate.year}';
    }
    return '${startDate.day} ${_getMonthName(startDate.month)} ${startDate.year} - ${endDate.day} ${_getMonthName(endDate.month)} ${endDate.year}';
  }

  String _getMonthName(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return months[month - 1];
  }
}
