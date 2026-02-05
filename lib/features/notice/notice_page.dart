import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NoticePage extends StatelessWidget {
  const NoticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Notice Screen')));
  }
}
