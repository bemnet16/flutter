import 'package:bloc_test/features/admin/widgets/notice_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../notice/bloc/notice_bloc.dart';
import '../widgets/app_bar.dart';
import '../widgets/create_form.dart';
import '../widgets/giveaway_card.dart';

class NoticeAdminPage extends StatefulWidget {
  @override
  State<NoticeAdminPage> createState() => _NoticeAdminPageState();
}

class _NoticeAdminPageState extends State<NoticeAdminPage> {
    @override
  void initState() {
    super.initState();
    BlocProvider.of<NoticeBloc>(context).add(FetchNoticeEvent(page: 1));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 16.0, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20), // Adding padding at the top
              appbar(),
              const SizedBox(height: 20), // Adding padding below the button
              Expanded(
                child: SingleChildScrollView(
                  child: BlocBuilder<NoticeBloc, NoticeState>(
                    builder: (context, state) {
                      if (state.isLoading) {
                        Center(child: CircularProgressIndicator());
                      }
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            ...state.notices.map((e) => NoticeCard(notice: e))
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showTitleContentBottomSheet(context);
        },
        child: const Icon(Icons.add),
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

  @override
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
