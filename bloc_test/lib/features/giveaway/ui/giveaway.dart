import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/giveaway_bloc.dart';
import 'constants/colors.dart';
import 'widgets/card.dart';

class Giveaway extends StatefulWidget {
  const Giveaway({super.key});

  @override
  State<Giveaway> createState() => _GiveawayState();
}

class _GiveawayState extends State<Giveaway> {
  // ignore: non_constant_identifier_names
  final text_controller1 = TextEditingController();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GiveawayBloc>(context)
        .add(const FetchGiveawayEvent(page: 1, filter: {}));
  }

  @override
  Widget build(BuildContext context) {
    final giveawayBloc = BlocProvider.of<GiveawayBloc>(context);
    return BlocConsumer<GiveawayBloc, GiveawayState>(
      listener: (context, state) {},
      builder: (context, state) {
         print(state);
        return Scaffold(
          body: state.isLoading
              ? Center(child: CircularProgressIndicator())
              : SafeArea(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: lightGrey),
                            color: cardColor,
                          ),
                          child: TextField(
                            controller: text_controller1,
                            onSubmitted: (value) {
                              giveawayBloc.add(FetchGiveawayEvent(
                                  page: 1, filter: {"catagory": value}));
                            },
                            decoration: const InputDecoration(
                              hintText: 'Search',
                              prefixIcon: Icon(Icons.search),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(16.0),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: state.giveaways.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 8.0),
                              child: GestureDetector(
                                onTap: () {},
                                child: CardWidget(
                                    cardData: state.giveaways[index]),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
