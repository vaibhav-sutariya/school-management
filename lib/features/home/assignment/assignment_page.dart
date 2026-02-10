import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helpers/extensions/responsive_extensions.dart';
import '../../../core/widgets/app_app_bar.dart';
import '../../../core/widgets/app_loader.dart';
import 'bloc/assignment_bloc.dart';
import 'widgets/assignment_card.dart';

@RoutePage()
class AssignmentPage extends StatelessWidget {
  const AssignmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AssignmentBloc()..add(AssignmentLoaded()),
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        appBar: const AppAppBar(title: 'Assignment'),
        body: BlocBuilder<AssignmentBloc, AssignmentState>(
          builder: (context, state) {
            if (state is AssignmentLoading) {
              return const Center(child: AppLoader());
            } else if (state is AssignmentLoadedState) {
              if (state.assignmentList.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.assignment_outlined,
                        size: context.scale(64),
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      SizedBox(height: context.scaleHeight(16)),
                      Text(
                        'No Assignments Available',
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
                itemCount: state.assignmentList.length,
                itemBuilder: (context, index) {
                  return AssignmentCard(
                    assignment: state.assignmentList[index],
                  );
                },
              );
            } else if (state is AssignmentError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
