import 'dart:convert';
import 'package:bloc_test/features/user/models/giveaway_model.dart';
import 'package:http/http.dart';

import '../models/found_items_model.dart';
import '../models/lost_items_model.dart';
import '../models/user_model.dart';

class UserDataProvider {
  static const String _baseUrl1 = "http://192.168.56.1:5000/api/v1/user";

  Future<User> getUser(id) async {
    print("$_baseUrl1/$id");
    Response response = await get(Uri.parse("$_baseUrl1/$id"));
    if (response.statusCode == 200) {
      final user = jsonDecode(response.body)["data"];
      return User.fromMap(user);
    } else {
      throw Exception("Could not fetch user");
    }
  }

  Future<User> update(user) async {
    final response = await patch(Uri.parse("$_baseUrl1/${user["id"]}"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode(user));
    print(response.statusCode);
    if (response.statusCode == 200) {
      
      return User.fromMap(jsonDecode(response.body)["data"]);
    } else {
      throw Exception("Could not update the user");
    }
  }

  Future<void> delete(User user) async {
    await delete(Uri.parse("$_baseUrl1/${user.id}") as User);
  }

  Future<List<LostItem>> getLostItems(id) async {
    Response response = await get(Uri.parse("$_baseUrl1/$id/lostItem"));
    if (response.statusCode == 200) {
      final lostItems = jsonDecode(response.body)["data"] as List;
      print(lostItems);
      final list = lostItems.map((c) => LostItem.fromMap(c)).toList();

      return list;
    } else {
      throw Exception("Could not fetch lostItems");
    }
  }

  Future<List<FoundItem>> getFoundItems(id) async {
    Response response = await get(Uri.parse("$_baseUrl1/$id/foundItem"));
    if (response.statusCode == 200) {
      final foundItems = jsonDecode(response.body)["data"] as List;
      return foundItems.map((c) => FoundItem.fromMap(c)).toList();
    } else {
      throw Exception("Could not fetch foundItems");
    }
  }

  Future<List<Giveaway>> getGiveaway(id) async {
    Response response = await get(Uri.parse("$_baseUrl1/$id/giveaway"));
    if (response.statusCode == 200) {
      final giveaway = jsonDecode(response.body)["data"] as List;
      return giveaway.map((c) => Giveaway.fromMap(c)).toList();
    } else {
      throw Exception("Could not fetch giveaway");
    }
  }
}
