import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class NetworkClient {
  http.Client? _client;

  String get baseUrl;

  NetworkClient() {
    _createClient();
  }

  /// Get the http client instance, create a new one if isn't created.
  http.Client get client {
    if (_client == null) {
      _createClient();
    }
    return _client!;
  }

  /// Create a new http client and assign it to [_client].
  void _createClient() {
    final http.Client innerClient = http.Client();

    /// Setup any interceptors, certificates, and other configurations of http
    /// client here.

    _client = innerClient;
  }

  /// Send a GET request to the server.
  Future<http.Response> get({
    required String path,
    Map<String, String>? headers,
  }) async {
    final http.Response response = await _sendRequest(
      url: '$baseUrl$path',
      method: 'GET',
      headers: headers,
    );

    return response;
  }

  /// Post request
  Future<http.Response> post({
    required String path,
    Map<String, String>? headers,
    Object? body,
  }) async {
    final http.Response response = await _sendRequest(
      url: '$baseUrl$path',
      method: 'POST',
      headers: headers,
      body: body,
    );

    return response;
  }

  /// Put request
  Future<http.Response> put({
    required String path,
    Map<String, String>? headers,
    Object? body,
  }) async {
    final http.Response response = await _sendRequest(
      url: '$baseUrl$path',
      method: 'PUT',
      headers: headers,
      body: body,
    );

    return response;
  }

  /// Delete request
  Future<http.Response> delete({
    required String path,
    Map<String, String>? headers,
  }) async {
    final http.Response response = await _sendRequest(
      url: '$baseUrl$path',
      method: 'DELETE',
      headers: headers,
    );

    return response;
  }

  /// Generic method to send requests and tackle any exception regarding with
  /// the request.
  Future<http.Response> _sendRequest({
    required String url,
    required String method,
    Map<String, String>? headers,
    Object? body,
  }) async {
    try {
      final http.Request request = http.Request(method, Uri.parse(url))
        ..headers.addAll(headers ?? {});

      if (body != null) {
        request.body = jsonEncode(body);
      }

      /// we can create even a new method to handle the response as a Stream with
      /// more details
      final response = await client.send(request).then(
            http.Response.fromStream,
          );

      return response;
    } on Exception {
      /// Handle multiple requests exceptions
      rethrow;
    }
  }
}
