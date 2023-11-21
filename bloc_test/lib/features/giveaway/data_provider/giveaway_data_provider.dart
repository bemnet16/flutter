import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/giveaway_model.dart';

class GiveawayDataProvider {
  static const String _baseUrl = "http://192.168.56.1:5000/api/v1/giveaway";
  Future<List<Giveaway>> getGiveaways(page, filter) async {

    String filterOption = '';


    if (filter.containsKey("catagory")) {
      filterOption += '${filterOption == '' ? "?" : ""}catagory=${filter["catagory"]}&';
    }

    filterOption += '${filterOption == '' ? "?" : ""}page=$page';
   

    final  response = await http.get(Uri.parse("$_baseUrl/$filterOption"));
    

    if (response.statusCode == 200) {
      final giveaway = jsonDecode(response.body)["data"] as List;
      return giveaway.map((c) => Giveaway.fromMap(c)).toList();
    } else {
      throw Exception("Could not fetch giveaway");
    }
  }

  Future<Giveaway> create(Giveaway giveaway) async {
    final  response = await http.post(Uri.parse(_baseUrl),
        headers: <String, String>{"Content-Type": "application/json"},
        body: giveaway.toJson());

    if (response.statusCode == 201) {
      return Giveaway.fromMap(jsonDecode(response.body)["data"]);
    }
    {
      throw Exception("Failed to create giveaway item ");
    }
  }

  Future<Giveaway> update(Giveaway giveaway) async {
    final response = await http.put(Uri.parse("$_baseUrl/${giveaway.id}"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: giveaway.toJson());

    if (response.statusCode == 200) {
      return Giveaway.fromJson(jsonDecode(response.body)["data"]);
    } else {
      throw Exception("Could not update the giveaway");
    }
  }

  Future<void> delete(Giveaway giveaway) async {
    await http.delete(Uri.parse("$_baseUrl/${giveaway.id}") as Uri);
  }
}
