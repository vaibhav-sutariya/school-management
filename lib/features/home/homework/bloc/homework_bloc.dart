import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/homework_model.dart';

// Events
abstract class HomeworkEvent extends Equatable {
  const HomeworkEvent();

  @override
  List<Object> get props => [];
}

class HomeworkDateChanged extends HomeworkEvent {
  final DateTime date;

  const HomeworkDateChanged(this.date);

  @override
  List<Object> get props => [date];
}

class HomeworkLoaded extends HomeworkEvent {}

// States
abstract class HomeworkState extends Equatable {
  const HomeworkState();

  @override
  List<Object> get props => [];
}

class HomeworkInitial extends HomeworkState {}

class HomeworkLoading extends HomeworkState {}

class HomeworkLoadedState extends HomeworkState {
  final List<HomeworkEntity> homeworkList;
  final DateTime selectedDate;

  const HomeworkLoadedState({
    required this.homeworkList,
    required this.selectedDate,
  });

  @override
  List<Object> get props => [homeworkList, selectedDate];
}

class HomeworkError extends HomeworkState {
  final String message;

  const HomeworkError(this.message);

  @override
  List<Object> get props => [message];
}

// Bloc
class HomeworkBloc extends Bloc<HomeworkEvent, HomeworkState> {
  final List<HomeworkEntity> _allHomework = HomeworkEntity.getMockData();

  HomeworkBloc() : super(HomeworkInitial()) {
    on<HomeworkLoaded>(_onLoaded);
    on<HomeworkDateChanged>(_onDateChanged);
  }

  void _onLoaded(HomeworkLoaded event, Emitter<HomeworkState> emit) {
    emit(HomeworkLoading());
    // Simulate API delay
    // await Future.delayed(const Duration(milliseconds: 500));

    // Initial load - show current date's homework
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    // For mock purposes, just return all or filter by today if matching mock data
    // Let's just return matches for 'today' if any, but since mock data is limited,
    // let's ensure we show something.
    // Actually, let's filter correctly to demonstrate logic.

    final filtered = _filterHomeworkByDate(today);

    emit(HomeworkLoadedState(homeworkList: filtered, selectedDate: today));
  }

  void _onDateChanged(HomeworkDateChanged event, Emitter<HomeworkState> emit) {
    if (state is HomeworkLoadedState) {
      final selectedDate = DateTime(
        event.date.year,
        event.date.month,
        event.date.day,
      );
      final filtered = _filterHomeworkByDate(selectedDate);

      emit(
        HomeworkLoadedState(homeworkList: filtered, selectedDate: selectedDate),
      );
    }
  }

  List<HomeworkEntity> _filterHomeworkByDate(DateTime date) {
    return _allHomework.where((hw) {
      final hwDate = DateTime(hw.date.year, hw.date.month, hw.date.day);
      return hwDate.isAtSameMomentAs(date);
    }).toList();
  }
}
