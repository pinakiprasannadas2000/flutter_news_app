import 'package:flutter/material.dart';

// screens
import '../screens/each_article.dart';

// models
import '../models/news_article_model.dart';

class EachNewsArticleTile extends StatelessWidget {
  final List<NewsArticleModel> allArticles;
  final int index;
  final String category;

  EachNewsArticleTile({@required this.allArticles, @required this.index, @required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                EachArticle(title: category, articleUrl: allArticles[index].articleUrl),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 3.0,
          ),
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 5.0,
        ),
        // height: 200,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              allArticles[index].imageUrl,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 5.0,
                vertical: 5.0,
              ),
              child: Column(
                children: [
                  Text(
                    allArticles[index].title,
                    style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    allArticles[index].description,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
