import 'dart:convert';

import 'package:flutter_news_restapi/model/atricle_model.dart';
import 'package:http/http.dart';

class ApiServices {
  final endPointUrl =
      "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=ab03672b0e904b9d95d1c0c370fef436";

  Future<List<Article>> getArticle() async {
    Response res = await get(Uri.https('https://newsapi.org',
        'v2/everything?domains=wsj.com&apiKey=ab03672b0e904b9d95d1c0c370fef436'));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw ("can't get Articles");
    }
  }
}
