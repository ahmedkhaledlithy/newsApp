import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_newsapp_api/models/category_api_model.dart';
import 'package:flutter_newsapp_api/api/api_utilities.dart';

class CategoriesAPI {
  Future<List<Category>> fetchAllCategories() async {
    List<Category> catigories = List<Category>();
    http.Response category = await http.get(base_api_url + allNews_api);

    if (category.statusCode == 200) {
      var jsondata = jsonDecode(category.body);
      var data = jsondata["sources"];
      for (var item in data) {
        Category cat = Category(item["id"].toString(), item["category"].toString());

        catigories.add(cat);
        print(cat.category);
      }
    } else {
      throw Exception("can not load data from server");
    }

    return catigories;
  }


}
