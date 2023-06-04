import 'dart:convert';

import 'package:bloc_test/features/lost_and_found/models/found_items_model.dart';
import 'package:bloc_test/features/lost_and_found/models/lost_items_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LostAndFoundDataProvider {
  static const String _baseUrl1 = "http://192.168.56.1:5000/api/v1/lostItem";
  static const String _baseUrl2 = "http://192.168.56.1:5000/api/v1/foundItem";
  Future<List<LostItem>> getLostItems(page, filter) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    String filterOption = '';

    if (filter.containsKey("catagory")) {
      filterOption +=
          '${filterOption == '' ? "?" : ""}catagory=${filter["catagory"]}&';
    }
    filterOption += '${filterOption == '' ? "?" : ""}page=$page';
    http.Response response = await http.get(
      Uri.parse("$_baseUrl1/$filterOption"),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final lostItems = jsonDecode(response.body)["data"] as List;
      final lostItemsFinal = lostItems.map((c) {
        return LostItem.fromMap(c);
      }).toList();

      return lostItemsFinal;
    } else {
      throw Exception("Could not fetch lostItems");
    }
  }

  Future<List<FoundItem>> getFoundItems(page, filter) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    String filterOption = '';

    if (filter.containsKey("catagory")) {
      filterOption +=
          '${filterOption == '' ? "?" : null}catagory=${filter["catagory"]}&';
    }
    filterOption += '${filterOption == '' ? "?" : null}page=$page';
    // print("$_baseUrl2/$filterOption");
    http.Response response = await http.get(
      Uri.parse("$_baseUrl2/$filterOption"),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final foundItems = jsonDecode(response.body)["data"] as List;
      final list = foundItems.map((c) => FoundItem.fromMap(c)).toList();
      return list;
    } else {
      throw Exception("Could not fetch foundItems");
    }
  }

  Future<LostItem> createLostItems(LostItem giveaway) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final http.Response response = await http.post(Uri.parse(_baseUrl1),
        headers: <String, String>{"Content-Type": "application/json"},
        body: giveaway.toJson());

    if (response.statusCode == 201) {
      return LostItem.fromMap(jsonDecode(response.body)["data"]);
    }
    {
      throw Exception("Failed to create  lostItem ");
    }
  }

  Future<FoundItem> createFoundItem(FoundItem giveaway) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final http.Response response = await http.post(Uri.parse(_baseUrl2),
        headers: <String, String>{
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token'
        },
        body: giveaway.toJson());

    if (response.statusCode == 201) {
      return FoundItem.fromMap(jsonDecode(response.body)["data"]);
    }
    {
      throw Exception("Failed to create foundItem ");
    }
  }

  Future<void> deleteFoundItem(FoundItem foundItem) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    await http.delete(
      Uri.parse("$_baseUrl2/${foundItem.id}"),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
  }

  Future<void> deleteLostItem(LostItem lostItem) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    await http.delete(
      Uri.parse("$_baseUrl2/${lostItem.id}"),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
  }

  // Future<Giveaway> update(Giveaway giveaway) async {
  //   final response = await put(Uri.parse("$_baseUrl/${giveaway.id}"),
  //       headers: <String, String>{"Content-Type": "application/json"},
  //       body: giveaway.toJson());

  //   if (response.statusCode == 200) {
  //     return Giveaway.fromJson(jsonDecode(response.body)["data"]);
  //   } else {
  //     throw Exception("Could not update the giveaway");
  //   }
  // }

  // Future<void> delete(Giveaway giveaway) async {
  //   await delete(Uri.parse("$_baseUrl/${giveaway.id}") as Giveaway);
  // }
}
