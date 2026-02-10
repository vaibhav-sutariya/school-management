import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repositories/assignment_repository.dart';

part 'assignment_pdf_event.dart';
part 'assignment_pdf_state.dart';

class AssignmentPdfBloc extends Bloc<AssignmentPdfEvent, AssignmentPdfState> {
  final AssignmentRepository repository;

  AssignmentPdfBloc({required this.repository})
    : super(AssignmentPdfLoading()) {
    on<LoadAssignmentPdf>(_onLoadAssignmentPdf);
  }

  Future<void> _onLoadAssignmentPdf(
    LoadAssignmentPdf event,
    Emitter<AssignmentPdfState> emit,
  ) async {
    emit(AssignmentPdfLoading());

    final result = await repository.getAssignmentPdf(url: event.pdfUrl);

    result.fold(
      (failure) => emit(AssignmentPdfError(failure.message)),
      (filePath) => emit(AssignmentPdfLoaded(filePath)),
    );
  }
}
