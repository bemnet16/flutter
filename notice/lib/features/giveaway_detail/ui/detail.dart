import 'package:bloc_test/features/giveaway_detail/bloc/blocs.dart';
import 'package:bloc_test/features/giveaway_detail/models/essay_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../routes/app_route_const.dart';

class GiveawayDetailPage extends StatefulWidget {
  const GiveawayDetailPage({super.key, required this.id});
  final String id;

  @override
  _GiveawayDetailPageState createState() => _GiveawayDetailPageState();
}

class _GiveawayDetailPageState extends State<GiveawayDetailPage> {
  final List<IconData> icons = [
    Icons.facebook,
    Icons.link,
    Icons.send,
    Icons.messenger,
    Icons.call,
    Icons.sms,
    Icons.email,
    Icons.android,
    Icons.camera,
  ];

  final List<String> labels = [
    'Facebook',
    'Link',
    'Telegram',
    'Message',
    'IMO',
    'WhatsApp',
    'Gmail',
    'Snapchat',
    'LinkedIn',
  ];
  var comments = [];
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GiveawayDetailBloc>(context)
        .add(FetchGiveaway(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    final GiveawayDetailBloc giveawayDetailBloc =
        BlocProvider.of<GiveawayDetailBloc>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 30.0),
          onPressed: () {
            Navigator.pop(context);
            // GoRouter.of(context).goNamed(MyAppRouteConstants.bottomBarRouteName,
            //     queryParameters: {"index": 2});
          },
        ),
        backgroundColor: Colors.white, // Make the app bar transparent
        elevation: 0, // Remove the app bar shadow
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Colors.black, size: 30.0),
            onPressed: () {
              GoRouter.of(context)
                  .pushNamed(MyAppRouteConstants.giveawayRouteName);
            },
          ),
        ],
      ),
      body: Center(
        child: BlocConsumer<GiveawayDetailBloc, GiveawayDetailState>(
          listener: (context, state) {},
          builder: (context, state) {
            final giveaway = state.giveaway;
            if (state.isLoading) {
              return const CircularProgressIndicator();
            }
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          height: 250.0,
                          width: double.infinity,
                          child: Image.network(
                            "https://i.pinimg.com/564x/28/df/69/28df69b032c2f21898dd80751b61791f.jpg",
                            height: 250,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          )),
                      const SizedBox(height: 16.0),
                      Row(
                        children: [
                          const SizedBox(width: 8.0),
                          Text(
                            giveaway.title!,
                            style: const TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      GestureDetector(
                        onTap: () {
                          giveawayDetailBloc
                              .add(FetchGiveawayEssay(id: widget.id));
                          essaySection(context, giveawayDetailBloc);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.lightBlue,
                          ),
                          padding: const EdgeInsets.all(16.0),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.comment,
                                color: Colors.white,
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                'Essay Section',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.grey[200],
                        ),
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              giveaway
                                  .description!, // Change the description title
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            Row(
                              children: [
                                const Text("condition",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    )),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(giveaway.condition!,
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<dynamic> essaySection(BuildContext context, bloc) {
    TextEditingController commentController = TextEditingController();
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return BlocConsumer<GiveawayDetailBloc, GiveawayDetailState>(
          listener: (BuildContext context, Object? state) {},
          builder: (BuildContext context, state) {
            print(state);
            return Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                  left: 10,
                  right: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context, 'Cancel');
                          },
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        'Essay Section',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Expanded(
                    child: state.isEssayloading
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            itemCount: state.essays
                                .length, // Replace with your comment count
                            itemBuilder: (context, index) {
                              final essay = state.essays[index];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage:
                                          essay.userProfileImg != null
                                              ? NetworkImage(state.essays[index]
                                                  .userProfileImg!)
                                              : null,
                                    ),
                                    title: Text(essay.userName),
                                  ),
                                  Text(essay.content)
                                ],
                              );
                            },
                          ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.grey[200],
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextField(
                            controller: commentController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter your essay',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      ElevatedButton(
                        onPressed: () {
                          final essay = Essay(
                            content: commentController.text,
                            giveAwayItemId: widget.id,
                            userId: '646f5657f8324db9c1378124',
                            userName: 'abel',
                          );
                          bloc.add(CreateEssay(essay: essay));
                          commentController.text = "";
                        },
                        child: const Text('Send'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Future<dynamic> share(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context, 'Cancel');
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    'Let\'s share it with your friend',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Column(
                children: List.generate(3, (rowIndex) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(3, (index) {
                      final iconIndex = rowIndex * 3 + index;
                      if (iconIndex < icons.length) {
                        return Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey[200],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  icons[iconIndex],
                                  size: 40,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              labels[iconIndex],
                              style: const TextStyle(fontSize: 14.0),
                            ),
                          ],
                        );
                      } else {
                        return const SizedBox();
                      }
                    }),
                  );
                }),
              ),
            ],
          ),
        );
      },
    );
  }
}
