import 'package:dio/dio.dart';

// TODO:This_file_must_be_in_a_connectivity_or_providers_folder
abstract class HttpCommon {
  final String _baseUrl = "https://perustarsdddapi.azurewebsites.net";
  late final Dio _dio;
  HttpCommon() {
    _dio = Dio(BaseOptions(
      baseUrl: _baseUrl, 
      responseType: ResponseType.json,
      contentType: "application/json"
    ));
  }

  Future<Response<T>> get<T>(String url, { String? token }) async {
    try {
      Response<T> response = await _dio.get(url, 
      options: Options(headers: token != null ? { "Authorization": token}: {}));
      return response;
    } on DioError catch (e) {
      return Response(
        statusCode: e.response?.statusCode,
        data: e.response?.data
      );
    }
  }
  Future<Response<T>> post<T>(String url, Map<String, dynamic> body, { String? token }) async {
    try {
      Response<T> response = await _dio.post(url, data: body,
      options: Options(headers: token != null ? { "Authorization": token}: {}));
      return response;
    } on DioError catch(e) {
      return Response(
        statusCode: e.response?.statusCode,
        data: e.response?.data
      );
    }
  }

  Future<Response<T>> put<T>(String url, Map<String, dynamic> body, { String? token }) async {
    try {
      Response<T> response = await _dio.put(url, data: body,
      options: Options(headers: token != null ? { "Authorization": token}: {}));
      return response;
    } on DioError catch(e) {
      return Response(
        statusCode: e.response?.statusCode,
        data: e.response?.data
      );
    }
  }

  Future<Response<T>> patch<T>(String url, Map<String, dynamic>? body, { String? token }) async {
    try {
      Response<T> response = await _dio.patch(url, data: body,
      options: Options(headers: token != null ? { "Authorization": token}: {}));
      return response;
    } on DioError catch(e) {
      return Response(
        statusCode: e.response?.statusCode,
        data: e.response?.data
      );
    }
  }

  Future<Response<T>> delete<T>(String url, { String? token }) async {
    try {
      Response<T> response = await _dio.delete(url,
      options: Options(headers: token != null ? { "Authorization": token}: {}));
      return response;
    } on DioError catch(e) {
      return Response(
        statusCode: e.response?.statusCode,
        data: e.response?.data
      );
    }
  }
}