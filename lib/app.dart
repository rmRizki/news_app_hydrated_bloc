import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indo_news_bloc/utils/routes.dart';

import 'blocs/blocs.dart';
import 'data/providers/providers.dart';
import 'data/repositories/repositories.dart';
import 'helpers/network_helper.dart';

class App extends StatelessWidget {
  final articlesRepository = ArticlesRepository(
    articlesProvider: ArticlesProvider(
      networkHelper: NetworkHelper(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ArticlesBloc>(
      create: (context) => ArticlesBloc(
        articlesRepository: articlesRepository,
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: appRoutes,
        title: 'Indo News',
      ),
    );
  }
}
