import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:indo_news_bloc/data/models/models.dart';
import 'package:indo_news_bloc/data/providers/providers.dart';

class ArticlesRepository {
  final ArticlesProvider articlesProvider;

  ArticlesRepository({@required this.articlesProvider});

  Future<Articles> fetchTopHeadlines() {
    return articlesProvider.fetchTopHeadlines();
  }
}
