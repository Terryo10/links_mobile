import 'dart:convert';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:links_app/bloc/user_bloc/user_bloc.dart';
import 'package:links_app/data/strings.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  final FlutterSecureStorage storage;

  UserProvider({required this.storage});
  Future getUserData() async {
    try {
      var token = await storage.read(key: 'token');
      var url = '${AppStrings.baseUrl}${AppStrings.userData}';
      var headers = <String, String>{
        "Authorization": "Bearer $token",
        "content-type": "application/json"
      };
      var response = await http.get(Uri.parse(url), headers: headers);
      print(response.body);

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw new Exception("Oops! Something went wrong.");
      }
    } on SocketException {
      throw Exception('We cannot connect, check your connection');
    } catch (e) {
      throw new Exception("Oops! Something went wrong.");
    }
  }

  Future getAppliedJobs() async {
    try {
      var token = await storage.read(key: 'token');
      var url = '${AppStrings.baseUrl}${AppStrings.appliedJobs}';
      var headers = <String, String>{
        "Authorization": "Bearer $token",
        "content-type": "application/json"
      };
      var response = await http.get(Uri.parse(url), headers: headers);
      print(response.body);

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw new Exception("Oops! Something went wrong.");
      }
    } on SocketException {
      throw Exception('We cannot connect, check your connection');
    } catch (e) {
      throw new Exception("Oops! Something went wrong.");
    }
  }

  Future jobApplication({required jobId}) async {
    try {
      var token = await storage.read(key: 'token');
      var url = '${AppStrings.baseUrl}${AppStrings.jobApplication}$jobId';
      print(url);
      var headers = <String, String>{
        "Authorization": "Bearer $token",
        "content-type": "application/json"
      };
      var response = await http.get(Uri.parse(url), headers: headers);
      print(response.body);

      if (response.statusCode == 200) {
        return response.body;
      } else {
        var message = jsonDecode(response.body);
        throw new Exception(message['message']);
      }
    } on SocketException {
      throw Exception('We cannot connect, check your connection');
    } catch (e) {
      throw new Exception("Oops! Something went wrong.");
    }
  }

   Future changePassword({required oldPassword, required newPassword}) async {
    try {
      var token = await storage.read(key: 'token');
      var url = '${AppStrings.baseUrl}${AppStrings.jobApplication}';
      print(url);
      var headers = <String, String>{
        "Authorization": "Bearer $token",
        "content-type": "application/json"
      };
      var response = await http.get(Uri.parse(url), headers: headers);
      print(response.body);

      if (response.statusCode == 200) {
        return response.body;
      } else {
        var message = jsonDecode(response.body);
        throw new Exception(message['message']);
      }
    } on SocketException {
      throw Exception('We cannot connect, check your connection');
    } catch (e) {
      throw new Exception("Oops! Something went wrong.");
    }
  }
}
