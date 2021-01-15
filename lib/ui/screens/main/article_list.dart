import 'package:flutter/material.dart';
import 'package:indo_news_bloc/data/models/models.dart';
import 'package:indo_news_bloc/ui/screens/main/article_card.dart';

class ArticleList extends StatelessWidget {
  final List<Article> articles;

  const ArticleList({Key key, this.articles}) : super(key: key);

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (BuildContext context, int index) {
        final title = articles[index].title;
        final description = articles[index].description;
        final url = articles[index].url;
        final urlToImage = articles[index].urlToImage;
        return ArticleCard(
          url: url,
          title: title,
          urlToImage: urlToImage,
          description: description,
        );
      },
    );
  }
}
