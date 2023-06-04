import 'package:bloc_test/common_widgets/bottom_bar.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/admin/screens/found_admin.dart';
import '../features/admin/screens/giveaway_admin.dart';
import '../features/admin/screens/lost_admin.dart';
import '../features/admin/screens/notice_admin.dart';
import '../features/admin/screens/user_admin.dart';
import '../features/auth/ui/login.dart';
import '../features/auth/ui/signup.dart';
import '../features/giveaway_detail/ui/detail.dart';
import '../features/lost_detail/lost_detail.dart';
import '../features/user/ui/user.dart';
import 'app_route_const.dart';

class NyAppRouter {
  static GoRouter returnRouter() {
    GoRouter router = GoRouter(
      routes: [
        GoRoute(
          name: MyAppRouteConstants.bottomBarRouteName,
          path: '/bottom',
          pageBuilder: (context, state) {
            return  MaterialPage(child: MyBottomNavigationBar(index:state.queryParameters["index"]));
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
          path: '/',
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
          name: MyAppRouteConstants.adminNoticeRouteName,
          path: '/admin_notice',
          pageBuilder: (context, state) {
            return  MaterialPage(child: NoticeAdminPage());
          },
        ),
         GoRoute(
          name: MyAppRouteConstants.adminUserRouteName,
          path: '/admin_user',
          pageBuilder: (context, state) {
            return  MaterialPage(child: UserAdminPage());
          },
        ),
         GoRoute(
          name: MyAppRouteConstants.adminGiveawayRouteName,
          path: '/admin_giveaway',
          pageBuilder: (context, state) {
            return  MaterialPage(child: GiveawayAdminPage());
          },
        ),
         GoRoute(
          name: MyAppRouteConstants.adminFoundRouteName,
          path: '/admin_found',
          pageBuilder: (context, state) {
            return  MaterialPage(child: FoundAdminPage());
          },
        ),
         GoRoute(
          name: MyAppRouteConstants.adminLostRouteName,
          path: '/admin_lost',
          pageBuilder: (context, state) {
            return  MaterialPage(child: LostAdminPage());
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
          path: '/lost_item/:data',
          pageBuilder: (context, state) {
            return  MaterialPage(
                child: LostDetailPage(
                     data: state.pathParameters['data']!,
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
