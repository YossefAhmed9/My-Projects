import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://newsapi.org/', receiveDataWhenStatusError: true,),
    );
  }

  static getDioData({
    required String url,
    required Map<String,dynamic> query
  }) async
  {
    return await dio?.get(url, queryParameters: query);
  }
}
