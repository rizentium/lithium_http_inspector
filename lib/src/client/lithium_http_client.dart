import 'package:http/http.dart' as http;
import 'package:lithium_http_inspector/src/data/http_interface.dart';
import 'package:lithium_http_inspector/src/storage/lithium_storage.dart';

class LithiumHttpClient extends http.BaseClient {
  final http.Client _inner;
  final LithiumStorage _storage;

  LithiumHttpClient(this._inner, this._storage);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    try {
      final response = await _inner.send(request);
      return response;
    } on http.ClientException catch (e) {
      if (request is http.Request) {
        final response = HttpResponseInterface(
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
          reasonPhrase: "FAILED",
          message: e.message,
        );
        await _storage.writeLog(response);
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
