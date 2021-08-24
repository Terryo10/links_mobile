import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:links_app/data/strings.dart';
import 'package:http/http.dart' as http;

class ExpertiseProvider {
  final FlutterSecureStorage storage;

  ExpertiseProvider({required this.storage});

  Future getExpertiesList() async {
    try {
      var token = await storage.read(key: 'token');
      var url = '${AppStrings.baseUrl}${AppStrings.expertiseList}';
      var headers = <String, String>{
        "Authorization": "Bearer $token",
        "content-type": "application/json"
      };
      var response = await http.get(Uri.parse(url), headers: headers);
      print(response.body);

      if (response.statusCode == 200) {
        return response.body;
      } else {
        print(response.body);
        throw new Exception("Oops! Something went wrong.");
      }
    } on SocketException {
      throw Exception('We cannot connect, check your connection');
    } catch (e) {
      throw new Exception("Oops! Something went wrong.");
    }
  }
}
