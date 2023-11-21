import 'dart:convert';

import '../model/notice_model.dart';
import 'package:http/http.dart';

class NoticeDataProvider {
  static const String _baseUrl = "http://192.168.56.1:5000/api/v1/notice";
  Future<List<Notice>> getNotices(page, filter) async {
    String filterOption = '';

    if (filter.containsKey("catagory")) {
      filterOption +=
          '${filterOption == '' ? "?" : ""}department=${filter["catagory"]}&';
    }
    if (filter.containsKey("year")) {
      filterOption += '${filterOption == '' ? "?" : ""}year=${filter["year"]}&';
    }
    if (filter.containsKey("program")) {
      filterOption +=
          '${filterOption == '' ? "?" : ""}program=${filter["program"]}&';
    }
    filterOption += '${filterOption == '' ? "?" : ""}page=$page';
    var url = Uri.parse("$_baseUrl/$filterOption");
    var response = await get(url);
    if (response.statusCode == 200) {
      final notices = jsonDecode(response.body)["data"] as List;
      
      final list = notices.map((c) => Notice.fromMap(c)).toList();
      return list;
    } else {
      throw Exception("Could not fetch courses");
    }
  }

  Future<Notice> create(Notice notice) async {
    final Response response = await post(Uri.parse(_baseUrl),
        headers: <String, String>{"Content-Type": "application/json"},
        body: notice.toJson());

    if (response.statusCode == 201) {
      return Notice.fromMap(jsonDecode(response.body)["data"]);
    }
    {
      throw Exception("Failed to create course");
    }
  }

  Future<Notice> update(Notice notice) async {
    final response = await put(Uri.parse("$_baseUrl/${notice.id}"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: notice.toJson());

    if (response.statusCode == 200) {
      return Notice.fromMap(jsonDecode(response.body)["data"]);
    } else {
      throw Exception("Could not update the course");
    }
  }

  Future<void> delete(Notice notice) async {
    await delete(Uri.parse("$_baseUrl/${notice.id}") as Notice);
  }
}
