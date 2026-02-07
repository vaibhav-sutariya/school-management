import 'package:auto_route/auto_route.dart';
import 'package:starter_app/core/routes/app_router.gr.dart';

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
    AutoRoute(
      page: DashboardRoute.page,
      children: [
        AutoRoute(page: CalendarRoute.page),
        AutoRoute(page: SummaryRoute.page),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: NoticeRoute.page),
        AutoRoute(page: ProfileRoute.page),
      ],
    ),
    AutoRoute(page: AttendanceRoute.page),
    // AutoRoute(page: HomeworkRoute.page),
    AutoRoute(page: GalleryRoute.page),
    AutoRoute(page: GalleryDetailRoute.page),
    AutoRoute(page: GalleryImageViewerRoute.page),
    AutoRoute(page: VideosRoute.page),
    AutoRoute(page: VideoDetailRoute.page),
    AutoRoute(page: VideoViewerRoute.page),
    AutoRoute(page: RemarksRoute.page),
    AutoRoute(page: RemarkDetailRoute.page),
  ];
}
