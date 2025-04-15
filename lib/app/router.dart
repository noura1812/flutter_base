import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:zewail/core/common/presentation/locale/page/local_picker_page.dart';
import 'package:zewail/main_layer/main_layer_page.dart';
import 'package:zewail/onboarding/pages/splash_page.dart';

import '../core/config/routes.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: Routes.splashPage,
  navigatorKey: navigatorKey,
  routes: [
    GoRoute(
      path: Routes.splashPage,
      name: Routes.splashPage,
      pageBuilder: (BuildContext context, GoRouterState state) =>
          MaterialPage<void>(key: state.pageKey, child: const SplashPage()),
    ),
    GoRoute(
      path: Routes.languagePage,
      name: Routes.languagePage,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const LocalPickerPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: Routes.mainLayer,
      name: Routes.mainLayer,
      pageBuilder: (BuildContext context, GoRouterState state) =>
          MaterialPage<void>(
        key: state.pageKey,
        child: const MainLayerPage(),
      ),
    ),
  ],
);
