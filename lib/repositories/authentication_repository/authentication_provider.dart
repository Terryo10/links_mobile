import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:links_app/data/strings.dart';
import 'package:http/http.dart' as http;

class AuthenticationProvider {
  final FlutterSecureStorage storage;

  AuthenticationProvider({required this.storage});
  Future login({required String password, required String email}) async {
    String url = '${AppStrings.baseUrl}${AppStrings.loginUrl}';
    print(url);
    var body =
        jsonEncode(<String, String>{'email': email, 'password': password});
    var headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
    try {
      var response =
          await http.post(Uri.parse(url), headers: headers, body: body);
      print(response.body);

      if (response.statusCode == 200) {
        return response.body;
      } else {
        var data = jsonDecode(response.body);
        throw Exception(data['message']);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future logout() async {
    await storage.deleteAll();
  }
}
