// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i19;
import 'package:collection/collection.dart' as _i21;
import 'package:flutter/material.dart' as _i20;
import 'package:starter_app/core/widgets/scroll_aware_bottom_bar_controller.dart'
    as _i22;
import 'package:starter_app/features/auth/screens/forgot_password/ui/forgot_password_page.dart'
    as _i4;
import 'package:starter_app/features/auth/screens/forgot_password/ui/new_password_page.dart'
    as _i10;
import 'package:starter_app/features/auth/screens/forgot_password/ui/password_success_page.dart'
    as _i14;
import 'package:starter_app/features/auth/screens/login/ui/login_page.dart'
    as _i9;
import 'package:starter_app/features/auth/screens/password_login/ui/password_login_page.dart'
    as _i13;
import 'package:starter_app/features/auth/screens/verification/ui/verification_page.dart'
    as _i18;
import 'package:starter_app/features/calendar/calendar_page.dart' as _i2;
import 'package:starter_app/features/dashboard/dashboard_page.dart' as _i3;
import 'package:starter_app/features/home/attendance/attendance_page.dart'
    as _i1;
import 'package:starter_app/features/home/gallery/detail/gallery_detail_page.dart'
    as _i5;
import 'package:starter_app/features/home/gallery/gallery_page.dart' as _i7;
import 'package:starter_app/features/home/gallery/viewer/gallery_image_viewer_page.dart'
    as _i6;
import 'package:starter_app/features/home/home_screen/home_page.dart' as _i8;
import 'package:starter_app/features/notice/notice_page.dart' as _i11;
import 'package:starter_app/features/onboarding/onboarding_page.dart' as _i12;
import 'package:starter_app/features/profile/profile_page.dart' as _i15;
import 'package:starter_app/features/splash/screens/ui/splash_screen.dart'
    as _i16;
import 'package:starter_app/features/summary/summary_page.dart' as _i17;

import '../../features/home/gallery/models/gallery_image_model.dart';
import '../../features/home/gallery/models/gallery_model.dart';

/// generated route for
/// [_i1.AttendancePage]
class AttendanceRoute extends _i19.PageRouteInfo<void> {
  const AttendanceRoute({List<_i19.PageRouteInfo>? children})
    : super(AttendanceRoute.name, initialChildren: children);

  static const String name = 'AttendanceRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i1.AttendancePage();
    },
  );
}

/// generated route for
/// [_i2.CalendarPage]
class CalendarRoute extends _i19.PageRouteInfo<void> {
  const CalendarRoute({List<_i19.PageRouteInfo>? children})
    : super(CalendarRoute.name, initialChildren: children);

  static const String name = 'CalendarRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i2.CalendarPage();
    },
  );
}

/// generated route for
/// [_i3.DashboardPage]
class DashboardRoute extends _i19.PageRouteInfo<void> {
  const DashboardRoute({List<_i19.PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i3.DashboardPage();
    },
  );
}

/// generated route for
/// [_i4.ForgotPasswordPage]
class ForgotPasswordRoute extends _i19.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i19.PageRouteInfo>? children})
    : super(ForgotPasswordRoute.name, initialChildren: children);

  static const String name = 'ForgotPasswordRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i4.ForgotPasswordPage();
    },
  );
}

/// generated route for
/// [_i5.GalleryDetailPage]
class GalleryDetailRoute extends _i19.PageRouteInfo<GalleryDetailRouteArgs> {
  GalleryDetailRoute({
    _i20.Key? key,
    required GalleryModel gallery,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         GalleryDetailRoute.name,
         args: GalleryDetailRouteArgs(key: key, gallery: gallery),
         initialChildren: children,
       );

  static const String name = 'GalleryDetailRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GalleryDetailRouteArgs>();
      return _i5.GalleryDetailPage(key: args.key, gallery: args.gallery);
    },
  );
}

class GalleryDetailRouteArgs {
  const GalleryDetailRouteArgs({this.key, required this.gallery});

  final _i20.Key? key;

  final GalleryModel gallery;

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
/// [_i6.GalleryImageViewerPage]
class GalleryImageViewerRoute
    extends _i19.PageRouteInfo<GalleryImageViewerRouteArgs> {
  GalleryImageViewerRoute({
    _i20.Key? key,
    required String galleryId,
    required int initialIndex,
    List<void>? images,
    List<_i19.PageRouteInfo>? children,
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

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GalleryImageViewerRouteArgs>();
      return _i6.GalleryImageViewerPage(
        key: args.key,
        galleryId: args.galleryId,
        initialIndex: args.initialIndex,
        images: args.images as List<GalleryImageModel>?,
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

  final _i20.Key? key;

  final String galleryId;

  final int initialIndex;

  final List<void>? images;

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
        const _i21.ListEquality<void>().equals(images, other.images);
  }

  @override
  int get hashCode =>
      key.hashCode ^
      galleryId.hashCode ^
      initialIndex.hashCode ^
      const _i21.ListEquality<void>().hash(images);
}

/// generated route for
/// [_i7.GalleryPage]
class GalleryRoute extends _i19.PageRouteInfo<void> {
  const GalleryRoute({List<_i19.PageRouteInfo>? children})
    : super(GalleryRoute.name, initialChildren: children);

  static const String name = 'GalleryRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i7.GalleryPage();
    },
  );
}

/// generated route for
/// [_i8.HomePage]
class HomeRoute extends _i19.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i20.Key? key,
    _i22.ScrollAwareBottomBarController? bottomBarController,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         HomeRoute.name,
         args: HomeRouteArgs(
           key: key,
           bottomBarController: bottomBarController,
         ),
         initialChildren: children,
       );

  static const String name = 'HomeRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HomeRouteArgs>(
        orElse: () => const HomeRouteArgs(),
      );
      return _i8.HomePage(
        key: args.key,
        bottomBarController: args.bottomBarController,
      );
    },
  );
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key, this.bottomBarController});

  final _i20.Key? key;

  final _i22.ScrollAwareBottomBarController? bottomBarController;

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
/// [_i9.LoginPage]
class LoginRoute extends _i19.PageRouteInfo<void> {
  const LoginRoute({List<_i19.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i9.LoginPage();
    },
  );
}

/// generated route for
/// [_i10.NewPasswordPage]
class NewPasswordRoute extends _i19.PageRouteInfo<void> {
  const NewPasswordRoute({List<_i19.PageRouteInfo>? children})
    : super(NewPasswordRoute.name, initialChildren: children);

  static const String name = 'NewPasswordRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i10.NewPasswordPage();
    },
  );
}

/// generated route for
/// [_i11.NoticePage]
class NoticeRoute extends _i19.PageRouteInfo<void> {
  const NoticeRoute({List<_i19.PageRouteInfo>? children})
    : super(NoticeRoute.name, initialChildren: children);

  static const String name = 'NoticeRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i11.NoticePage();
    },
  );
}

/// generated route for
/// [_i12.OnboardingPage]
class OnboardingRoute extends _i19.PageRouteInfo<void> {
  const OnboardingRoute({List<_i19.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i12.OnboardingPage();
    },
  );
}

/// generated route for
/// [_i13.PasswordLoginPage]
class PasswordLoginRoute extends _i19.PageRouteInfo<PasswordLoginRouteArgs> {
  PasswordLoginRoute({
    _i20.Key? key,
    required String email,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         PasswordLoginRoute.name,
         args: PasswordLoginRouteArgs(key: key, email: email),
         initialChildren: children,
       );

  static const String name = 'PasswordLoginRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PasswordLoginRouteArgs>();
      return _i13.PasswordLoginPage(key: args.key, email: args.email);
    },
  );
}

class PasswordLoginRouteArgs {
  const PasswordLoginRouteArgs({this.key, required this.email});

  final _i20.Key? key;

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
/// [_i14.PasswordSuccessPage]
class PasswordSuccessRoute extends _i19.PageRouteInfo<void> {
  const PasswordSuccessRoute({List<_i19.PageRouteInfo>? children})
    : super(PasswordSuccessRoute.name, initialChildren: children);

  static const String name = 'PasswordSuccessRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i14.PasswordSuccessPage();
    },
  );
}

/// generated route for
/// [_i15.ProfilePage]
class ProfileRoute extends _i19.PageRouteInfo<void> {
  const ProfileRoute({List<_i19.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i15.ProfilePage();
    },
  );
}

/// generated route for
/// [_i16.SplashPage]
class SplashRoute extends _i19.PageRouteInfo<void> {
  const SplashRoute({List<_i19.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return _i19.WrappedRoute(child: const _i16.SplashPage());
    },
  );
}

/// generated route for
/// [_i17.SummaryPage]
class SummaryRoute extends _i19.PageRouteInfo<void> {
  const SummaryRoute({List<_i19.PageRouteInfo>? children})
    : super(SummaryRoute.name, initialChildren: children);

  static const String name = 'SummaryRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i17.SummaryPage();
    },
  );
}

/// generated route for
/// [_i18.VerificationPage]
class VerificationRoute extends _i19.PageRouteInfo<void> {
  const VerificationRoute({List<_i19.PageRouteInfo>? children})
    : super(VerificationRoute.name, initialChildren: children);

  static const String name = 'VerificationRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i18.VerificationPage();
    },
  );
}
