import 'package:bloc_test/features/admin/widgets/lostItem.dart';
import 'package:bloc_test/features/lost_and_found/bloc/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../lost_and_found/bloc/lost_and_found_bloc.dart';
import '../widgets/app_bar.dart';
import '../widgets/create_form.dart';
import '../widgets/giveaway_card.dart';

class LostAdminPage extends StatefulWidget {
  @override
  State<LostAdminPage> createState() => _LostAdminPageState();
}

class _LostAdminPageState extends State<LostAdminPage> {
    @override
  void initState() {
    super.initState();
    BlocProvider.of<LostAndFoundBloc>(context).add(const FetchLostOrFoundEvent(index: 0, page: 1));
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
                  child: BlocBuilder<LostAndFoundBloc, LostAndFoundState>(
                    builder: (context, state) {
                      if (state is LoadingState) {
                        const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is LostItemOprationSuccess) {
                        return Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              ...state.lostItem.map((e) {
                                return LostItemCard(lostItem: e, type: 0,);
                              })
                            ],
                          ),
                        );
                      }
                      return Container();
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
