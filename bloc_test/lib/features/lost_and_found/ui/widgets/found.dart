import 'package:bloc_test/features/lost_and_found/bloc/blocs.dart';
import 'package:bloc_test/features/lost_and_found/bloc/lost_and_found_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoundPage extends StatefulWidget {
  @override
  State<FoundPage> createState() => _FoundPageState();
}

class _FoundPageState extends State<FoundPage> {
  int currentQuestionIndex = 0;

  List<int?> selectedOptions = [];

  void setValue(value) {
    setState(() {
      selectedOptions = List.filled(value, value + 1);
    });
  }

  void showmodal(
      BuildContext context, List<Map<String, dynamic>> claimQuestions) {
    print(claimQuestions);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    claimQuestions[currentQuestionIndex]["question"],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Column(
                    children: List.generate(
                      claimQuestions[currentQuestionIndex]["answers"].length,
                      (index) {
                        return RadioListTile<int>(
                          title: Text(
                            claimQuestions[currentQuestionIndex]["answers"]
                                [index],
                            style: const TextStyle(fontSize: 16),
                          ),
                          value: index,
                          groupValue: selectedOptions[currentQuestionIndex],
                          onChanged: (value) {
                            setState(() {
                              selectedOptions[currentQuestionIndex] = value;
                            });
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (currentQuestionIndex < claimQuestions.length - 1) {
                          currentQuestionIndex++;
                        } else {
                          print(selectedOptions);
                          Navigator.pop(context);
                        }
                      });
                    },
                    child: Text(
                      currentQuestionIndex < claimQuestions.length - 1
                          ? 'Next'
                          : 'Finish',
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  // void _showBottomSheet(
  //     BuildContext context, List<Map<String, dynamic>> claimQuestions) {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return SingleChildScrollView(
  //           child: Container(
  //             padding: const EdgeInsets.all(16.0),
  //             color: Colors.white,
  //             child: Column(
  //                 children: claimQuestions.asMap().entries.map((e) {
  //               final value = e.value;
  //               final index = e.key;

  //               return Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text(value["question"], style: TextStyle(fontSize: 20)),
  //                   SizedBox(height: 10),
  //                   ...value["answers"].asMap().entries.map((answer) {
  //                     final answerValue = answer.value;
  //                     final index2 = answer.key;
  //                     return Row(
  //                       children: [
  //                         InkWell(
  //                           onTap: (){_setVAlue(index,index2);},
  //                           child: Container(
  //                             width: 20,
  //                             height: 20,
  //                             decoration: BoxDecoration(
  //                                 shape: BoxShape.circle,
  //                                 color: index2 == answers[index]
  //                                     ? const Color(0)
  //                                     : Colors.grey),
  //                           ),
  //                         ),
  //                         SizedBox(
  //                           width: 10,
  //                         ),
  //                         Text(
  //                           answerValue,
  //                           style: TextStyle(fontSize: 20),
  //                         ),
  //                       ],
  //                     );
  //                   }).toList(),
  //                   SizedBox(
  //                     height: 15,
  //                   )
  //                 ],
  //               );
  //             }).toList()),
  //           ),
  //         );
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LostAndFoundBloc, LostAndFoundState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        if (state is FoundItemOprationSuccess) {
          final foundItems = state.foundItem;
          return ListView.builder(
            itemCount: foundItems.length,
            itemBuilder: (BuildContext context, int index) {
              final foundItem = foundItems[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(foundItem.imageUrl!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundImage:
                                            foundItem.userPicturePath != null
                                                ? NetworkImage(
                                                    foundItem.userPicturePath!)
                                                : null,
                                      ),
                                      const SizedBox(width: 8),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            foundItem.userName,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          const Text(
                                            'Found Date: May 23, 2023',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        foundItem.category,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        foundItem.title,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Text(
                                        "location",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.place,
                                            color: Colors.grey,
                                            size: 16,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            foundItem.location,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              const SizedBox(height: 8),
                              Text(
                                foundItem.description,
                                // ignore: prefer_const_constructors
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 16),
                              foundItem.claimQuestions != null &&
                                      foundItem.claimQuestions!.isNotEmpty
                                  ? ElevatedButton(
                                      onPressed: () {
                                        setValue(value)
                                        return showmodal(
                                            context, foundItem.claimQuestions!);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.fromLTRB(
                                            16, 8, 16, 8),
                                      ),
                                      child: const Text(
                                        'Claim',
                                      ),
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
        return Container();
      },
    );
  }
}
