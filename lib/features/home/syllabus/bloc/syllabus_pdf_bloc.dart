import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repositories/syllabus_repository.dart';

part 'syllabus_pdf_event.dart';
part 'syllabus_pdf_state.dart';

class SyllabusPdfBloc extends Bloc<SyllabusPdfEvent, SyllabusPdfState> {
  final SyllabusRepository repository;

  SyllabusPdfBloc({required this.repository}) : super(SyllabusPdfLoading()) {
    on<LoadSyllabusPdf>(_onLoadSyllabusPdf);
  }

  Future<void> _onLoadSyllabusPdf(
    LoadSyllabusPdf event,
    Emitter<SyllabusPdfState> emit,
  ) async {
    emit(SyllabusPdfLoading());

    final result = await repository.getSyllabusPdf(url: event.pdfUrl);

    result.fold(
      (failure) => emit(SyllabusPdfError(failure.message)),
      (filePath) => emit(SyllabusPdfLoaded(filePath)),
    );
  }
}
