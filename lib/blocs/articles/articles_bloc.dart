import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:indo_news_bloc/data/models/models.dart';
import 'package:indo_news_bloc/data/repositories/repositories.dart';

part 'articles_event.dart';
part 'articles_state.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState>
    with HydratedMixin {
  final ArticlesRepository articlesRepository;

  ArticlesBloc({@required this.articlesRepository})
      : assert(articlesRepository != null),
        super(ArticlesInitial()) {
    hydrate();
  }

  @override
  Stream<ArticlesState> mapEventToState(ArticlesEvent event) async* {
    if (event is ArticlesRequested) {
      yield* _mapArticlesRequestedToState(event);
    }
  }

  Stream<ArticlesState> _mapArticlesRequestedToState(
    ArticlesRequested event,
  ) async* {
    yield ArticlesLoadInProgress();
    try {
      final Articles articles = await articlesRepository.fetchTopHeadlines();
      yield ArticlesLoadSuccess(articles: articles.articles);
    } catch (err) {
      print(err);
      yield ArticlesLoadFailure(err: err);
    }
  }

  List<T> _jsonToList<T>(json, fromJson) {
    List<T> list =
        json != null ? List<T>.from(json.map((x) => fromJson(x))) : [];
    return list;
  }

  @override
  ArticlesState fromJson(Map<String, dynamic> json) {
    if (json['articles'] != null) {
      return ArticlesLoadSuccess(
          articles: _jsonToList<Article>(
              json['articles'], (x) => Article.fromJson(x)));
    } else {
      return ArticlesInitial();
    }
  }

  @override
  Map<String, dynamic> toJson(ArticlesState state) {
    if (state is ArticlesLoadSuccess) {
      Map<String, dynamic> stateValue = {
        'articles': state.articles != null
            ? List<dynamic>.from(state.articles.map((x) => x.toJson()))
            : null
      };
      return stateValue;
    } else {
      return null;
    }
  }
}
