import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://slash-backend.onrender.com/product/?limit=20&page=1",
        receiveDataWhenStatusError: true,
        receiveTimeout: const Duration(
          seconds: 20 * 100,
        ),
        connectTimeout: const Duration(
          seconds: 20 * 100,
        ),
      ),
    );
  }

  static Future<Response> getData(
      {required String url, Map<String, dynamic>? query}) async {
    dio!.options.headers = {
    };
    return await dio!.get(url, queryParameters: query);
  }
}
