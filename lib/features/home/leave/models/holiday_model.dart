import 'package:freezed_annotation/freezed_annotation.dart';

part 'holiday_model.freezed.dart';
part 'holiday_model.g.dart';

/// Holiday type enum
enum HolidayType {
  @JsonValue('national')
  national,
  @JsonValue('festival')
  festival,
  @JsonValue('school')
  school,
}

/// Holiday model - ready for API integration
@freezed
abstract class HolidayModel with _$HolidayModel {
  const factory HolidayModel({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'date') required DateTime date,
    @JsonKey(name: 'type') required HolidayType type,
    @JsonKey(name: 'description') String? description,
  }) = _HolidayModel;

  factory HolidayModel.fromJson(Map<String, dynamic> json) =>
      _$HolidayModelFromJson(json);

  /// Static mock data for development
  static List<HolidayModel> getMockData() {
    return [
      HolidayModel(
        id: '1',
        name: 'Republic Day',
        date: DateTime(2024, 1, 26),
        type: HolidayType.national,
        description: 'National Holiday',
      ),
      HolidayModel(
        id: '2',
        name: 'Holi',
        date: DateTime(2024, 3, 25),
        type: HolidayType.festival,
        description: 'Festival of Colors',
      ),
      HolidayModel(
        id: '3',
        name: 'Summer Break',
        date: DateTime(2024, 5, 15),
        type: HolidayType.school,
        description: 'Summer vacation starts',
      ),
      HolidayModel(
        id: '4',
        name: 'Independence Day',
        date: DateTime(2024, 8, 15),
        type: HolidayType.national,
        description: 'National Holiday',
      ),
      HolidayModel(
        id: '5',
        name: 'Diwali',
        date: DateTime(2024, 11, 1),
        type: HolidayType.festival,
        description: 'Festival of Lights',
      ),
      HolidayModel(
        id: '6',
        name: 'Christmas',
        date: DateTime(2024, 12, 25),
        type: HolidayType.festival,
        description: 'Christmas Day',
      ),
    ];
  }
}

/// Extension for helper methods
extension HolidayModelExtension on HolidayModel {
  /// Get type color
  int get typeColor {
    switch (type) {
      case HolidayType.national:
        return 0xFFFF5722;
      case HolidayType.festival:
        return 0xFF9C27B0;
      case HolidayType.school:
        return 0xFF2196F3;
    }
  }

  /// Get type display text
  String get typeText {
    switch (type) {
      case HolidayType.national:
        return 'National';
      case HolidayType.festival:
        return 'Festival';
      case HolidayType.school:
        return 'School';
    }
  }

  /// Get formatted date
  String get formattedDate {
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
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }
}
