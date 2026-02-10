import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/widgets/app_app_bar.dart';
import '../../../core/widgets/app_loader.dart';
import '../../../core/widgets/app_pdf_viewer.dart';
import 'bloc/assignment_pdf_bloc.dart';

@RoutePage()
class AssignmentPdfViewerPage extends StatelessWidget {
  final String pdfUrl;
  final String title;

  const AssignmentPdfViewerPage({
    super.key,
    required this.pdfUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AssignmentPdfBloc(repository: sl())..add(LoadAssignmentPdf(pdfUrl)),
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        appBar: AppAppBar(title: title),
        body: BlocBuilder<AssignmentPdfBloc, AssignmentPdfState>(
          builder: (context, state) {
            if (state is AssignmentPdfLoading) {
              return const Center(child: AppLoader());
            } else if (state is AssignmentPdfLoaded) {
              return AppPdfViewer(filePath: state.filePath);
            } else if (state is AssignmentPdfError) {
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
