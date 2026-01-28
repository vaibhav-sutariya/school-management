import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../../../../cubit/theme_cubit.dart';
import 'widgets/login_form_sheet.dart';
import 'widgets/portal_header.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensuring the Primary Color (Dark Blue) is used for the background
    // If context.colors.primary differs, we hardcode to match reference or use theme
    final backgroundColor = context.colors.primary;

    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: const Column(
          children: [
            Expanded(
              flex: 2, // Header takes ~30-35% of screen
              child: Center(child: PortalHeader()),
            ),
            Expanded(
              flex: 5, // Bottom sheet takes remaining space
              child: LoginFormSheet(),
            ),
          ],
        ),
      ),
    );
  }
}
