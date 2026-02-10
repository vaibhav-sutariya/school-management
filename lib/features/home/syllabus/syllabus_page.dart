import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helpers/extensions/responsive_extensions.dart';
import '../../../core/widgets/app_app_bar.dart';
import '../../../core/widgets/app_loader.dart';
import 'bloc/syllabus_bloc.dart';
import 'widgets/syllabus_card.dart';

@RoutePage()
class SyllabusPage extends StatelessWidget {
  const SyllabusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SyllabusBloc()..add(SyllabusLoaded()),
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        appBar: const AppAppBar(title: 'Syllabus'),
        body: BlocBuilder<SyllabusBloc, SyllabusState>(
          builder: (context, state) {
            if (state is SyllabusLoading) {
              return const Center(child: AppLoader());
            } else if (state is SyllabusLoadedState) {
              if (state.syllabusList.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.description_outlined,
                        size: context.scale(64),
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      SizedBox(height: context.scaleHeight(16)),
                      Text(
                        'No Syllabus Available',
                        style: TextStyle(
                          fontSize: context.scaleFont(16),
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              }

              return ListView.builder(
                padding: EdgeInsets.all(context.scale(16)),
                itemCount: state.syllabusList.length,
                itemBuilder: (context, index) {
                  return SyllabusCard(syllabus: state.syllabusList[index]);
                },
              );
            } else if (state is SyllabusError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
