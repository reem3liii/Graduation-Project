import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://saasproject-001-site1.itempurl.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData(
      String url, String? token, Map<String, dynamic>? query) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData(String url, String? token,
      Map<String, dynamic> data, Map<String, dynamic>? query) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    return await dio.post(url, data: data, queryParameters: query);
  }
}
