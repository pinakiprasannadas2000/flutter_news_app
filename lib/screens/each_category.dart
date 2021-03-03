import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// models
import '../models/news_article_model.dart';

// components
import '../components/each_news_article_tile.dart';

// ignore: must_be_immutable
class EachCategory extends StatefulWidget {
  final String title;

  EachCategory({@required this.title});

  @override
  _EachCategoryState createState() => _EachCategoryState();
}

class _EachCategoryState extends State<EachCategory> {
  List<NewsArticleModel> allArticles = [];

  void getNewsArticles() async {
    List<NewsArticleModel> articles = [];

    var my_api_key = env['NEWS_API_KEY'];
    String url =
        'https://newsapi.org/v2/top-headlines?category=${widget.title}&country=in&language=en&apiKey=$my_api_key';
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      /// newsArticles is the articles array in "jsonData['articles']"
      var newsArticles = jsonData['articles'];

      /// looping through the articles array
      for (int i = 0; i < newsArticles.length; i++) {
        if (newsArticles[i]['description'] != null &&
            newsArticles[i]['urlToImage'] != null) {
          NewsArticleModel currentArticle = NewsArticleModel(
              title: newsArticles[i]['title'],
              source: newsArticles[i]['source']['name'],
              description: newsArticles[i]['description'],
              articleUrl: newsArticles[i]['url'],
              imageUrl: newsArticles[i]['urlToImage'],
              content: newsArticles[i]['content']);
          articles.add(currentArticle);
        }
      }
    }
    setState(() {
      allArticles = articles;
    });
  }

  @override
  void initState() {
    super.initState();
    getNewsArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: <Widget>[
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: allArticles.length,
                  itemBuilder: (context, index) {
                    return EachNewsArticleTile(
                      allArticles: allArticles,
                      index: index,
                      category: widget.title,
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
