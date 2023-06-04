import 'dart:convert';

import 'package:bloc_test/features/giveaway_detail/models/essay_model.dart';
import 'package:bloc_test/features/giveaway_detail/models/giveaway_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GiveawayDataDetailProvider {
  static const String _baseUrl1 = "http://192.168.56.1:5000/api/v1/giveaway";
  static const String _baseUrl2 = "http://192.168.56.1:5000/api/v1/essay";

  Future<Giveaway> getGiveawaydetail(id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    http.Response response = await http.get(
      Uri.parse("$_baseUrl1/$id"),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final giveaway = jsonDecode(response.body)["data"];
      return Giveaway.fromMap(giveaway);
    } else {
      throw Exception("Could not fetch giveaway");
    }
  }

  Future<List<Essay>> getGiveawayEssay(id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    http.Response response = await http.get(
      Uri.parse("$_baseUrl1/$id/essay"),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final essays = jsonDecode(response.body)["data"] as List;
      final finalEssay = essays.map((e) => Essay.fromMap(e)).toList();

      return finalEssay;
    } else {
      throw Exception("Could not fetch giveaway");
    }
  }

  Future<Essay> createEssay(Essay essay) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final http.Response response = await http.post(Uri.parse(_baseUrl2),
        headers: <String, String>{
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token'
        },
        body: essay.toJson());
    if (response.statusCode == 201) {
      return Essay.fromMap(jsonDecode(response.body)["data"]);
    } else {
      throw Exception("Failed to create essay");
    }
  }
}
