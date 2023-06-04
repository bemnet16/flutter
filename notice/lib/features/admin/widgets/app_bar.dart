import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../routes/app_route_const.dart';

class appbar extends StatelessWidget {
  final List<IconData> icons = [
    Icons.card_giftcard,
    Icons.account_circle,
    Icons.notifications,
    Icons.remove,
    Icons.add,
  ];

  final List<String> titles = [
    'Giveaway',
    'User',
    'Notice',
    'Lost',
    'Found',
  ];
  appbar({
    super.key,
  });
  final navigation = [
    MyAppRouteConstants.adminGiveawayRouteName,
    MyAppRouteConstants.adminUserRouteName,
    MyAppRouteConstants.adminNoticeRouteName,
    MyAppRouteConstants.adminLostRouteName,
    MyAppRouteConstants.adminFoundRouteName
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: icons.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              GoRouter.of(context).pushNamed(navigation[index]);
              context.goNamed(navigation[index]);
            },
            child: Container(
              width: 180,
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.blue, // Removed background image
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 8.0,
                    left: 8.0,
                    child: Text(
                      titles[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 8.0,
                    right: 8.0,
                    child: Icon(
                      icons[index],
                      size: 35,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
