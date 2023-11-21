import 'package:bloc_test/features/notice/bloc/notice_bloc.dart';
import 'package:bloc_test/features/notice/ui/widgets/card.dart';
import 'package:flutter/material.dart';


import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/bottomSheet.dart';
import 'widgets/filter.dart';

class NoticePage extends StatefulWidget {
  NoticePage({super.key});

  @override
  State<NoticePage> createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<NoticeBloc>(context)
        .add(const FetchNoticeEvent(page: 1, filter: {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              showFilterBottomSheet(context);
            },
          ),
        ],
      ),
      body: BlocConsumer<NoticeBloc, NoticeState>(
          listener: (context, state) {},
          builder: (context, state) {
            final noticeBloc = BlocProvider.of<NoticeBloc>(context);
            final notices = state.notices;
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView(
              children: [
                const DepartmentFilter(),
                ...notices.map((notice) {
                  return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                          child: CustomCard(
                              title: notice.title,
                              content: notice.content,
                              imageUrl: notice.imgUrl!, date: '22/11/2015', subtitle: notice.department, iconColor: Colors.green, iconData: Icons.access_time,)));
                }).toList()
              ],
            );
          }),
    );
  }
}
