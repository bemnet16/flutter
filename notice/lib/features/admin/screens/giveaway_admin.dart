import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../giveaway/bloc/giveaway_bloc.dart';
import '../widgets/app_bar.dart';
import '../widgets/create_form.dart';
import '../widgets/giveaway_card.dart';

class GiveawayAdminPage extends StatefulWidget {
  
  @override
  State<GiveawayAdminPage> createState() => _GiveawayAdminPageState();
}

class _GiveawayAdminPageState extends State<GiveawayAdminPage> {
    @override
      void initState() {
    super.initState();
    BlocProvider.of<GiveawayBloc>(context).add(const FetchGiveawayEvent(page: 1));
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
                  child: BlocConsumer<GiveawayBloc, GiveawayState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      if (state.isLoading) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            ...state.giveaways.map((e) {
                              return   GiveawayCard(
                                giveaway: e,
                              );
                            })
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
