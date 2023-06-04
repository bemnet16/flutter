import 'dart:convert';
import 'package:bloc_test/features/user/models/giveaway_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/found_items_model.dart';
import '../models/lost_items_model.dart';
import '../models/user_model.dart';

class UserDataProvider {
  static const String _baseUrl1 = "http://192.168.56.1:5000/api/v1/user";

  Future<User> getUser(id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    http.Response response = await http.get(
      Uri.parse("$_baseUrl1/$id"),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final user = jsonDecode(response.body)["data"];
      return User.fromMap(user);
    } else {
      throw Exception("Could not fetch user");
    }
  }

  Future<List<User>> getUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    http.Response response = await http.get(
      Uri.parse(_baseUrl1),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final users = jsonDecode(response.body)["data"] as List;

      return users.map((e) => User.fromMap(e)).toList();
    } else {
      throw Exception("Could not fetch user");
    }
  }

  Future<User> update(user) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await http.patch(Uri.parse("$_baseUrl1/${user["id"]}"),
        headers: <String, String>{
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(user));

    if (response.statusCode == 200) {
      return User.fromMap(jsonDecode(response.body)["data"]);
    } else {
      throw Exception("Could not update the user");
    }
  }

  Future<void> delete(id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    await http.delete(
      Uri.parse("$_baseUrl1/$id"),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
  }

  Future<List<LostItem>> getLostItems(id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    http.Response response = await http.get(
      Uri.parse("$_baseUrl1/$id/lostItem"),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
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
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    http.Response response = await http.get(
      Uri.parse("$_baseUrl1/$id/foundItem"),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final foundItems = jsonDecode(response.body)["data"] as List;
      return foundItems.map((c) => FoundItem.fromMap(c)).toList();
    } else {
      throw Exception("Could not fetch foundItems");
    }
  }

  Future<List<Giveaway>> getGiveaway(id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    http.Response response = await http.get(
      Uri.parse("$_baseUrl1/$id/giveaway"),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final giveaway = jsonDecode(response.body)["data"] as List;
      return giveaway.map((c) => Giveaway.fromMap(c)).toList();
    } else {
      throw Exception("Could not fetch giveaway");
    }
  }
}
