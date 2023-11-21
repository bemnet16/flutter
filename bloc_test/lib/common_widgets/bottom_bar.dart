import 'package:bloc_test/features/lost_and_found/ui/lost_an_found_Page.dart';
import 'package:bloc_test/features/notice/ui/notice.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/giveaway/ui/giveaway.dart';
import '../features/user/ui/user.dart';
import '../routes/app_route_const.dart';

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[_currentIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            color: Colors.white,
            elevation: 8.0,
            child: SizedBox(
              height: 70.0,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.home, size: 30),
                        color: _currentIndex == 0 ? Colors.blue : Colors.grey,
                        onPressed: () {
                          _onTabSelected(0);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.card_giftcard, size: 30),
                        color: _currentIndex == 1 ? Colors.blue : Colors.grey,
                        onPressed: () {
                          _onTabSelected(1);
                        },
                      ),
                      const SizedBox(width: 32.0),
                      IconButton(
                        icon: const Icon(Icons.vpn_key, size: 30),
                        color: _currentIndex == 2 ? Colors.blue : Colors.grey,
                        onPressed: () {
                          _onTabSelected(2);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.person, size: 30),
                        color: _currentIndex == 3 ? Colors.blue : Colors.grey,
                        onPressed: () {
                          _onTabSelected(3);
                        },
                      ),
                    ],
                  ),
                  Positioned(
                    top: -20.0,
                    child: SizedBox(
                      height: 90.0,
                      width: 50.0,
                      child: FloatingActionButton(
                        backgroundColor: Colors.redAccent,
                        child: const Icon(Icons.add, size: 35.0),
                        onPressed: () {
                          setState(() {
                            _currentIndex = 2;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  final  pages = [NoticePage(),const Giveaway(),LostAndFoundPage(),Profile()];
  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
