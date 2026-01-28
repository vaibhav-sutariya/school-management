import 'package:auto_route/auto_route.dart';
import 'package:starter_app/core/routes/app_router.gr.dart';

import '../../features/auth/screens/forgot_password/ui/forgot_password_page.dart';
import '../../features/auth/screens/forgot_password/ui/new_password_page.dart';
import '../../features/auth/screens/forgot_password/ui/password_success_page.dart';
import 'app_router.gr.dart';
import 'auth_guard.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter({required this.authGuard});
  final AuthGuard authGuard;

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: VerificationRoute.page),
    AutoRoute(page: PasswordLoginRoute.page),
    AutoRoute(page: ForgotPasswordRoute.page),
    AutoRoute(page: NewPasswordRoute.page),
    AutoRoute(page: PasswordSuccessRoute.page),
    AutoRoute(page: OnboardingRoute.page),
  ];
}
