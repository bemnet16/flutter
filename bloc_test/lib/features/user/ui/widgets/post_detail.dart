import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/user_bloc.dart';
import '../../bloc/user_state.dart';
import '../models/users.dart';
import 'user_post.dart';

class PostDetail extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoaded) {
          if (state.isPostLoading) {
            return const SizedBox(
              height: 300,
              child: Center(child: CircularProgressIndicator()),
            );
          }
          else if(state.giveaway.isNotEmpty){
           return Column(children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: state.giveaway.length,
                separatorBuilder: (context, index) => const SizedBox(
                  width: 15,
                ),
                itemBuilder: (context, index) => UserPost(state.giveaway[index]),
              ),
            ),
          ]);
          }
           else if(state.lostItems.isNotEmpty){
           return Column(children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: state.lostItems.length,
                separatorBuilder: (context, index) => const SizedBox(
                  width: 15,
                ),
                itemBuilder: (context, index) => UserPost(state.lostItems[index]),
              ),
            ),
          ]);
          }
          else if(state.foundItems.isNotEmpty){
           return Column(children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: state.foundItems.length,
                separatorBuilder: (context, index) => const SizedBox(
                  width: 15,
                ),
                itemBuilder: (context, index) => UserPost(state.foundItems[index]),
              ),
            ),
          ]);
          }
          
        }
        return Container();
      },
    );
  }
}
