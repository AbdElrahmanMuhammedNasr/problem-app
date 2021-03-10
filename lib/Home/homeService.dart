import 'dart:convert';

import 'package:flutter_main_app/sharedWidget/Api.dart';
import 'package:http/http.dart' as http;

class HomeService {
  Future<List> getSomePost() async {
    http.Response futurePosts =
        await http.get(new Api().BASE_URL + "/post/getSomePosts");

    if (futurePosts.statusCode == 200) {
      return json.decode(futurePosts.body);
    } else {
      print("Error");
      return null;
    }
  }
  // get using category
   Future<List> getSomePostUsingCatgory(String category) async {
    http.Response futurePosts =
        await http.get(new Api().BASE_URL + "/post/getSomePostsUsingCategory/"+category);

    if (futurePosts.statusCode == 200) {
      return json.decode(futurePosts.body);
    } else {
      print("Error");
            return null;

    }
  }
}
