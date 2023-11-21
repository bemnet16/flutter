import 'package:flutter/material.dart';
import 'package:project_notice/screens/lostfound/lost.dart';

import 'found.dart';

class LostFoundTapBar extends StatefulWidget {
  const LostFoundTapBar({Key? key}) : super(key: key);

  @override
  State<LostFoundTapBar> createState() => _LostFoundTapBarState();
}

class _LostFoundTapBarState extends State<LostFoundTapBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(27, 233, 233, 1),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
              height: 300,
              width: double.infinity,
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  Container(
                    width: MediaQuery.of(context).size.height,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: TabBar(
                            unselectedLabelColor: Colors.white,
                            labelColor: const Color.fromRGBO(27, 233, 233, 1),
                            indicatorColor: Colors.white,
                            indicatorWeight: 2,
                            indicator: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            controller: tabController,
                            tabs: const [
                              Tab(
                                text: 'LOST',
                              ),
                              Tab(
                                text: 'FOUND',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 170,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              child: TabBarView(
                controller: tabController,
                children: const [Lost(), Found()],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
