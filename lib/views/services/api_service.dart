import 'dart:convert';

import 'package:blog_list/views/models/news_model.dart';
import 'package:http/http.dart' as http;

class NewsApi {
  final endPointUrl = "newsapi.org";
  final client = http.Client();

  Future<List<Article>> getArticle() async {
    // https://newsapi.org/v2/everything?q=apple&from=2022-09-10&to=2022-09-10&sortBy=popularity&apiKey=3addc171dd0a4ac09187655128fd0456
    final queryParameters = {
      'q': 'apple',
      'from': '2022-09-10',
      'to': '2022-09-10',
      'sortBy': 'popularity',
      'apiKey': '3addc171dd0a4ac09187655128fd0456'
    };
    final uri = Uri.https(endPointUrl, '/v2/everything', queryParameters);
    final response = await client.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['articles'];
    // print(body);
    List<Article> articles =
        body.map((dynamic item) => Article.fromJson(item)).toList();
    return articles;
  }
}
