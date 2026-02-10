part of 'syllabus_pdf_bloc.dart';

abstract class SyllabusPdfState extends Equatable {
  const SyllabusPdfState();

  @override
  List<Object> get props => [];
}

class SyllabusPdfLoading extends SyllabusPdfState {}

class SyllabusPdfLoaded extends SyllabusPdfState {
  final String filePath;

  const SyllabusPdfLoaded(this.filePath);

  @override
  List<Object> get props => [filePath];
}

class SyllabusPdfError extends SyllabusPdfState {
  final String message;

  const SyllabusPdfError(this.message);

  @override
  List<Object> get props => [message];
}
