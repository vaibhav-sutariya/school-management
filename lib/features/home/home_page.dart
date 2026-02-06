import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/extensions/responsive_extensions.dart';
import '../../cubit/theme_cubit.dart';
import 'cubit/home_search_cubit.dart';
import 'widgets/home_header.dart';
import 'widgets/home_search_bar.dart';
import 'widgets/quick_menu_overlay.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeSearchCubit(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        body: Stack(
          children: [
            // Blue Header Background with Bottom Radius
            Container(
              height: context.scaleHeight(
                185,
              ), // Fixed height sufficient to show radius behind menu
              decoration: BoxDecoration(
                color: context.colors.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(context.scale(20)),
                  bottomRight: Radius.circular(context.scale(20)),
                ),
              ),
            ),

            // Content
            SafeArea(
              bottom: false,
              child: Column(
                children: [
                  SizedBox(height: context.scaleHeight(5)),
                  // Header
                  const HomeHeader(),
                  SizedBox(height: context.scaleHeight(12)),
                  // Search Bar
                  const HomeSearchBar(),
                  SizedBox(
                    height: context.scaleHeight(12),
                  ), // Consitent spacing
                  // Quick Menu (Expanded to fill bottom)
                  // With margin in QuickMenuOverlay, it will show blue bg on sides
                  const Expanded(child: QuickMenuOverlay()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
