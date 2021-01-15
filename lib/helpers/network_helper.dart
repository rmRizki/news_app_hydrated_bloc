import 'package:dio/dio.dart';
import 'package:indo_news_bloc/helpers/network_interceptor.dart';
import 'package:indo_news_bloc/utils/api.dart';

class NetworkHelper {
  Dio _dio;
  Response _response;

  NetworkHelper() {
    BaseOptions options = new BaseOptions(
      baseUrl: Api.baseURL,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    _dio = new Dio(options);

    _dio.interceptors.add(NetworkInterceptor());
  }

  Future<dynamic> get(uri) async {
    _response = await _dio.get<dynamic>(uri);

    if (_response.statusCode == 200) {
      return _response.data;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
