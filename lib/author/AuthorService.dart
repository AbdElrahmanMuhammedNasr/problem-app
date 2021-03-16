import 'package:flutter_main_app/sharedWidget/Api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AutherService {
  Future<Object> getOneUser(String id) async {
    http.Response futureUser =
        await http.get(new Api().BASE_URL + "/user/getUser/" + id);
    if (futureUser.statusCode == 200) {
      return json.decode(futureUser.body);
    } else {
      print("Error");
      return null;
    }
  }

  Future<List> getUserPosts(String id) async {
    http.Response futureUser =
        await http.get(new Api().BASE_URL + "/post/getUserPosts/" + id);
    if (futureUser.statusCode == 200) {
      return json.decode(futureUser.body);
    } else {
      print("Error");
      return null;
    }
  }

  Future<bool> deletePost(String id) async {
    http.Response deletePost =
        await http.delete(new Api().BASE_URL + "/post/deletePost/" + id);
    if (deletePost.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
