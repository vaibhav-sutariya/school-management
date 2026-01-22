import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../cubit/internet/internet_cubit.dart';
import '../../../../gen/assets.gen.dart';
import '../bloc/splash_bloc.dart';

@RoutePage()
class SplashPage extends StatefulWidget implements AutoRouteWrapper {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();

  /// ✅ Wrap with BlocProvider
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashBloc(
        sl.get(),
        context.read<InternetCubit>(),
      ), // inject your SplashRepository via sl()
      child: this,
    );
  }
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        // final isOnboarded = getBool('isOnboarded');
        // if (!isOnboarded) {
        //   context.router.replaceAll([const OnboardingRoute()]);
        //   return;
        // } else if (state is SplashNavigate) {
        //   context.router.replaceAll([state.route]);
        // } else if (state is SplashError) {
        //   state.failure.type == FailureType.network
        //       ? showFlushbar(
        //           context: context,
        //           message: 'No Internet Connection',
        //         )
        //       : showFlushbar(context: context, message: state.failure.message);
        // }
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Image.asset(
                  Assets.logo.schoolLogo.path,
                  // width: 200,
                  // height: 200,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
