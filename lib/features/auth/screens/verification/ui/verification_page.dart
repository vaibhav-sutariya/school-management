import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../../../../cubit/theme_cubit.dart';
import 'widgets/verification_bottom_sheet.dart';
import 'widgets/verification_header.dart';

@RoutePage()
class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensuring the Primary Color (Dark Blue) is used for the background
    final backgroundColor = context.colors.primary;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            VerificationHeader(),
            SizedBox(height: 20), // Spacing below header
            Expanded(child: VerificationBottomSheet()),
          ],
        ),
      ),
    );
  }
}
