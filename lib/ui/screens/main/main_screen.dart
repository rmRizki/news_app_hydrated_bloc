import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:indo_news_bloc/blocs/blocs.dart';
import 'package:indo_news_bloc/ui/screens/main/article_list.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        leading: Icon(FontAwesomeIcons.solidNewspaper),
        title: Text('Indo News'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            onPressed: () {
              context.bloc<ArticlesBloc>().add(ArticlesRequested());
            },
          )
        ],
      ),
      body: BlocBuilder<ArticlesBloc, ArticlesState>(
        builder: (context, state) {
          if (state is ArticlesInitial) {
            context.bloc<ArticlesBloc>().add(ArticlesRequested());
          }
          if (state is ArticlesLoadInProgress) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is ArticlesLoadFailure) {
            return Center(child: Text('Gagal Memuat Artikel...\n${state.err}'));
          }
          if (state is ArticlesLoadSuccess) {
            final articles = state.articles;
            return ArticleList(articles: articles);
          }
          return Container();
        },
      ),
    );
  }
}
