import 'dart:convert';

import 'package:flutter_main_app/sharedWidget/Api.dart';
import 'package:http/http.dart' as http;

class AddService {
  Future<bool> addNewpost(dynamic article) async {
    http.Response response = await http.post(
        new Api().BASE_URL + "/post/addNewPost",
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          "userId": article['userId'],
          "title": article['title'],
          "description": article['description'],
          "problem": article['problem'],
          "solution": article['solution'],
          "category": article['category'],
        }));
    if (response.statusCode == 200) {
      return true;
    } else {
      print("Error");
      return false;
    }
  }
}
