import 'dart:convert';

import 'package:flutter_best_practices_bloc/core/http_client/http_client.dart';
import 'package:flutter_best_practices_bloc/core/http_client/http_client_response.dart';
import 'package:http/http.dart' as http;

class HttpClientImpl implements HttpClient {
  HttpClientImpl(this._client);

  final http.Client _client;

  @override
  Future<HttpResponse<T>> get<T>(
    String url, {
    Map<String, String>? headers,
  }) async {
    final response = await _client.get(Uri.parse(url), headers: headers);
    return _convertResponse(response);
  }

  @override
  Future<HttpResponse<T>> post<T>(
    String url, {
    Map<String, String>? headers,
    dynamic body,
  }) async {
    final response = await _client.post(
      Uri.parse(url),
      headers: headers,
      body: body != null ? json.encode(body) : null,
    );
    return _convertResponse(response);
  }

  @override
  Future<HttpResponse<T>> put<T>(
    String url, {
    Map<String, String>? headers,
    dynamic body,
  }) async {
    final response = await _client.put(
      Uri.parse(url),
      headers: headers,
      body: body != null ? json.encode(body) : null,
    );
    return _convertResponse(response);
  }

  @override
  Future<HttpResponse<T>> delete<T>(
    String url, {
    Map<String, String>? headers,
  }) async {
    final response = await _client.delete(Uri.parse(url), headers: headers);
    return _convertResponse(response);
  }

  HttpResponse<T> _convertResponse<T>(http.Response response) {
    return HttpResponse(
      statusCode: response.statusCode,
      body: jsonDecode(response.body) as T,
    );
  }
}
