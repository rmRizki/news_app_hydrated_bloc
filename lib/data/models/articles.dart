import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'articles.g.dart';

class Articles extends Equatable {
  final List<Article> articles = [];

  Articles.fromJson(Map<String, dynamic> json) {
    json['articles'].forEach((json) {
      articles.add(Article.fromJson(json));
    });
  }

  @override
  List<Object> get props => [articles];
}

@JsonSerializable()
class Article extends Equatable {
  final String title, description, url, urlToImage;

  Article({this.title, this.description, this.url, this.urlToImage});

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);

  @override
  List<Object> get props => [title, description, url, urlToImage];
}
