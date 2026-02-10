part of 'syllabus_pdf_bloc.dart';

abstract class SyllabusPdfEvent extends Equatable {
  const SyllabusPdfEvent();

  @override
  List<Object> get props => [];
}

class LoadSyllabusPdf extends SyllabusPdfEvent {
  final String pdfUrl;

  const LoadSyllabusPdf(this.pdfUrl);

  @override
  List<Object> get props => [pdfUrl];
}
