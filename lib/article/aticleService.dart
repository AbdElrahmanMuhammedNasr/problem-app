import 'package:flutter_main_app/sharedWidget/Api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class AricleService {

  // ignore: missing_return
  Future <Object> getOneArticle(String id) async{
    http.Response futurePost = await http.get(new Api().BASE_URL+"/post/getPost/"+id);
     if(futurePost.statusCode == 200){
      return json.decode(futurePost.body);
    }else{
      print("Error");
    }

  }

}