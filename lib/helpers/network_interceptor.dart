import 'package:dio/dio.dart';

class NetworkInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options) {
    print('Endpoint: ${options.uri}');
    return super.onRequest(options);
  }

  @override
  Future onError(DioError err) {
    print('Dio Error: ${err.message}');
    return super.onError(err);
  }

  @override
  Future onResponse(Response response) {
    print('Response Status: ${response.statusCode}');
    print('Response Data: ${response.data}');
    return super.onResponse(response);
  }
}
