import 'package:flutter/foundation.dart';
import 'package:indo_news_bloc/data/models/models.dart';
import 'package:indo_news_bloc/helpers/network_helper.dart';
import 'package:indo_news_bloc/utils/api.dart';

class ArticlesProvider {
  final NetworkHelper networkHelper;
  ArticlesProvider({@required this.networkHelper});

  Future<Articles> fetchTopHeadlines() async {
    var uri = '${Api.topHeadlines}?country=${Api.country}&apiKey=${Api.apiKey}';
    return Articles.fromJson(await networkHelper.get(uri));
  }
}
