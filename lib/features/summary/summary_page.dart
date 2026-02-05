import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SummaryPage extends StatelessWidget {
  const SummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Summary Screen')));
  }
}
