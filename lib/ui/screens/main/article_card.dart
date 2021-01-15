import 'package:flutter/material.dart';
import 'package:indo_news_bloc/data/models/models.dart';
import 'package:share/share.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    Key key,
    @required this.url,
    @required this.title,
    @required this.urlToImage,
    @required this.description,
  }) : super(key: key);

  final String url;
  final String title;
  final String urlToImage;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(
          context,
          '/detail',
          arguments: Article(url: url, title: title),
        ),
        child: Card(
          color: Colors.blueGrey[50],
          child: Column(
            children: <Widget>[
              Image.network('$urlToImage'),
              ListTile(
                title: Container(
                  margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Text('$title'),
                ),
                subtitle: Container(
                  child: Text('$description'),
                  margin: EdgeInsets.only(bottom: 8.0),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {
                    Share.share(
                      '$title\nlink: $url',
                      subject: 'Berita dari Indo News',
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
