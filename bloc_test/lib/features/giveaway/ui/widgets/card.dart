import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../routes/app_route_const.dart';
import '../../model/giveaway_model.dart';




class CardWidget extends StatelessWidget {
  final Giveaway cardData;
   const CardWidget({required this.cardData});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10.0)),
            child:cardData.imageUrl != null? Image.network(
              cardData.imageUrl!,
              height: 200.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ):Container(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: cardData.userPicturePath != null
                    ? NetworkImage(cardData.userPicturePath!)
                    : null,),
                    const SizedBox(width: 8.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cardData.userName,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          "12/12/2022",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Text(
                  cardData.title,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  cardData.description,
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: cardData.condition == 'New'
                          ? Colors.green
                          : Colors.red,
                    ),
                    const SizedBox(width: 4.0),
                    Text(
                      cardData.condition,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: cardData.condition == 'New'
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).pushNamed(MyAppRouteConstants.giveawayDetailRouteName,pathParameters: {"id":cardData.id!});
                  },
                  child: const Text("detail"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
