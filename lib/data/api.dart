import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:news_app/data/news_model.dart';
import 'package:news_app/data/result_api.dart';

class Api {
  static Future<Result<NewsModel>> getNews() async {
    try {
      var url = Uri.https('newsapi.org', '/v2/everything', {
        "q": "bitcoin",
        "apiKey": "7ad658a02e214651ae8a230f5a3e514c",
      });
      var response = await http.get(url);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        var responseBody = response.body;
        var json = jsonDecode(responseBody);

        return Success(NewsModel.fromJson(json));
      } else {
        return Error("Error From Server");
      }
    } on SocketException {
      return Error("Error in internet. Try again....");
    } catch (e) {
      return Error("Error $e");
    }
  }
}

//https://newsapi.org/v2/everything?q=bitcoin&apiKey=7ad658a02e214651ae8a230f5a3e514c
