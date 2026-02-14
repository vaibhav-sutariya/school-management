import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../core/helpers/extensions/responsive_extensions.dart';
import '../../../core/widgets/app_app_bar.dart';
import '../../../core/widgets/app_loader.dart';
import 'bloc/calendar_bloc.dart';
import 'bloc/calendar_event.dart';
import 'bloc/calendar_state.dart';
import 'widgets/calendar_event_card.dart';
import 'widgets/events_calendar.dart';

@RoutePage()
class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalendarBloc()..add(LoadEvents()),
      child: const CalendarView(),
    );
  }
}

class CalendarView extends StatelessWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: const AppAppBar(title: 'Event List'),
      body: Column(
        children: [
          // Calendar Section - Only rebuilds when month/date changes
          const _CalendarSection(),

          SizedBox(height: context.scaleHeight(16)),

          // Event List Section - Only rebuilds when events change
          const Expanded(child: _EventListSection()),
        ],
      ),
    );
  }
}

class _CalendarSection extends StatelessWidget {
  const _CalendarSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarBloc, CalendarState>(
      buildWhen: (previous, current) {
        return previous.focusedMonth != current.focusedMonth ||
            previous.selectedDate != current.selectedDate;
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.scale(16),
            vertical: context.scale(16),
          ),
          child: EventsCalendar(
            focusedMonth: state.focusedMonth,
            selectedDate: state.selectedDate,
            onDateSelected: (date) {
              context.read<CalendarBloc>().add(SelectDate(date));
            },
            onMonthChanged: (month) {
              context.read<CalendarBloc>().add(ChangeMonth(month));
            },
          ),
        );
      },
    );
  }
}

class _EventListSection extends StatelessWidget {
  const _EventListSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarBloc, CalendarState>(
      buildWhen: (previous, current) {
        return previous.selectedDateEvents != current.selectedDateEvents ||
            previous.status != current.status ||
            previous.selectedDate !=
                current.selectedDate; // Update date in header
      },
      builder: (context, state) {
        if (state.status == CalendarStatus.loading) {
          return const Center(child: AppLoader());
        }

        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.scale(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Events for ${DateFormat('Today').format(state.selectedDate) == DateFormat('Today').format(DateTime.now()) ? 'Today' : DateFormat('MMM d').format(state.selectedDate)}',
                    style: TextStyle(
                      fontSize: context.scaleFont(18),
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF263238),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.scale(12),
                      vertical: context.scale(4),
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8EAF6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${state.selectedDateEvents.length} EVENTS',
                      style: TextStyle(
                        fontSize: context.scaleFont(10),
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF303F9F),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: context.scaleHeight(16)),
            Expanded(
              child: state.selectedDateEvents.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.event_available,
                            size: 48,
                            color: Colors.grey[300],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "No events for this day",
                            style: TextStyle(color: Colors.grey[500]),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.only(
                        left: context.scale(20),
                        right: context.scale(20),
                        bottom: context.scaleHeight(80),
                      ),
                      itemCount: state.selectedDateEvents.length,
                      itemBuilder: (context, index) {
                        return CalendarEventCard(
                          event: state.selectedDateEvents[index],
                        );
                      },
                    ),
            ),
          ],
        );
      },
    );
  }
}
