import 'package:dio/dio.dart';

// TODO:This_file_must_be_in_a_connectivity_or_providers_folder
abstract class HttpCommon {
  final String _baseUrl = "https://perustarsdddapi.azurewebsites.net";
  final Map<String, String> _headers = const {
    'Content-type': 'application/json',
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE,PATCH,OPTIONS'
  };
  late final Dio _dio;
  late final Options _options;
  HttpCommon() {
    _dio = Dio(BaseOptions(
      baseUrl: _baseUrl, 
      responseType: ResponseType.json,
      contentType: "application/json"
    ));
    _options = Options(headers: _headers);
  }

  Future<Response<T>> get<T>(String url) async {
    try {
      Response<T> response = await _dio.get(url, options: _options);
      return response;
    } on DioError catch (e) {
      return Response(
        statusCode: e.response?.statusCode,
        data: e.response?.data
      );
    }
  }
  Future<Response<T>> post<T>(String url, Map<String, dynamic> body) async {
    try {
      Response<T> response = await _dio.post(url, data: body, options: _options);
      return response;
    } on DioError catch(e) {
      return Response(
        statusCode: e.response?.statusCode,
        data: e.response?.data
      );
    }
  }

  Future<Response<T>> put<T>(String url, Map<String, dynamic> body) async {
    try {
      Response<T> response = await _dio.put(url, data: body, options: _options);
      return response;
    } on DioError catch(e) {
      return Response(
        statusCode: e.response?.statusCode,
        data: e.response?.data
      );
    }
  }

  Future<Response<T>> patch<T>(String url, Map<String, dynamic>? body) async {
    try {
      Response<T> response = await _dio.patch(url, data: body, options: _options);
      return response;
    } on DioError catch(e) {
      return Response(
        statusCode: e.response?.statusCode,
        data: e.response?.data
      );
    }
  }

  Future<Response<T>> delete<T>(String url) async {
    try {
      Response<T> response = await _dio.delete(url, options: _options);
      return response;
    } on DioError catch(e) {
      return Response(
        statusCode: e.response?.statusCode,
        data: e.response?.data
      );
    }
  }
}