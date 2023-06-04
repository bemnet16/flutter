import 'package:bloc_test/features/user/bloc/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/app_bar.dart';
import '../widgets/create_form.dart';
import '../widgets/giveaway_card.dart';
import '../widgets/user_cart.dart';

class UserAdminPage extends StatefulWidget {
  @override
  State<UserAdminPage> createState() => _UserAdminPageState();
}

class _UserAdminPageState extends State<UserAdminPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserBloc>(context).add(FetchUsers());
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
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: BlocConsumer<UserBloc, UserState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (state is UserLoading) {
                          return const Center(child:CircularProgressIndicator());
                        } else if (state is UsersLoaded) {
                          return Column(
                            children: [
                              ...state.user.map((user) {
                                return UserCard(user: user);
                              })
                            ],
                          );
                        }
                        return Container();
                      },
                    ),
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
