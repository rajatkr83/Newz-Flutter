import 'dart:convert';
import 'news_data.dart';
import 'package:http/http.dart' as http;

class News {
  

    List<NewsData> news = [];

  Future<void> getNews() async {

    var url = Uri.parse("https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=44941fff5f3c4310a872002b5eeedd2d"); 

    var response = await http.get(url);

    var decode = jsonDecode(response.body);


    if(decode['status'] == 'ok') {
      decode["articles"].forEach((element){

        if (element['urlToImage'] != null && element['title'] != null && element['description'] != null) {

          NewsData ndata = NewsData(
            title: element['title'],
            author: element['author'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            description: element['description'],
            content: element['content'],
            publishedAt: element['publishAt'],
          );

          news.add(ndata);
        }

      });
    }
  }

}




class CategoryNews {
  

    List<NewsData> news = [];

  Future<void> getCategoryNews(String category) async {

    var url = Uri.parse("https://newsapi.org/v2/top-headlines?category=$category&country=in&category=business&apiKey=44941fff5f3c4310a872002b5eeedd2d"); 

    var response = await http.get(url);

    var decode = jsonDecode(response.body);


    if(decode['status'] == 'ok') {
      decode["articles"].forEach((element){

        if (element['urlToImage'] != null && element['title'] != null && element['description'] != null) {

          NewsData ndata = NewsData(
            title: element['title'],
            author: element['author'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            description: element['description'],
            content: element['content'],
            publishedAt: element['publishAt'],
          );

          news.add(ndata);
        }

      });
    }
  }

  }
