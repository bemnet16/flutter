import 'package:bloc_test/features/lost_and_found/bloc/blocs.dart';
import 'package:bloc_test/features/lost_detail/lost_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../routes/app_route_const.dart';
import 'widgets/found.dart';

class LostAndFoundPage extends StatefulWidget {
  @override
  _LostAndFoundPageState createState() => _LostAndFoundPageState();
}

class _LostAndFoundPageState extends State<LostAndFoundPage>
    with SingleTickerProviderStateMixin {
  // Controller for the tab view
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
    BlocProvider.of<LostAndFoundBloc>(context)
        .add((const FetchLostOrFoundEvent(index: 0, page: 1)));
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      BlocProvider.of<LostAndFoundBloc>(context)
          .add(FetchLostOrFoundEvent(index: _tabController.index, page: 1));
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
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
                        controller: _tabController,
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
      BlocConsumer<LostAndFoundBloc, LostAndFoundState>(
        listener: (BuildContext context, Object? state) {},
        builder: (BuildContext context, state) {
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LostItemOprationSuccess) {
            final lostItems = state.lostItem;
            return Positioned(
                top: 130,
                left: 0,
                right: 0,
                bottom: 0,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView.separated(
                      itemCount: lostItems.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.all(16.0),
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(4.0),
                                child: const Text(
                                  'May 31, 2023',
                                  style: TextStyle(
                                      color: Color.fromRGBO(27, 233, 233, 1),
                                      fontSize: 16),
                                ),
                              ),
                              Text(
                                lostItems[index].title,
                                style: const TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w300),
                              ),
                              Text(
                                lostItems[index].category,
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              ListTile(
                                contentPadding: const EdgeInsets.all(0),
                                leading: CircleAvatar(
                                  radius: 24.0,
                                  backgroundImage:
                                      lostItems[index].userPicturePath != null
                                          ? NetworkImage(
                                              lostItems[index].userPicturePath!)
                                          : null,
                                ),
                                title: Text(
                                  lostItems[index].userName,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                trailing: IconButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (BuildContext context) {
                                      return LostDetailPage(
                                          data: lostItems[index]);
                                    }));
                                  },
                                  icon: const Icon(
                                    Icons.keyboard_double_arrow_right_rounded,
                                    color: Colors.yellow,
                                    size: 35,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 20),
                    ),
                    Container()
                  ],
                ));
          } else if (state is FoundItemOprationSuccess) {
            return Positioned(
                top: 130,
                left: 0,
                right: 0,
                bottom: 0,
                child: TabBarView(
                  controller: _tabController,
                  children: [Container(), FoundPage()],
                ));
          } else if (state is ErrorState) {
            return Center(child: Text(state.error));
          }
          return Container();
        },
      )
    ]));
  }
}
