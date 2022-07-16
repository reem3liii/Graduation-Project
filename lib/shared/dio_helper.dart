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

  static Future<Response> getDataWithAuth(
      String url, String token, Map<String, dynamic>? query) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> getDataWithoutAuth(
      String url, Map<String, dynamic>? query) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
    };

    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postDataWithAuth(String url, String token,
      dynamic data, Map<String, dynamic>? query) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    return await dio.post(url, data: data, queryParameters: query);
  }

  static Future<Response> postDataWithoutAuth(String url,
      dynamic data, Map<String, dynamic>? query) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
    };
    return await dio.post(url, data: data, queryParameters: query);
  }

  /*static Future<Response> updateDataWithAuth(String url, String token,  Map<String,dynamic> query,
      dynamic data,) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    return await dio.put(url, data: data, queryParameters: query);
  }*/

  static Future<Response> deleteDataWithAuth(String url, String token,
      dynamic data, Map<String, dynamic>? query) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    return await dio.delete(url, data: data, queryParameters: query);
  }

}
