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
      print(res.headers);
      print(res.statusCode);
      if (res.statusCode == 200) {
        print(res.toString());
        return res;
        //print response from server
      } else {
        throw Exception(res);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
