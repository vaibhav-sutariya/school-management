part of 'assignment_pdf_bloc.dart';

abstract class AssignmentPdfEvent extends Equatable {
  const AssignmentPdfEvent();

  @override
  List<Object> get props => [];
}

class LoadAssignmentPdf extends AssignmentPdfEvent {
  final String pdfUrl;

  const LoadAssignmentPdf(this.pdfUrl);

  @override
  List<Object> get props => [pdfUrl];
}
