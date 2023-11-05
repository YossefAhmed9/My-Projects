import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  // https://newsapi.org
  // /v2/top-headlines?
  // country=us
  // &category=business
  // &apiKey=c2fd52d2a9394fa19402f056d1b2dc21
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://newsapi.org/', receiveDataWhenStatusError: true));
  }

  static getDioData({
    required String url,
    required Map<String,dynamic> query
  }) async
  {
    return await dio?.get(url, queryParameters: query);
  }
}
