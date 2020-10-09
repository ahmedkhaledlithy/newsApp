import 'package:flutter_newsapp_api/api/api_utilities.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthenticationApiLogin {
  Future<bool> api_auth(String username, String email) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };

    Map<String, String> body = {"username": username, "email": email};
    var response = await http.post(login_api, headers: headers, body: body);
    var jasonData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
