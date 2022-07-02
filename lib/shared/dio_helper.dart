import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://emanmo1-001-site1.btempurl.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getUserData(
      String url, Map<String, dynamic> query, String? token) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> getAllUsers(String url, String? token) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    return await dio.get(url);
  }

  static Future<Response> postUserData(
      String url, Map<String, dynamic> data) async {
    return dio.post(url, data: data);
  }
}
