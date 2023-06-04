import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

import '../../bloc/notice_bloc.dart';

class DepartmentFilter extends StatefulWidget {
  const DepartmentFilter({super.key});

  @override
  _DepartmentFilterState createState() => _DepartmentFilterState();
}

class _DepartmentFilterState extends State<DepartmentFilter> {
  final List<IconData> departmentIcons = [
    Icons.electrical_services,
    Icons.code,
    Icons.engineering,
    Icons.build,
    Icons.favorite,
    Icons.science,
  ];

  final List<String> departmentNames = [
    'Electrical',
    'Software',
    'Civil',
    'Mechanical',
    'Biomedical',
    'Chemical',
  ];

  final List<String> cardBackgroundImages = [
    'https://i.pinimg.com/236x/c4/06/28/c406280d81f7e0e32f6b5f3af36d4282.jpg',
    'https://i.pinimg.com/236x/65/69/b8/6569b84671e254fb3531076d4fdcb84b.jpg',
    'https://i.pinimg.com/236x/17/d7/05/17d70550e91d9eae479255720d3087f4.jpg',
    'https://i.pinimg.com/236x/23/3b/9a/233b9ad5f7fff72d5f514d3ec3ab5bb3.jpg',
    'https://i.pinimg.com/236x/e2/0a/b8/e20ab8db854ea6a82bde5e65a83d1ff3.jpg',
    'https://i.pinimg.com/236x/29/a1/7e/29a17ebdb3e0bac2ecaa44e3c0919dd9.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    final noticeBloc = BlocProvider.of<NoticeBloc>(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 16.0, 0, 0),
      child: SizedBox(
        height: 120,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: CustomScrollPhysics(),
          itemCount: departmentIcons.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                noticeBloc.add((FetchNoticeEvent(
                    page: 1, filter: {"catagory": departmentNames[index].toLowerCase()})));
              },
              child: Container(
                width: 180,
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage(cardBackgroundImages[index]),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.4),
                      BlendMode.darken,
                    ),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 8.0,
                      left: 8.0,
                      child: Text(
                        departmentNames[index],
                        style: TextStyle(
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
                        departmentIcons[index],
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
      ),
    );
  }
}

class CustomScrollPhysics extends ScrollPhysics {
  CustomScrollPhysics({ScrollPhysics? parent}) : super(parent: parent);

  @override
  ScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomScrollPhysics(parent: buildParent(ancestor));
  }

  double getScrollPosition(
    ScrollMetrics position,
    double velocity,
  ) {
    return position.pixels;
  }

  @override
  Simulation? createBallisticSimulation(
    ScrollMetrics position,
    double velocity,
  ) {
    return null;
  }
}
