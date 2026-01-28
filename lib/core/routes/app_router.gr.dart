// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;
import 'package:starter_app/features/auth/screens/forgot_password/ui/forgot_password_page.dart'
    as _i1;
import 'package:starter_app/features/auth/screens/forgot_password/ui/new_password_page.dart'
    as _i3;
import 'package:starter_app/features/auth/screens/forgot_password/ui/password_success_page.dart'
    as _i6;
import 'package:starter_app/features/auth/screens/login/ui/login_page.dart'
    as _i2;
import 'package:starter_app/features/auth/screens/password_login/ui/password_login_page.dart'
    as _i5;
import 'package:starter_app/features/auth/screens/verification/ui/verification_page.dart'
    as _i8;
import 'package:starter_app/features/onboarding/onboarding_page.dart' as _i4;
import 'package:starter_app/features/splash/screens/ui/splash_screen.dart'
    as _i7;

/// generated route for
/// [_i1.ForgotPasswordPage]
class ForgotPasswordRoute extends _i9.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i9.PageRouteInfo>? children})
    : super(ForgotPasswordRoute.name, initialChildren: children);

  static const String name = 'ForgotPasswordRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i1.ForgotPasswordPage();
    },
  );
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i9.PageRouteInfo<void> {
  const LoginRoute({List<_i9.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i2.LoginPage();
    },
  );
}

/// generated route for
/// [_i3.NewPasswordPage]
class NewPasswordRoute extends _i9.PageRouteInfo<void> {
  const NewPasswordRoute({List<_i9.PageRouteInfo>? children})
    : super(NewPasswordRoute.name, initialChildren: children);

  static const String name = 'NewPasswordRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i3.NewPasswordPage();
    },
  );
}

/// generated route for
/// [_i4.OnboardingPage]
class OnboardingRoute extends _i9.PageRouteInfo<void> {
  const OnboardingRoute({List<_i9.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i4.OnboardingPage();
    },
  );
}

/// generated route for
/// [_i5.PasswordLoginPage]
class PasswordLoginRoute extends _i9.PageRouteInfo<PasswordLoginRouteArgs> {
  PasswordLoginRoute({
    _i10.Key? key,
    required String email,
    List<_i9.PageRouteInfo>? children,
  }) : super(
         PasswordLoginRoute.name,
         args: PasswordLoginRouteArgs(key: key, email: email),
         initialChildren: children,
       );

  static const String name = 'PasswordLoginRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PasswordLoginRouteArgs>();
      return _i5.PasswordLoginPage(key: args.key, email: args.email);
    },
  );
}

class PasswordLoginRouteArgs {
  const PasswordLoginRouteArgs({this.key, required this.email});

  final _i10.Key? key;

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
/// [_i6.PasswordSuccessPage]
class PasswordSuccessRoute extends _i9.PageRouteInfo<void> {
  const PasswordSuccessRoute({List<_i9.PageRouteInfo>? children})
    : super(PasswordSuccessRoute.name, initialChildren: children);

  static const String name = 'PasswordSuccessRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i6.PasswordSuccessPage();
    },
  );
}

/// generated route for
/// [_i7.SplashPage]
class SplashRoute extends _i9.PageRouteInfo<void> {
  const SplashRoute({List<_i9.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return _i9.WrappedRoute(child: const _i7.SplashPage());
    },
  );
}

/// generated route for
/// [_i8.VerificationPage]
class VerificationRoute extends _i9.PageRouteInfo<void> {
  const VerificationRoute({List<_i9.PageRouteInfo>? children})
    : super(VerificationRoute.name, initialChildren: children);

  static const String name = 'VerificationRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i8.VerificationPage();
    },
  );
}
