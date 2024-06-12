import 'package:flutter_best_practices_bloc/core/http_client/http_client_response.dart';

abstract interface class HttpClient {
  Future<HttpResponse<T>> get<T>(String url, {Map<String, String>? headers});

  Future<HttpResponse<T>> post<T>(
    String url, {
    Map<String, String>? headers,
    dynamic body,
  });

  Future<HttpResponse<T>> put<T>(
    String url, {
    Map<String, String>? headers,
    dynamic body,
  });

  Future<HttpResponse<T>> delete<T>(String url, {Map<String, String>? headers});
}
