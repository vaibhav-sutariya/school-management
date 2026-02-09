// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LeaveModel _$LeaveModelFromJson(Map<String, dynamic> json) => _LeaveModel(
  id: json['id'] as String,
  studentId: json['studentId'] as String?,
  startDate: DateTime.parse(json['startDate'] as String),
  endDate: DateTime.parse(json['endDate'] as String),
  reason: json['reason'] as String,
  status: $enumDecode(_$LeaveStatusEnumMap, json['status']),
  days: (json['days'] as num).toInt(),
  appliedDate: json['appliedDate'] == null
      ? null
      : DateTime.parse(json['appliedDate'] as String),
  approvedBy: json['approvedBy'] as String?,
);

Map<String, dynamic> _$LeaveModelToJson(_LeaveModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'studentId': instance.studentId,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'reason': instance.reason,
      'status': _$LeaveStatusEnumMap[instance.status]!,
      'days': instance.days,
      'appliedDate': instance.appliedDate?.toIso8601String(),
      'approvedBy': instance.approvedBy,
    };

const _$LeaveStatusEnumMap = {
  LeaveStatus.approved: 'approved',
  LeaveStatus.pending: 'pending',
  LeaveStatus.rejected: 'rejected',
};
