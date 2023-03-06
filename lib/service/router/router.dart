import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:one_school/core/global.dart';
import 'package:one_school/service/hive/hivedata.dart';
import 'package:one_school/ui/home/ui/home.dart';
import 'package:one_school/ui/login/ui/login_screen.dart';
import 'package:one_school/ui/registration/ui/registration.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'router.g.dart';

GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

@Riverpod(keepAlive: true)
GoRouter router(RouterRef ref) {
  return GoRouter(
    navigatorKey: _navigatorKey,
    initialLocation: home,
    redirect: (context, state) {
      var isLogin = ref.watch(loginProvider);
      final location = state.subloc;
      final bool loggingIn = location == loginPage;

      // if registration or forgot pass
      if (location == registration || location == forgotPassword) {
        return null;
      }

      // if not logged in
      if (!isLogin) {
        return loginPage;
      }

      // if user is already logged in and still in login page
      if (loggingIn) {
        return home;
      }

      // otherwise keep the current page
      return null;
    },
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
        path: home,
        builder: (BuildContext context, GoRouterState state) {
          return Home(key: state.pageKey);
        },
      ),
      GoRoute(
        path: loginPage,
        builder: (BuildContext context, GoRouterState state) {
          return LoginScreen(key: state.pageKey);
        },
      ),
      GoRoute(
        path: registration,
        builder: (context, state) {
          return Registration(key: state.pageKey);
        },
      ),
    ],
  );
}
