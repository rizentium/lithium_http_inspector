part of lithium_http_inspector;

class LithiumHttpInspector extends LithiumHttpInspectorPlatform {
  final LithiumStorage _storage;

  LithiumHttpInspector._(this._storage);

  static Future<LithiumHttpInspector> initialize({File? storageFile}) async {
    final file = storageFile ?? await _defaultLocalFile;
    final LithiumStorage storage = LithiumStorage(file);

    return LithiumHttpInspector._(storage);
  }

  static Future<File> get _defaultLocalFile async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/lithium_log.json');
  }

  @override
  http.BaseClient httpClient(http.Client client) {
    return LithiumHttpClient(client, _storage);
  }

  @override
  Future<List<HttpResponseInterface>?> find() async {
    final storage = await _storage.readStorage();
    return storage?.data;
  }

  @override
  Future<bool> destroy() async {
    final status = await _storage.clear();
    final exist = await status.exists();

    return !exist;
  }
}
