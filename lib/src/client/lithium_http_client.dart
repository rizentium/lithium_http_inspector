import 'dart:convert';

import 'package:http/http.dart';
import 'package:lithium_http_inspector/src/data/http_interface.dart';
import 'package:lithium_http_inspector/src/storage/lithium_storage.dart';

class LithiumHttpClient extends BaseClient {
  final Client _inner;
  final LithiumStorage _storage;

  LithiumHttpClient(this._inner, this._storage);

  @override
  Future<Response> head(Uri url, {Map<String, String>? headers}) =>
      _sendUnstreamed('HEAD', url, headers);

  @override
  Future<Response> get(Uri url, {Map<String, String>? headers}) =>
      _sendUnstreamed('GET', url, headers);

  @override
  Future<Response> post(Uri url,
          {Map<String, String>? headers, Object? body, Encoding? encoding}) =>
      _sendUnstreamed('POST', url, headers, body, encoding);

  @override
  Future<Response> put(Uri url,
          {Map<String, String>? headers, Object? body, Encoding? encoding}) =>
      _sendUnstreamed('PUT', url, headers, body, encoding);

  @override
  Future<Response> patch(Uri url,
          {Map<String, String>? headers, Object? body, Encoding? encoding}) =>
      _sendUnstreamed('PATCH', url, headers, body, encoding);

  @override
  Future<Response> delete(Uri url,
          {Map<String, String>? headers, Object? body, Encoding? encoding}) =>
      _sendUnstreamed('DELETE', url, headers, body, encoding);

  Future<Response> _sendUnstreamed(
      String method, Uri url, Map<String, String>? headers,
      [Object? body, Encoding? encoding]) async {
    var request = Request(method, url);

    if (headers != null) request.headers.addAll(headers);
    if (encoding != null) request.encoding = encoding;
    if (body != null) {
      if (body is String) {
        request.body = body;
      } else if (body is List) {
        request.bodyBytes = body.cast<int>();
      } else if (body is Map) {
        request.bodyFields = body.cast<String, String>();
      } else {
        throw ArgumentError('Invalid request body "$body".');
      }
    }

    var log = HttpResponseInterface(
      request: HttpRequestInterface(
        headers: request.headers,
        method: request.method,
        uri: request.url,
        body: request.body,
        bodyBytes: request.bodyBytes,
        contentLength: request.contentLength,
        finalized: request.finalized,
        maxRedirects: request.maxRedirects,
        persistentConnection: request.persistentConnection,
      ),
    );

    try {
      final response = await Response.fromStream(await send(request));

      log = log.copyWith(
        bodyBytes: response.bodyBytes,
        body: response.body,
        contentLength: response.contentLength,
        headers: response.headers,
        isRedirect: response.isRedirect,
        persistentConnection: response.persistentConnection,
        reasonPhrase: response.reasonPhrase,
      );
      _storage.writeLog(log);
      return response;
    } on ClientException catch (e) {
      log = log.copyWith(
        reasonPhrase: "FAILED",
        message: e.message,
      );
      _storage.writeLog(log);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    return _inner.send(request);
  }
}
