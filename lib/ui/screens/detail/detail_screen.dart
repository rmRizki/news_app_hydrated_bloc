import 'package:flutter/material.dart';
import 'package:indo_news_bloc/data/models/models.dart';
import 'package:share/share.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    Article article = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Indo News'),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.share,
              color: Colors.white,
            ),
            onPressed: () {
              Share.share(
                '${article.title}\nlink: ${article.url}',
                subject: 'Berita dari Indo News',
              );
            },
          )
        ],
      ),
      body: WebView(
        initialUrl: article.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
