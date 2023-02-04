import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:lithium_http_inspector/src/data/http_interface.dart';

import 'lithium_storage_interface.dart';

class LithiumStorage {
  final File _localFile;

  LithiumStorage(File localFile) : _localFile = localFile;

  Future<LithiumStorageInterface?> readStorage() async {
    try {
      final contents = await _localFile.readAsString();
      return LithiumStorageInterface.fromJson(jsonDecode(contents));
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<File> writeLog(HttpResponseInterface payload) async {
    final currentStorage = await readStorage();
    final data = [payload, ...?currentStorage?.data];

    final itemStorage = LithiumStorageInterface(
      data: data,
      config: currentStorage?.config,
    );

    return _localFile.writeAsString(
      json.encode(itemStorage.toJson()),
      flush: true,
    );
  }
}
