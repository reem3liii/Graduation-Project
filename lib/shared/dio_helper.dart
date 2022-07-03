import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://saasproject-001-site1.itempurl.com/api/',
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
  }

  static Future<Response> getUserData(
      String url, Map<String, dynamic> query, String? token) async {
    dio.options.headers = {
      'Authorization': token,
    };

    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postUserData(
      String url, Map<String, dynamic> data) async {
    return dio.post(url, data: data);
  }
}
