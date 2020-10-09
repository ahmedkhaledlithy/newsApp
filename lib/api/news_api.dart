import 'package:http/http.dart' as http;
import 'package:flutter_newsapp_api/api/api_utilities.dart';
import 'dart:convert';
import 'package:flutter_newsapp_api/models/news_model.dart';

class NewsApi {
  Future<List<News>>FetchAllAuthors() async {
   List<News>newsapi=List<News>();
    http.Response futureNews = await http.get(base_api_url + allNews_api);

    if (futureNews.statusCode == 200) {
      var jsondata = jsonDecode(futureNews.body);
      var data = jsondata["sources"];

      for (var item in data) {
        News news = News(
            item["id"].toString(),
            item["name"].toString(),
            item["description"].toString(),
            item["url"].toString(),
            item["category"].toString(),
            item["language"].toString(),
            item["country"].toString());

        newsapi.add(news);
      }
    } else {
      throw Exception("can not load data from server");
    }
    
    return newsapi;
  }


}
