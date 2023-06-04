import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../lost_and_found/bloc/lost_and_found_bloc.dart';
import '../../lost_and_found/bloc/lost_and_found_event.dart';
import '../../lost_and_found/bloc/lost_and_found_state.dart';
import '../widgets/app_bar.dart';
import '../widgets/create_form.dart';
import '../widgets/giveaway_card.dart';
import '../widgets/lostItem.dart';


class FoundAdminPage extends StatefulWidget {
  


  @override
  State<FoundAdminPage> createState() => _FoundAdminPageState();
}

class _FoundAdminPageState extends State<FoundAdminPage> {
     @override
  void initState() {
    super.initState();
    BlocProvider.of<LostAndFoundBloc>(context).add(const FetchLostOrFoundEvent(index: 1, page: 1));
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
                      } else if (state is FoundItemOprationSuccess) {
                        return Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              ...state.foundItem.map((e) {
                                return LostItemCard(lostItem: e,type: 1,);
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




