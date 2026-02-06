import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/routes/app_router.gr.dart';
import 'widgets/dashboard_bottom_bar.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: AutoTabsScaffold(
        extendBody: true,
        routes: const [
          HomeRoute(),
          CalendarRoute(),
          SummaryRoute(),
          NoticeRoute(),
          ProfileRoute(),
        ],
        bottomNavigationBuilder: (_, tabsRouter) {
          return DashboardBottomBar(
            activeIndex: tabsRouter.activeIndex,
            onTabSelected: (index) {
              tabsRouter.setActiveIndex(index);
            },
          );
        },
      ),
    );
  }
}
