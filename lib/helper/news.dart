
import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_api/models/article.dart';
import 'dart:convert';

import 'package:news_app_api/secret.dart';

class News {
 static const int TIME_OUT_DURATION = 20;
  List<Article> news  = [];


  Future<void> getNews() async{


      String url = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=${apiKey}";


         var response = await http.get(url).timeout(Duration(seconds: TIME_OUT_DURATION));
         if (response.statusCode != 200) throw HttpException('${response.statusCode}');
         var jsonData = jsonDecode(response.body);


    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){
        if(element['urlToImage'] != null && element['description'] != null){
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
              publishedAt:element['publishedAt']

          );
          news.add(article);
        }

      });
    }


  }
  getSearchNews(String query) async{
    print(query);
    List<Article> news1  = [];
    String url = "https://newsapi.org/v2/everything?q=$query&from=2021-06-16&sortBy=publishedAt&apiKey=${apiKey}";
      var response = await http.get(url);

      var jsonData = jsonDecode(response.body);

      if (jsonData['status'] == "ok") {
        jsonData["articles"].forEach((element) {
          if (element['urlToImage'] != null && element['description'] != null) {
            Article article = Article(
              title: element['title'],
              author: element['author'],
              description: element['description'],
              urlToImage: element['urlToImage'],
              publshedAt: DateTime.parse(element['publishedAt']),
              content: element["content"],
              articleUrl: element["url"],

            );
            news1.add(article);
          }
        });
      }

      return news1;

  }


}


class NewsForCategorie {

  List<Article> news  = [];

  Future<void> getNewsForCategory(String category) async{
    /*String url = "https://newsapi.org/v2/everything?q=$category&apiKey=${apiKey}";*/
    String url = "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=${apiKey}";
    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);
        }

      });
    }


  }


}