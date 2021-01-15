part of 'articles_bloc.dart';

abstract class ArticlesState extends Equatable {
  const ArticlesState();

  @override
  List<Object> get props => [];
}

class ArticlesInitial extends ArticlesState {}

class ArticlesLoadInProgress extends ArticlesState {}

class ArticlesLoadSuccess extends ArticlesState {
  final List<Article> articles;

  const ArticlesLoadSuccess({@required this.articles})
      : assert(articles != null);

  @override
  List<Object> get props => [articles];
}

class ArticlesLoadFailure extends ArticlesState {
  final dynamic err;

  ArticlesLoadFailure({@required this.err});

  List<Object> get props => [err];
}
