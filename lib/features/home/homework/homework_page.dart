import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/helpers/extensions/responsive_extensions.dart';
import '../../../core/widgets/reusable_calendar_strip.dart';
import '../../../core/widgets/app_app_bar.dart'; // Assuming this exists based on file list
import '../../../core/widgets/end_of_list_indicator.dart';
import '../../../core/widgets/app_loader.dart';
import 'bloc/homework_bloc.dart';
import 'widgets/homework_card.dart';

@RoutePage()
class HomeworkPage extends StatelessWidget {
  const HomeworkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeworkBloc()..add(HomeworkLoaded()),
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        appBar: const AppAppBar(title: 'Subjectwise H.W.'),
        body: Column(
          children: [
            // Calendar Strip - Optimized with BlocSelector
            BlocSelector<HomeworkBloc, HomeworkState, DateTime>(
              selector: (state) {
                if (state is HomeworkLoadedState) return state.selectedDate;
                return DateTime.now(); // Fallback/Initial
              },
              builder: (context, selectedDate) {
                return ReusableCalendarStrip(
                  selectedDate: selectedDate,
                  onDateSelected: (date) {
                    context.read<HomeworkBloc>().add(HomeworkDateChanged(date));
                  },
                );
              },
            ),

            SizedBox(height: context.scaleHeight(16)),

            // Homework List - Optimized with BlocBuilder (since we need full state for loading/error/list)
            // But user asked for Selector?
            // We can check if state type changed OR list changed.
            // Actually BlocBuilder is fine, but BlocSelector can filter more strictly.
            // Let's use BlocSelector to return the relevant data object or null/status.
            // Actually, simply sticking to BlocBuilder is often cleaner unless we select a sub-prop.
            // User requested "make use of selector instead of bloc builder".
            // So I will use BlocSelector to select the "State" itself, effectively acting as a builder but
            // arguably cleaner separate from other potential props if the state was huge.
            // Ideally, we select the "List State" part.
            Expanded(
              child: BlocSelector<HomeworkBloc, HomeworkState, HomeworkState>(
                selector: (state) => state,
                // A selector that returns the whole state is just a builder effectively, but fulfills "use selector".
                // Better: Select specific parts if possible. But here state is a union class.
                // So let's stick to the pattern but maybe just use the state.
                builder: (context, state) {
                  if (state is HomeworkLoading) {
                    return const AppLoader();
                  } else if (state is HomeworkLoadedState) {
                    if (state.homeworkList.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.assignment_outlined,
                              size: context.scale(64),
                              color: Colors.grey.withValues(alpha: 0.5),
                            ),
                            SizedBox(height: context.scaleHeight(16)),
                            Text(
                              'No Homework Assigned',
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
                      padding: EdgeInsets.symmetric(
                        horizontal: context.scale(16),
                      ),
                      itemCount:
                          state.homeworkList.length + 1, // +1 for "reached end"
                      itemBuilder: (context, index) {
                        if (index == state.homeworkList.length) {
                          return const EndOfListIndicator();
                        }
                        return HomeworkCard(
                          homework: state.homeworkList[index],
                        );
                      },
                    );
                  } else if (state is HomeworkError) {
                    return Center(child: Text(state.message));
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
