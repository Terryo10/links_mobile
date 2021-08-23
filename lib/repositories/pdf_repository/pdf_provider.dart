import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:links_app/data/strings.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;

class PDFProvider {
  PDFProvider();
  Future upload({required File selectedfile, required token}) async {
    var url = '${AppStrings.baseUrl}${AppStrings.cvUrl}';
    print(token);
    try {
      print(url);
      var response = http.MultipartRequest(
        'POST',
        Uri.parse(url),
      );
      Map<String, String> headers = {
        "Authorization": "Bearer $token",
        "Content-type": "multipart/form-data"
      };

      response.headers['Authorization'] = 'Bearer $token';
      response.headers['content-type'] = 'application/json';
      response.files.add(
        http.MultipartFile(
          'file',
          selectedfile.readAsBytes().asStream(),
          selectedfile.lengthSync(),
          filename: selectedfile.path,
          // contentType: MediaType('image','jpeg'),
        ),
      );
      var res = await response.send();
      final k = await http.Response.fromStream(res);
      print(k.body);
      print(res.headers);
      print(res.statusCode);
      if (k.statusCode == 200) {
        print(k.body);
        return k.body;
      } else {
        var decoded = jsonDecode(k.body);
        var message = decoded['message'];
        throw Exception(message);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
