import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/widgets/app_app_bar.dart';
import '../../../core/widgets/app_loader.dart';
import '../../../core/widgets/app_pdf_viewer.dart';
import 'bloc/syllabus_pdf_bloc.dart';

@RoutePage()
class SyllabusPdfViewerPage extends StatelessWidget {
  final String pdfUrl;
  final String title;

  const SyllabusPdfViewerPage({
    super.key,
    required this.pdfUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SyllabusPdfBloc(repository: sl())..add(LoadSyllabusPdf(pdfUrl)),
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        appBar: AppAppBar(title: title),
        body: BlocBuilder<SyllabusPdfBloc, SyllabusPdfState>(
          builder: (context, state) {
            if (state is SyllabusPdfLoading) {
              return const Center(child: AppLoader());
            } else if (state is SyllabusPdfLoaded) {
              return AppPdfViewer(filePath: state.filePath);
            } else if (state is SyllabusPdfError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
