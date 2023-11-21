import 'package:bloc_test/common_widgets/bottom_bar.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/ui/login.dart';
import '../features/auth/ui/signup.dart';
import '../features/giveaway_detail/ui/detail.dart';
import '../features/user/ui/user.dart';
import 'app_route_const.dart';

class NyAppRouter {
  static GoRouter returnRouter() {
    GoRouter router = GoRouter(
      routes: [
        GoRoute(
          name: MyAppRouteConstants.bottomBarRouteName,
          path: '/',
          pageBuilder: (context, state) {
            return  MaterialPage(child: MyBottomNavigationBar());
          },
        ),
        GoRoute(
          name: MyAppRouteConstants.userRouteName,
          path: '/profile/:id',
          pageBuilder: (context, state) {
            return  MaterialPage(child: Profile());
          },
        ),
         GoRoute(
          name: MyAppRouteConstants.loginRouteName,
          path: '/login',
          pageBuilder: (context, state) {
            return  MaterialPage(child: LoginPage());
          },
        ),
         GoRoute(
          name: MyAppRouteConstants.signupRouteName,
          path: '/signup',
          pageBuilder: (context, state) {
            return  MaterialPage(child: SignupPage());
          },
        ),
        GoRoute(
          name: MyAppRouteConstants.giveawayDetailRouteName,
          path: '/giveaway/:id',
          pageBuilder: (context, state) {
            return  MaterialPage(
                child: GiveawayDetailPage(
                    id: state.pathParameters['id']!,
                    ));
          },
        ),
        GoRoute(
          name: MyAppRouteConstants.lostDetailRouteName,
          path: '/lost_item/:id',
          pageBuilder: (context, state) {
            return  MaterialPage(
                child: GiveawayDetailPage(
                     id: state.pathParameters['id']!,
                    ));
          },
        ),
      ],
      errorPageBuilder: (context, state) {
        return const MaterialPage(child: Center(child: Text("error")));
      },
    );
    return router;
  }
}
