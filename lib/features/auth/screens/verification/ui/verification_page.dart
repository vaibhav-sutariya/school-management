import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import 'widgets/verification_bottom_sheet.dart';
import 'widgets/verification_header.dart';

@RoutePage()
class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensuring the Primary Color (Dark Blue) is used for the background
    const backgroundColor = Color(0xFF0D078B);

    return const Scaffold(
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
