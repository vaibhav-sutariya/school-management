// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i48;
import 'package:collection/collection.dart' as _i53;
import 'package:flutter/material.dart' as _i49;
import 'package:starter_app/core/widgets/app_web_view_page.dart' as _i4;
import 'package:starter_app/core/widgets/scroll_aware_bottom_bar_controller.dart'
    as _i54;
import 'package:starter_app/features/auth/screens/forgot_password/ui/forgot_password_page.dart'
    as _i14;
import 'package:starter_app/features/auth/screens/forgot_password/ui/new_password_page.dart'
    as _i26;
import 'package:starter_app/features/auth/screens/forgot_password/ui/password_success_page.dart'
    as _i32;
import 'package:starter_app/features/auth/screens/login/ui/login_page.dart'
    as _i24;
import 'package:starter_app/features/auth/screens/password_login/ui/password_login_page.dart'
    as _i31;
import 'package:starter_app/features/auth/screens/verification/ui/verification_page.dart'
    as _i44;
import 'package:starter_app/features/calendar/calendar_page.dart' as _i7;
import 'package:starter_app/features/dashboard/dashboard_page.dart' as _i12;
import 'package:starter_app/features/home/assignment/assignment_page.dart'
    as _i5;
import 'package:starter_app/features/home/attendance/attendance_page.dart'
    as _i6;
import 'package:starter_app/features/home/class_test/class_test_page.dart'
    as _i8;
import 'package:starter_app/features/home/classwork/classwork_page.dart' as _i9;
import 'package:starter_app/features/home/concern/add_concern/add_concern_page.dart'
    as _i2;
import 'package:starter_app/features/home/concern/concern_details/concern_details_page.dart'
    as _i10;
import 'package:starter_app/features/home/concern/concern_page.dart' as _i11;
import 'package:starter_app/features/home/concern/models/concern_model.dart'
    as _i50;
import 'package:starter_app/features/home/exam_time_table/ui/exam_time_table_page.dart'
    as _i13;
import 'package:starter_app/features/home/gallery/gallery_details_screen/gallery_detail_page.dart'
    as _i15;
import 'package:starter_app/features/home/gallery/gallery_screen/gallery_page.dart'
    as _i17;
import 'package:starter_app/features/home/gallery/gallery_screen/models/gallery_image_model.dart'
    as _i52;
import 'package:starter_app/features/home/gallery/gallery_screen/models/gallery_model.dart'
    as _i51;
import 'package:starter_app/features/home/gallery/viewer_screen/gallery_image_viewer_page.dart'
    as _i16;
import 'package:starter_app/features/home/gate_pass/gate_pass_page.dart'
    as _i18;
import 'package:starter_app/features/home/holiday_hw/holiday_hw_page.dart'
    as _i19;
import 'package:starter_app/features/home/home_screen/home_page.dart' as _i20;
import 'package:starter_app/features/home/homework/homework_page.dart' as _i21;
import 'package:starter_app/features/home/leave/add_leave/add_leave_page.dart'
    as _i3;
import 'package:starter_app/features/home/leave/leave_detail_screen/leave_detail_page.dart'
    as _i22;
import 'package:starter_app/features/home/leave/leave_screen/leave_page.dart'
    as _i23;
import 'package:starter_app/features/home/meal_menu/meal_menu_page.dart'
    as _i25;
import 'package:starter_app/features/home/paper/paper_page.dart' as _i30;
import 'package:starter_app/features/home/remarks/remark_details_screen/remark_detail_page.dart'
    as _i35;
import 'package:starter_app/features/home/remarks/remarks_screen/models/remark_model.dart'
    as _i55;
import 'package:starter_app/features/home/remarks/remarks_screen/remarks_page.dart'
    as _i36;
import 'package:starter_app/features/home/report_card/report_card_page.dart'
    as _i37;
import 'package:starter_app/features/home/syllabus/syllabus_page.dart' as _i42;
import 'package:starter_app/features/home/time_table/ui/time_table_page.dart'
    as _i43;
import 'package:starter_app/features/home/videos/detail/video_detail_page.dart'
    as _i45;
import 'package:starter_app/features/home/videos/videos_screen/models/video_item_model.dart'
    as _i57;
import 'package:starter_app/features/home/videos/videos_screen/models/video_model.dart'
    as _i56;
import 'package:starter_app/features/home/videos/videos_screen/videos_page.dart'
    as _i47;
import 'package:starter_app/features/home/videos/viewer_screen/video_viewer_page.dart'
    as _i46;
import 'package:starter_app/features/notice/notice_page.dart' as _i27;
import 'package:starter_app/features/notifications/notification_page.dart'
    as _i28;
import 'package:starter_app/features/onboarding/onboarding_page.dart' as _i29;
import 'package:starter_app/features/pdf_viewer/pdf_viewer_page.dart' as _i33;
import 'package:starter_app/features/profile/about_app/about_app_page.dart'
    as _i1;
import 'package:starter_app/features/profile/profile_page/profile_page.dart'
    as _i34;
import 'package:starter_app/features/profile/reset_password/reset_password_page.dart'
    as _i38;
import 'package:starter_app/features/profile/student_profile/student_profile_page.dart'
    as _i40;
import 'package:starter_app/features/splash/screens/ui/splash_screen.dart'
    as _i39;
import 'package:starter_app/features/summary/summary_page.dart' as _i41;

/// generated route for
/// [_i1.AboutAppPage]
class AboutAppRoute extends _i48.PageRouteInfo<void> {
  const AboutAppRoute({List<_i48.PageRouteInfo>? children})
    : super(AboutAppRoute.name, initialChildren: children);

  static const String name = 'AboutAppRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      return const _i1.AboutAppPage();
    },
  );
}

/// generated route for
/// [_i2.AddConcernPage]
class AddConcernRoute extends _i48.PageRouteInfo<void> {
  const AddConcernRoute({List<_i48.PageRouteInfo>? children})
    : super(AddConcernRoute.name, initialChildren: children);

  static const String name = 'AddConcernRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      return const _i2.AddConcernPage();
    },
  );
}

/// generated route for
/// [_i3.AddLeavePage]
class AddLeaveRoute extends _i48.PageRouteInfo<void> {
  const AddLeaveRoute({List<_i48.PageRouteInfo>? children})
    : super(AddLeaveRoute.name, initialChildren: children);

  static const String name = 'AddLeaveRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      return const _i3.AddLeavePage();
    },
  );
}

/// generated route for
/// [_i4.AppWebViewPage]
class AppWebViewRoute extends _i48.PageRouteInfo<AppWebViewRouteArgs> {
  AppWebViewRoute({
    _i49.Key? key,
    required String url,
    required String title,
    List<_i48.PageRouteInfo>? children,
  }) : super(
         AppWebViewRoute.name,
         args: AppWebViewRouteArgs(key: key, url: url, title: title),
         initialChildren: children,
       );

  static const String name = 'AppWebViewRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AppWebViewRouteArgs>();
      return _i4.AppWebViewPage(
        key: args.key,
        url: args.url,
        title: args.title,
      );
    },
  );
}

class AppWebViewRouteArgs {
  const AppWebViewRouteArgs({this.key, required this.url, required this.title});

  final _i49.Key? key;

  final String url;

  final String title;

  @override
  String toString() {
    return 'AppWebViewRouteArgs{key: $key, url: $url, title: $title}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AppWebViewRouteArgs) return false;
    return key == other.key && url == other.url && title == other.title;
  }

  @override
  int get hashCode => key.hashCode ^ url.hashCode ^ title.hashCode;
}

/// generated route for
/// [_i5.AssignmentPage]
class AssignmentRoute extends _i48.PageRouteInfo<void> {
  const AssignmentRoute({List<_i48.PageRouteInfo>? children})
    : super(AssignmentRoute.name, initialChildren: children);

  static const String name = 'AssignmentRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      return const _i5.AssignmentPage();
    },
  );
}

/// generated route for
/// [_i6.AttendancePage]
class AttendanceRoute extends _i48.PageRouteInfo<void> {
  const AttendanceRoute({List<_i48.PageRouteInfo>? children})
    : super(AttendanceRoute.name, initialChildren: children);

  static const String name = 'AttendanceRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      return const _i6.AttendancePage();
    },
  );
}

/// generated route for
/// [_i7.CalendarPage]
class CalendarRoute extends _i48.PageRouteInfo<void> {
  const CalendarRoute({List<_i48.PageRouteInfo>? children})
    : super(CalendarRoute.name, initialChildren: children);

  static const String name = 'CalendarRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      return const _i7.CalendarPage();
    },
  );
}

/// generated route for
/// [_i8.ClassTestPage]
class ClassTestRoute extends _i48.PageRouteInfo<void> {
  const ClassTestRoute({List<_i48.PageRouteInfo>? children})
    : super(ClassTestRoute.name, initialChildren: children);

  static const String name = 'ClassTestRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      return const _i8.ClassTestPage();
    },
  );
}

/// generated route for
/// [_i9.ClassworkPage]
class ClassworkRoute extends _i48.PageRouteInfo<void> {
  const ClassworkRoute({List<_i48.PageRouteInfo>? children})
    : super(ClassworkRoute.name, initialChildren: children);

  static const String name = 'ClassworkRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      return const _i9.ClassworkPage();
    },
  );
}

/// generated route for
/// [_i10.ConcernDetailsPage]
class ConcernDetailsRoute extends _i48.PageRouteInfo<ConcernDetailsRouteArgs> {
  ConcernDetailsRoute({
    _i49.Key? key,
    required _i50.ConcernModel concern,
    List<_i48.PageRouteInfo>? children,
  }) : super(
         ConcernDetailsRoute.name,
         args: ConcernDetailsRouteArgs(key: key, concern: concern),
         initialChildren: children,
       );

  static const String name = 'ConcernDetailsRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ConcernDetailsRouteArgs>();
      return _i10.ConcernDetailsPage(key: args.key, concern: args.concern);
    },
  );
}

class ConcernDetailsRouteArgs {
  const ConcernDetailsRouteArgs({this.key, required this.concern});

  final _i49.Key? key;

  final _i50.ConcernModel concern;

  @override
  String toString() {
    return 'ConcernDetailsRouteArgs{key: $key, concern: $concern}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ConcernDetailsRouteArgs) return false;
    return key == other.key && concern == other.concern;
  }

  @override
  int get hashCode => key.hashCode ^ concern.hashCode;
}

/// generated route for
/// [_i11.ConcernPage]
class ConcernRoute extends _i48.PageRouteInfo<void> {
  const ConcernRoute({List<_i48.PageRouteInfo>? children})
    : super(ConcernRoute.name, initialChildren: children);

  static const String name = 'ConcernRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      return const _i11.ConcernPage();
    },
  );
}

/// generated route for
/// [_i12.DashboardPage]
class DashboardRoute extends _i48.PageRouteInfo<void> {
  const DashboardRoute({List<_i48.PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      return const _i12.DashboardPage();
    },
  );
}

/// generated route for
/// [_i13.ExamTimeTablePage]
class ExamTimeTableRoute extends _i48.PageRouteInfo<void> {
  const ExamTimeTableRoute({List<_i48.PageRouteInfo>? children})
    : super(ExamTimeTableRoute.name, initialChildren: children);

  static const String name = 'ExamTimeTableRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      return _i48.WrappedRoute(child: const _i13.ExamTimeTablePage());
    },
  );
}

/// generated route for
/// [_i14.ForgotPasswordPage]
class ForgotPasswordRoute extends _i48.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i48.PageRouteInfo>? children})
    : super(ForgotPasswordRoute.name, initialChildren: children);

  static const String name = 'ForgotPasswordRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      return const _i14.ForgotPasswordPage();
    },
  );
}

/// generated route for
/// [_i15.GalleryDetailPage]
class GalleryDetailRoute extends _i48.PageRouteInfo<GalleryDetailRouteArgs> {
  GalleryDetailRoute({
    _i49.Key? key,
    required _i51.GalleryModel gallery,
    List<_i48.PageRouteInfo>? children,
  }) : super(
         GalleryDetailRoute.name,
         args: GalleryDetailRouteArgs(key: key, gallery: gallery),
         initialChildren: children,
       );

  static const String name = 'GalleryDetailRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GalleryDetailRouteArgs>();
      return _i15.GalleryDetailPage(key: args.key, gallery: args.gallery);
    },
  );
}

class GalleryDetailRouteArgs {
  const GalleryDetailRouteArgs({this.key, required this.gallery});

  final _i49.Key? key;

  final _i51.GalleryModel gallery;

  @override
  String toString() {
    return 'GalleryDetailRouteArgs{key: $key, gallery: $gallery}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! GalleryDetailRouteArgs) return false;
    return key == other.key && gallery == other.gallery;
  }

  @override
  int get hashCode => key.hashCode ^ gallery.hashCode;
}

/// generated route for
/// [_i16.GalleryImageViewerPage]
class GalleryImageViewerRoute
    extends _i48.PageRouteInfo<GalleryImageViewerRouteArgs> {
  GalleryImageViewerRoute({
    _i49.Key? key,
    required String galleryId,
    required int initialIndex,
    List<_i52.GalleryImageModel>? images,
    List<_i48.PageRouteInfo>? children,
  }) : super(
         GalleryImageViewerRoute.name,
         args: GalleryImageViewerRouteArgs(
           key: key,
           galleryId: galleryId,
           initialIndex: initialIndex,
           images: images,
         ),
         initialChildren: children,
       );

  static const String name = 'GalleryImageViewerRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GalleryImageViewerRouteArgs>();
      return _i16.GalleryImageViewerPage(
        key: args.key,
        galleryId: args.galleryId,
        initialIndex: args.initialIndex,
        images: args.images,
      );
    },
  );
}

class GalleryImageViewerRouteArgs {
  const GalleryImageViewerRouteArgs({
    this.key,
    required this.galleryId,
    required this.initialIndex,
    this.images,
  });

  final _i49.Key? key;

  final String galleryId;

  final int initialIndex;

  final List<_i52.GalleryImageModel>? images;

  @override
  String toString() {
    return 'GalleryImageViewerRouteArgs{key: $key, galleryId: $galleryId, initialIndex: $initialIndex, images: $images}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! GalleryImageViewerRouteArgs) return false;
    return key == other.key &&
        galleryId == other.galleryId &&
        initialIndex == other.initialIndex &&
        const _i53.ListEquality<_i52.GalleryImageModel>().equals(
          images,
          other.images,
        );
  }

  @override
  int get hashCode =>
      key.hashCode ^
      galleryId.hashCode ^
      initialIndex.hashCode ^
      const _i53.ListEquality<_i52.GalleryImageModel>().hash(images);
}

/// generated route for
/// [_i17.GalleryPage]
class GalleryRoute extends _i48.PageRouteInfo<void> {
  const GalleryRoute({List<_i48.PageRouteInfo>? children})
    : super(GalleryRoute.name, initialChildren: children);

  static const String name = 'GalleryRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      return const _i17.GalleryPage();
    },
  );
}

/// generated route for
/// [_i18.GatePassPage]
class GatePassRoute extends _i48.PageRouteInfo<void> {
  const GatePassRoute({List<_i48.PageRouteInfo>? children})
    : super(GatePassRoute.name, initialChildren: children);

  static const String name = 'GatePassRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      return const _i18.GatePassPage();
    },
  );
}

/// generated route for
/// [_i19.HolidayHwPage]
class HolidayHwRoute extends _i48.PageRouteInfo<void> {
  const HolidayHwRoute({List<_i48.PageRouteInfo>? children})
    : super(HolidayHwRoute.name, initialChildren: children);

  static const String name = 'HolidayHwRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      return const _i19.HolidayHwPage();
    },
  );
}

/// generated route for
/// [_i20.HomePage]
class HomeRoute extends _i48.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i49.Key? key,
    _i54.ScrollAwareBottomBarController? bottomBarController,
    List<_i48.PageRouteInfo>? children,
  }) : super(
         HomeRoute.name,
         args: HomeRouteArgs(
           key: key,
           bottomBarController: bottomBarController,
         ),
         initialChildren: children,
       );

  static const String name = 'HomeRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HomeRouteArgs>(
        orElse: () => const HomeRouteArgs(),
      );
      return _i20.HomePage(
        key: args.key,
        bottomBarController: args.bottomBarController,
      );
    },
  );
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key, this.bottomBarController});

  final _i49.Key? key;

  final _i54.ScrollAwareBottomBarController? bottomBarController;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, bottomBarController: $bottomBarController}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! HomeRouteArgs) return false;
    return key == other.key && bottomBarController == other.bottomBarController;
  }

  @override
  int get hashCode => key.hashCode ^ bottomBarController.hashCode;
}

/// generated route for
/// [_i21.HomeworkPage]
class HomeworkRoute extends _i48.PageRouteInfo<void> {
  const HomeworkRoute({List<_i48.PageRouteInfo>? children})
    : super(HomeworkRoute.name, initialChildren: children);

  static const String name = 'HomeworkRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      return const _i21.HomeworkPage();
    },
  );
}

/// generated route for
/// [_i22.LeaveDetailPage]
class LeaveDetailRoute extends _i48.PageRouteInfo<LeaveDetailRouteArgs> {
  LeaveDetailRoute({
    _i49.Key? key,
    String? leaveId,
    List<_i48.PageRouteInfo>? children,
  }) : super(
         LeaveDetailRoute.name,
         args: LeaveDetailRouteArgs(key: key, leaveId: leaveId),
         rawPathParams: {'id': leaveId},
         initialChildren: children,
       );

  static const String name = 'LeaveDetailRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<LeaveDetailRouteArgs>(
        orElse: () => LeaveDetailRouteArgs(leaveId: pathParams.optString('id')),
      );
      return _i22.LeaveDetailPage(key: args.key, leaveId: args.leaveId);
    },
  );
}

class LeaveDetailRouteArgs {
  const LeaveDetailRouteArgs({this.key, this.leaveId});

  final _i49.Key? key;

  final String? leaveId;

  @override
  String toString() {
    return 'LeaveDetailRouteArgs{key: $key, leaveId: $leaveId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LeaveDetailRouteArgs) return false;
    return key == other.key && leaveId == other.leaveId;
  }

  @override
  int get hashCode => key.hashCode ^ leaveId.hashCode;
}

/// generated route for
/// [_i23.LeavePage]
class LeaveRoute extends _i48.PageRouteInfo<void> {
  const LeaveRoute({List<_i48.PageRouteInfo>? children})
    : super(LeaveRoute.name, initialChildren: children);

  static const String name = 'LeaveRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      return const _i23.LeavePage();
    },
  );
}

/// generated route for
/// [_i24.LoginPage]
class LoginRoute extends _i48.PageRouteInfo<void> {
  const LoginRoute({List<_i48.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      return const _i24.LoginPage();
    },
  );
}

/// generated route for
/// [_i25.MealMenuPage]
class MealMenuRoute extends _i48.PageRouteInfo<void> {
  const MealMenuRoute({List<_i48.PageRouteInfo>? children})
    : super(MealMenuRoute.name, initialChildren: children);

  static const String name = 'MealMenuRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      return const _i25.MealMenuPage();
    },
  );
}

/// generated route for
/// [_i26.NewPasswordPage]
class NewPasswordRoute extends _i48.PageRouteInfo<void> {
  const NewPasswordRoute({List<_i48.PageRouteInfo>? children})
    : super(NewPasswordRoute.name, initialChildren: children);

  static const String name = 'NewPasswordRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      return const _i26.NewPasswordPage();
    },
  );
}

/// generated route for
/// [_i27.NoticePage]
class NoticeRoute extends _i48.PageRouteInfo<void> {
  const NoticeRoute({List<_i48.PageRouteInfo>? children})
    : super(NoticeRoute.name, initialChildren: children);

  static const String name = 'NoticeRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      return const _i27.NoticePage();
    },
  );
}

/// generated route for
/// [_i28.NotificationPage]
class NotificationRoute extends _i48.PageRouteInfo<void> {
  const NotificationRoute({List<_i48.PageRouteInfo>? children})
    : super(NotificationRoute.name, initialChildren: children);

  static const String name = 'NotificationRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      return const _i28.NotificationPage();
    },
  );
}

/// generated route for
/// [_i29.OnboardingPage]
class OnboardingRoute extends _i48.PageRouteInfo<void> {
  const OnboardingRoute({List<_i48.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      return const _i29.OnboardingPage();
    },
  );
}

/// generated route for
/// [_i30.PaperPage]
class PaperRoute extends _i48.PageRouteInfo<void> {
  const PaperRoute({List<_i48.PageRouteInfo>? children})
    : super(PaperRoute.name, initialChildren: children);

  static const String name = 'PaperRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      return const _i30.PaperPage();
    },
  );
}

/// generated route for
/// [_i31.PasswordLoginPage]
class PasswordLoginRoute extends _i48.PageRouteInfo<PasswordLoginRouteArgs> {
  PasswordLoginRoute({
    _i49.Key? key,
    required String email,
    List<_i48.PageRouteInfo>? children,
  }) : super(
         PasswordLoginRoute.name,
         args: PasswordLoginRouteArgs(key: key, email: email),
         initialChildren: children,
       );

  static const String name = 'PasswordLoginRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PasswordLoginRouteArgs>();
      return _i31.PasswordLoginPage(key: args.key, email: args.email);
    },
  );
}

class PasswordLoginRouteArgs {
  const PasswordLoginRouteArgs({this.key, required this.email});

  final _i49.Key? key;

  final String email;

  @override
  String toString() {
    return 'PasswordLoginRouteArgs{key: $key, email: $email}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PasswordLoginRouteArgs) return false;
    return key == other.key && email == other.email;
  }

  @override
  int get hashCode => key.hashCode ^ email.hashCode;
}

/// generated route for
/// [_i32.PasswordSuccessPage]
class PasswordSuccessRoute extends _i48.PageRouteInfo<void> {
  const PasswordSuccessRoute({List<_i48.PageRouteInfo>? children})
    : super(PasswordSuccessRoute.name, initialChildren: children);

  static const String name = 'PasswordSuccessRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      return const _i32.PasswordSuccessPage();
    },
  );
}

/// generated route for
/// [_i33.PdfViewerPage]
class PdfViewerRoute extends _i48.PageRouteInfo<PdfViewerRouteArgs> {
  PdfViewerRoute({
    _i49.Key? key,
    required String pdfUrl,
    required String title,
    List<_i48.PageRouteInfo>? children,
  }) : super(
         PdfViewerRoute.name,
         args: PdfViewerRouteArgs(key: key, pdfUrl: pdfUrl, title: title),
         initialChildren: children,
       );

  static const String name = 'PdfViewerRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PdfViewerRouteArgs>();
      return _i33.PdfViewerPage(
        key: args.key,
        pdfUrl: args.pdfUrl,
        title: args.title,
      );
    },
  );
}

class PdfViewerRouteArgs {
  const PdfViewerRouteArgs({
    this.key,
    required this.pdfUrl,
    required this.title,
  });

  final _i49.Key? key;

  final String pdfUrl;

  final String title;

  @override
  String toString() {
    return 'PdfViewerRouteArgs{key: $key, pdfUrl: $pdfUrl, title: $title}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PdfViewerRouteArgs) return false;
    return key == other.key && pdfUrl == other.pdfUrl && title == other.title;
  }

  @override
  int get hashCode => key.hashCode ^ pdfUrl.hashCode ^ title.hashCode;
}

/// generated route for
/// [_i34.ProfilePage]
class ProfileRoute extends _i48.PageRouteInfo<void> {
  const ProfileRoute({List<_i48.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      return const _i34.ProfilePage();
    },
  );
}

/// generated route for
/// [_i35.RemarkDetailPage]
class RemarkDetailRoute extends _i48.PageRouteInfo<RemarkDetailRouteArgs> {
  RemarkDetailRoute({
    _i49.Key? key,
    required _i55.RemarkModel remark,
    List<_i48.PageRouteInfo>? children,
  }) : super(
         RemarkDetailRoute.name,
         args: RemarkDetailRouteArgs(key: key, remark: remark),
         initialChildren: children,
       );

  static const String name = 'RemarkDetailRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RemarkDetailRouteArgs>();
      return _i35.RemarkDetailPage(key: args.key, remark: args.remark);
    },
  );
}

class RemarkDetailRouteArgs {
  const RemarkDetailRouteArgs({this.key, required this.remark});

  final _i49.Key? key;

  final _i55.RemarkModel remark;

  @override
  String toString() {
    return 'RemarkDetailRouteArgs{key: $key, remark: $remark}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RemarkDetailRouteArgs) return false;
    return key == other.key && remark == other.remark;
  }

  @override
  int get hashCode => key.hashCode ^ remark.hashCode;
}

/// generated route for
/// [_i36.RemarksPage]
class RemarksRoute extends _i48.PageRouteInfo<void> {
  const RemarksRoute({List<_i48.PageRouteInfo>? children})
    : super(RemarksRoute.name, initialChildren: children);

  static const String name = 'RemarksRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      return const _i36.RemarksPage();
    },
  );
}

/// generated route for
/// [_i37.ReportCardPage]
class ReportCardRoute extends _i48.PageRouteInfo<void> {
  const ReportCardRoute({List<_i48.PageRouteInfo>? children})
    : super(ReportCardRoute.name, initialChildren: children);

  static const String name = 'ReportCardRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      return const _i37.ReportCardPage();
    },
  );
}

/// generated route for
/// [_i38.ResetPasswordPage]
class ResetPasswordRoute extends _i48.PageRouteInfo<void> {
  const ResetPasswordRoute({List<_i48.PageRouteInfo>? children})
    : super(ResetPasswordRoute.name, initialChildren: children);

  static const String name = 'ResetPasswordRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      return const _i38.ResetPasswordPage();
    },
  );
}

/// generated route for
/// [_i39.SplashPage]
class SplashRoute extends _i48.PageRouteInfo<void> {
  const SplashRoute({List<_i48.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      return _i48.WrappedRoute(child: const _i39.SplashPage());
    },
  );
}

/// generated route for
/// [_i40.StudentProfilePage]
class StudentProfileRoute extends _i48.PageRouteInfo<void> {
  const StudentProfileRoute({List<_i48.PageRouteInfo>? children})
    : super(StudentProfileRoute.name, initialChildren: children);

  static const String name = 'StudentProfileRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      return const _i40.StudentProfilePage();
    },
  );
}

/// generated route for
/// [_i41.SummaryPage]
class SummaryRoute extends _i48.PageRouteInfo<void> {
  const SummaryRoute({List<_i48.PageRouteInfo>? children})
    : super(SummaryRoute.name, initialChildren: children);

  static const String name = 'SummaryRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      return const _i41.SummaryPage();
    },
  );
}

/// generated route for
/// [_i42.SyllabusPage]
class SyllabusRoute extends _i48.PageRouteInfo<void> {
  const SyllabusRoute({List<_i48.PageRouteInfo>? children})
    : super(SyllabusRoute.name, initialChildren: children);

  static const String name = 'SyllabusRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      return const _i42.SyllabusPage();
    },
  );
}

/// generated route for
/// [_i43.TimeTablePage]
class TimeTableRoute extends _i48.PageRouteInfo<void> {
  const TimeTableRoute({List<_i48.PageRouteInfo>? children})
    : super(TimeTableRoute.name, initialChildren: children);

  static const String name = 'TimeTableRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      return _i48.WrappedRoute(child: const _i43.TimeTablePage());
    },
  );
}

/// generated route for
/// [_i44.VerificationPage]
class VerificationRoute extends _i48.PageRouteInfo<void> {
  const VerificationRoute({List<_i48.PageRouteInfo>? children})
    : super(VerificationRoute.name, initialChildren: children);

  static const String name = 'VerificationRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      return const _i44.VerificationPage();
    },
  );
}

/// generated route for
/// [_i45.VideoDetailPage]
class VideoDetailRoute extends _i48.PageRouteInfo<VideoDetailRouteArgs> {
  VideoDetailRoute({
    _i49.Key? key,
    required _i56.VideoModel video,
    List<_i48.PageRouteInfo>? children,
  }) : super(
         VideoDetailRoute.name,
         args: VideoDetailRouteArgs(key: key, video: video),
         initialChildren: children,
       );

  static const String name = 'VideoDetailRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VideoDetailRouteArgs>();
      return _i45.VideoDetailPage(key: args.key, video: args.video);
    },
  );
}

class VideoDetailRouteArgs {
  const VideoDetailRouteArgs({this.key, required this.video});

  final _i49.Key? key;

  final _i56.VideoModel video;

  @override
  String toString() {
    return 'VideoDetailRouteArgs{key: $key, video: $video}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! VideoDetailRouteArgs) return false;
    return key == other.key && video == other.video;
  }

  @override
  int get hashCode => key.hashCode ^ video.hashCode;
}

/// generated route for
/// [_i46.VideoViewerPage]
class VideoViewerRoute extends _i48.PageRouteInfo<VideoViewerRouteArgs> {
  VideoViewerRoute({
    _i49.Key? key,
    required String videoAlbumId,
    required int initialIndex,
    List<_i57.VideoItemModel>? videos,
    List<_i48.PageRouteInfo>? children,
  }) : super(
         VideoViewerRoute.name,
         args: VideoViewerRouteArgs(
           key: key,
           videoAlbumId: videoAlbumId,
           initialIndex: initialIndex,
           videos: videos,
         ),
         initialChildren: children,
       );

  static const String name = 'VideoViewerRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VideoViewerRouteArgs>();
      return _i46.VideoViewerPage(
        key: args.key,
        videoAlbumId: args.videoAlbumId,
        initialIndex: args.initialIndex,
        videos: args.videos,
      );
    },
  );
}

class VideoViewerRouteArgs {
  const VideoViewerRouteArgs({
    this.key,
    required this.videoAlbumId,
    required this.initialIndex,
    this.videos,
  });

  final _i49.Key? key;

  final String videoAlbumId;

  final int initialIndex;

  final List<_i57.VideoItemModel>? videos;

  @override
  String toString() {
    return 'VideoViewerRouteArgs{key: $key, videoAlbumId: $videoAlbumId, initialIndex: $initialIndex, videos: $videos}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! VideoViewerRouteArgs) return false;
    return key == other.key &&
        videoAlbumId == other.videoAlbumId &&
        initialIndex == other.initialIndex &&
        const _i53.ListEquality<_i57.VideoItemModel>().equals(
          videos,
          other.videos,
        );
  }

  @override
  int get hashCode =>
      key.hashCode ^
      videoAlbumId.hashCode ^
      initialIndex.hashCode ^
      const _i53.ListEquality<_i57.VideoItemModel>().hash(videos);
}

/// generated route for
/// [_i47.VideosPage]
class VideosRoute extends _i48.PageRouteInfo<void> {
  const VideosRoute({List<_i48.PageRouteInfo>? children})
    : super(VideosRoute.name, initialChildren: children);

  static const String name = 'VideosRoute';

  static _i48.PageInfo page = _i48.PageInfo(
    name,
    builder: (data) {
      return const _i47.VideosPage();
    },
  );
}
