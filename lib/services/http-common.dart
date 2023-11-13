// ignore: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart';

const String baseUrl = 'https://perustarsapi.azurewebsites.net/api/';
final headers = {
  'Content-type': 'application/json',
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE,PATCH,OPTIONS'
};

final Dio _dio = Dio();

// POST
Future<Response> post(String url, Map<String, dynamic> body,
    [String? functionName]) async {
  try {
    Response response = await _dio.post(baseUrl + url,
        data: body, options: Options(headers: headers));

    _printWarning(response, functionName);
    return response;
  } on DioError catch (e) {
    print(e);
    return Response(
      statusCode: e.response?.statusCode,
      data: e.response?.data, 
      requestOptions: RequestOptions(),
    );
  }
}

// PUT
Future<Response> put(String url, Map<String, dynamic> body,
    [String? functionName]) async {
  try {
    Response response = await _dio.put(baseUrl + url,
        data: body, options: Options(headers: headers));

    _printWarning(response, functionName);
    return response;
  } on DioError catch (e) {
    print(e);
    return Response(
      statusCode: e.response?.statusCode,
      data: e.response?.data,
      requestOptions: RequestOptions()
    );
  }
}

// GET
Future<Response> get(String url, [String? functionName]) async {
  try {
    Response response =
        await _dio.get(baseUrl + url, options: Options(headers: headers));

    _printWarning(response, functionName);
    return response;
  } on DioError catch (e) {
    print(e);
    return Response(
      statusCode: e.response?.statusCode,
      data: e.response?.data,
      requestOptions: RequestOptions()
    );
  }
}

// DELETE
Future<Response> delete(String url, [String? functionName]) async {
  try {
    Response response =
        await _dio.delete(baseUrl + url, options: Options(headers: headers));

    _printWarning(response, functionName);
    return response;
  } on DioError catch (e) {
    print(e);
    return Response(
      statusCode: e.response?.statusCode,
      data: e.response?.data,
      requestOptions: RequestOptions()
    );
  }
}

_printWarning(Response response, [String? functionName]) {
  if (response.statusCode != 200) {
    print(
        'Warning${functionName == null ? '' : ' in function ${functionName}'}: status code: ${response.statusCode}, message: ${response.data}');
  }
}
