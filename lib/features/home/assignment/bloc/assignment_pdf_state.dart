part of 'assignment_pdf_bloc.dart';

abstract class AssignmentPdfState extends Equatable {
  const AssignmentPdfState();

  @override
  List<Object> get props => [];
}

class AssignmentPdfLoading extends AssignmentPdfState {}

class AssignmentPdfLoaded extends AssignmentPdfState {
  final String filePath;

  const AssignmentPdfLoaded(this.filePath);

  @override
  List<Object> get props => [filePath];
}

class AssignmentPdfError extends AssignmentPdfState {
  final String message;

  const AssignmentPdfError(this.message);

  @override
  List<Object> get props => [message];
}
