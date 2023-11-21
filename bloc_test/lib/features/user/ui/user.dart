import 'package:bloc_test/features/user/bloc/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/post_detail.dart';
import 'widgets/saved_history.dart';
import 'widgets/settings.dart';
import 'widgets/user_info.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<UserBloc>(context)
        .add(const FetchUser(id: '6477bdf792aa4e51ef73d838'));
  }

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      body: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserHasLoaded) {
            userBloc
                .add(const ChangeTab(index: 0, id: "6477bdf792aa4e51ef73d838"));
          }
        },
        builder: (context, state) {
          print(state);
          if (state is UserLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UserLoaded) {
            return Container(
              color: Colors.white54,
              child: ListView(
                children: [
                  UserInfo(user: state.user),
                  const SavedHistory(id: "6477bdf792aa4e51ef73d838"),
                  PostDetail(),
                  Setting(user: state.user),
                ],
              ),
            );
          } else if (state is UserLoadingFailed) {
            Center(child: Text(state.error));
          }
          return Container();
        },
      ),
    );
  }
}
