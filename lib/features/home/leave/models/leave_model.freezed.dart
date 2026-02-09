// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leave_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LeaveModel {

@JsonKey(name: 'id') String get id;@JsonKey(name: 'studentId') String? get studentId;@JsonKey(name: 'startDate') DateTime get startDate;@JsonKey(name: 'endDate') DateTime get endDate;@JsonKey(name: 'reason') String get reason;@JsonKey(name: 'status') LeaveStatus get status;@JsonKey(name: 'days') int get days;@JsonKey(name: 'appliedDate') DateTime? get appliedDate;@JsonKey(name: 'approvedBy') String? get approvedBy;
/// Create a copy of LeaveModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeaveModelCopyWith<LeaveModel> get copyWith => _$LeaveModelCopyWithImpl<LeaveModel>(this as LeaveModel, _$identity);

  /// Serializes this LeaveModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeaveModel&&(identical(other.id, id) || other.id == id)&&(identical(other.studentId, studentId) || other.studentId == studentId)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.status, status) || other.status == status)&&(identical(other.days, days) || other.days == days)&&(identical(other.appliedDate, appliedDate) || other.appliedDate == appliedDate)&&(identical(other.approvedBy, approvedBy) || other.approvedBy == approvedBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,studentId,startDate,endDate,reason,status,days,appliedDate,approvedBy);

@override
String toString() {
  return 'LeaveModel(id: $id, studentId: $studentId, startDate: $startDate, endDate: $endDate, reason: $reason, status: $status, days: $days, appliedDate: $appliedDate, approvedBy: $approvedBy)';
}


}

/// @nodoc
abstract mixin class $LeaveModelCopyWith<$Res>  {
  factory $LeaveModelCopyWith(LeaveModel value, $Res Function(LeaveModel) _then) = _$LeaveModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String id,@JsonKey(name: 'studentId') String? studentId,@JsonKey(name: 'startDate') DateTime startDate,@JsonKey(name: 'endDate') DateTime endDate,@JsonKey(name: 'reason') String reason,@JsonKey(name: 'status') LeaveStatus status,@JsonKey(name: 'days') int days,@JsonKey(name: 'appliedDate') DateTime? appliedDate,@JsonKey(name: 'approvedBy') String? approvedBy
});




}
/// @nodoc
class _$LeaveModelCopyWithImpl<$Res>
    implements $LeaveModelCopyWith<$Res> {
  _$LeaveModelCopyWithImpl(this._self, this._then);

  final LeaveModel _self;
  final $Res Function(LeaveModel) _then;

/// Create a copy of LeaveModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? studentId = freezed,Object? startDate = null,Object? endDate = null,Object? reason = null,Object? status = null,Object? days = null,Object? appliedDate = freezed,Object? approvedBy = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,studentId: freezed == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as String?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LeaveStatus,days: null == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
as int,appliedDate: freezed == appliedDate ? _self.appliedDate : appliedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,approvedBy: freezed == approvedBy ? _self.approvedBy : approvedBy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LeaveModel].
extension LeaveModelPatterns on LeaveModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LeaveModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LeaveModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LeaveModel value)  $default,){
final _that = this;
switch (_that) {
case _LeaveModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LeaveModel value)?  $default,){
final _that = this;
switch (_that) {
case _LeaveModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'studentId')  String? studentId, @JsonKey(name: 'startDate')  DateTime startDate, @JsonKey(name: 'endDate')  DateTime endDate, @JsonKey(name: 'reason')  String reason, @JsonKey(name: 'status')  LeaveStatus status, @JsonKey(name: 'days')  int days, @JsonKey(name: 'appliedDate')  DateTime? appliedDate, @JsonKey(name: 'approvedBy')  String? approvedBy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LeaveModel() when $default != null:
return $default(_that.id,_that.studentId,_that.startDate,_that.endDate,_that.reason,_that.status,_that.days,_that.appliedDate,_that.approvedBy);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'studentId')  String? studentId, @JsonKey(name: 'startDate')  DateTime startDate, @JsonKey(name: 'endDate')  DateTime endDate, @JsonKey(name: 'reason')  String reason, @JsonKey(name: 'status')  LeaveStatus status, @JsonKey(name: 'days')  int days, @JsonKey(name: 'appliedDate')  DateTime? appliedDate, @JsonKey(name: 'approvedBy')  String? approvedBy)  $default,) {final _that = this;
switch (_that) {
case _LeaveModel():
return $default(_that.id,_that.studentId,_that.startDate,_that.endDate,_that.reason,_that.status,_that.days,_that.appliedDate,_that.approvedBy);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'studentId')  String? studentId, @JsonKey(name: 'startDate')  DateTime startDate, @JsonKey(name: 'endDate')  DateTime endDate, @JsonKey(name: 'reason')  String reason, @JsonKey(name: 'status')  LeaveStatus status, @JsonKey(name: 'days')  int days, @JsonKey(name: 'appliedDate')  DateTime? appliedDate, @JsonKey(name: 'approvedBy')  String? approvedBy)?  $default,) {final _that = this;
switch (_that) {
case _LeaveModel() when $default != null:
return $default(_that.id,_that.studentId,_that.startDate,_that.endDate,_that.reason,_that.status,_that.days,_that.appliedDate,_that.approvedBy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LeaveModel implements LeaveModel {
  const _LeaveModel({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'studentId') this.studentId, @JsonKey(name: 'startDate') required this.startDate, @JsonKey(name: 'endDate') required this.endDate, @JsonKey(name: 'reason') required this.reason, @JsonKey(name: 'status') required this.status, @JsonKey(name: 'days') required this.days, @JsonKey(name: 'appliedDate') this.appliedDate, @JsonKey(name: 'approvedBy') this.approvedBy});
  factory _LeaveModel.fromJson(Map<String, dynamic> json) => _$LeaveModelFromJson(json);

@override@JsonKey(name: 'id') final  String id;
@override@JsonKey(name: 'studentId') final  String? studentId;
@override@JsonKey(name: 'startDate') final  DateTime startDate;
@override@JsonKey(name: 'endDate') final  DateTime endDate;
@override@JsonKey(name: 'reason') final  String reason;
@override@JsonKey(name: 'status') final  LeaveStatus status;
@override@JsonKey(name: 'days') final  int days;
@override@JsonKey(name: 'appliedDate') final  DateTime? appliedDate;
@override@JsonKey(name: 'approvedBy') final  String? approvedBy;

/// Create a copy of LeaveModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeaveModelCopyWith<_LeaveModel> get copyWith => __$LeaveModelCopyWithImpl<_LeaveModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeaveModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeaveModel&&(identical(other.id, id) || other.id == id)&&(identical(other.studentId, studentId) || other.studentId == studentId)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.status, status) || other.status == status)&&(identical(other.days, days) || other.days == days)&&(identical(other.appliedDate, appliedDate) || other.appliedDate == appliedDate)&&(identical(other.approvedBy, approvedBy) || other.approvedBy == approvedBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,studentId,startDate,endDate,reason,status,days,appliedDate,approvedBy);

@override
String toString() {
  return 'LeaveModel(id: $id, studentId: $studentId, startDate: $startDate, endDate: $endDate, reason: $reason, status: $status, days: $days, appliedDate: $appliedDate, approvedBy: $approvedBy)';
}


}

/// @nodoc
abstract mixin class _$LeaveModelCopyWith<$Res> implements $LeaveModelCopyWith<$Res> {
  factory _$LeaveModelCopyWith(_LeaveModel value, $Res Function(_LeaveModel) _then) = __$LeaveModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String id,@JsonKey(name: 'studentId') String? studentId,@JsonKey(name: 'startDate') DateTime startDate,@JsonKey(name: 'endDate') DateTime endDate,@JsonKey(name: 'reason') String reason,@JsonKey(name: 'status') LeaveStatus status,@JsonKey(name: 'days') int days,@JsonKey(name: 'appliedDate') DateTime? appliedDate,@JsonKey(name: 'approvedBy') String? approvedBy
});




}
/// @nodoc
class __$LeaveModelCopyWithImpl<$Res>
    implements _$LeaveModelCopyWith<$Res> {
  __$LeaveModelCopyWithImpl(this._self, this._then);

  final _LeaveModel _self;
  final $Res Function(_LeaveModel) _then;

/// Create a copy of LeaveModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? studentId = freezed,Object? startDate = null,Object? endDate = null,Object? reason = null,Object? status = null,Object? days = null,Object? appliedDate = freezed,Object? approvedBy = freezed,}) {
  return _then(_LeaveModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,studentId: freezed == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as String?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LeaveStatus,days: null == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
as int,appliedDate: freezed == appliedDate ? _self.appliedDate : appliedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,approvedBy: freezed == approvedBy ? _self.approvedBy : approvedBy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
