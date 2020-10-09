import 'package:http/http.dart' as http;
import 'package:flutter_newsapp_api/api/api_utilities.dart';
import 'dart:convert';
import 'package:flutter_newsapp_api/models/post_model.dart';

class PostAPI {
  Future<List<Post>> FetchAllwhatsnew() async {
    List<Post> posts = List<Post>();
    http.Response whatsnew = await http.get(base_api_url + post_whatsnew_api);
    if (whatsnew.statusCode == 200) {
      var jsondata = jsonDecode(whatsnew.body);
      var data = jsondata["articles"];

      for (var item in data) {

        posts.add(Post.fromjson(item));

      }
    } else {
      throw Exception("can not load data from server");
    }

    return posts;
  }

  Future<List<Post>> FetchAllRecentUpdates() async {
    List<Post> posts = List<Post>();
    http.Response whatsnew = await http.get(base_api_url + post_whatsnew_api);
    if (whatsnew.statusCode == 200) {
      var jsondata = jsonDecode(whatsnew.body);
      var data = jsondata["articles"];

      for (var item in data) {
        posts.add(Post.fromjson(item));

      }
    } else {
      throw Exception("can not load data from server");
    }

    return posts;
  }


  Future<List<Post>> FetchPopular() async {
    List<Post> posts = List<Post>();
    http.Response whatsnew = await http.get(base_api_url + post_whatsnew_api);
    if (whatsnew.statusCode == 200) {
      var jsondata = jsonDecode(whatsnew.body);
      var data = jsondata["articles"];

      for (var item in data) {
        posts.add(Post.fromjson(item));

      }
    } else {
      throw Exception("can not load data from server");
    }

    return posts;
  }
}
