import 'dart:convert';

import 'package:http/http.dart';
import 'package:path/path.dart' as path;

import '../model/user_model.dart';

class AuthDataProvider {
  static const String _baseUrl = "http://192.168.56.1:5000/api/v1/auth";
  static String signupkey = "signup";
  static String loginkey = "login";

  Future<Map<String, dynamic>> loginUser(email, password) async {
    Response response = await post(Uri.parse("$_baseUrl/$loginkey"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}));
    print(response.body);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body)["data"];
      return {
        "user": User.fromMap(result["user"]),
        "token": User.fromMap(result["token"])
      };
    } else {
      throw Exception("incorrect credential");
    }
  }

  Future<User> signupUser(User user) async {
    if (user.profileImage != null) {
      var request = MultipartRequest('POST', Uri.parse("$_baseUrl/$signupkey"));
      var stream = ByteStream(Stream.castFrom(user.profileImage!.openRead()));
      var length = await user.profileImage!.length();
      var multipartFile = MultipartFile(
        'profileImage',
        stream,
        length,
        filename: path.basename(user.profileImage!.path),
      );

      request.files.add(multipartFile);
      request.fields['email'] = user.email;
      request.fields['password'] = user.password;
      request.fields['firstName'] = user.firstName;
      request.fields['lastName'] = user.lastName;
      request.fields['userName'] = user.userName;
      request.fields['YearOfStudy'] = user.YearOfStudy.toString();
      request.fields['Program'] = user.Program;

      var response = await request.send();
      var responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        final user = jsonDecode(responseBody)["data"];
        return User.fromMap(user);
      } else {
        throw Exception("Incorrect credentials");
      }
    } else {
      final response = await post(Uri.parse("$_baseUrl/$signupkey"),
          headers: <String, String>{"Content-Type": "application/json"},
          body: user.toJson());

      if (response.statusCode == 201) {
        return User.fromMap(jsonDecode(response.body)["data"]);
      } else {
        if (response.reasonPhrase != null) {
          throw ('Error: ${"bullshit"}');
        }
        throw ("hhh");
      }
    }
  }
}
