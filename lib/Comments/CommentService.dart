import 'package:flutter_main_app/sharedWidget/Api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CommentService {
  Future<List> getSomeComment(String id, String number) async {
    http.Response futureComments = await http
        .get(new Api().BASE_URL + "/comment/getComments/" + id + "/" + number);
    if (futureComments.statusCode == 200) {
      return json.decode(futureComments.body);
    } else {
      print("Error");
      return null;
    }
  }
}
