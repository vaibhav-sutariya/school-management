import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/app_app_bar.dart';
import '../../../core/widgets/app_tab_bar.dart';
import '../../../cubit/theme_cubit.dart';
import 'bloc/leave_bloc.dart';
import 'widgets/holiday_list_tab.dart';
import 'widgets/view_tab.dart';

/// My Leave page with tabbed interface
/// Features:
/// - VIEW tab: Leave applications and balance
/// - HOLIDAY LIST tab: School holiday calendar
/// - High performance with minimal rebuilds
/// - Production-ready code
@RoutePage()
class LeavePage extends StatelessWidget {
  const LeavePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LeaveBloc(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        appBar: const AppAppBar(title: 'My Leave'),
        body: Column(
          children: [
            // Tab Bar - only rebuilds when selected index changes
            BlocSelector<LeaveBloc, LeaveState, int>(
              selector: (state) => state.selectedTabIndex,
              builder: (context, selectedIndex) {
                return AppTabBar(
                  tabs: const ['VIEW', 'HOLIDAY LIST'],
                  selectedIndex: selectedIndex,
                  onTabChanged: (index) {
                    context.read<LeaveBloc>().add(ChangeTabEvent(index));
                  },
                );
              },
            ),
            // Tab Content - IndexedStack keeps both tabs alive
            Expanded(
              child: BlocSelector<LeaveBloc, LeaveState, int>(
                selector: (state) => state.selectedTabIndex,
                builder: (context, selectedIndex) {
                  return IndexedStack(
                    index: selectedIndex,
                    children: const [ViewTab(), HolidayListTab()],
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // TODO: Navigate to apply leave page
          },
          backgroundColor: context.colors.primary,
          foregroundColor: Colors.white,
          elevation: 4,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
