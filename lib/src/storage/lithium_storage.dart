import 'dart:convert';
import 'dart:io';

import 'package:lithium_http_inspector/src/storage/lithium_storage_interface.dart';

class LithiumStorage {
  final File _localFile;

  LithiumStorage(File localFile) : _localFile = localFile;

  Future<LithiumStorageInterface?> readLog() async {
    try {
      final contents = await _localFile.readAsString();
      return LithiumStorageInterface.fromJson(jsonDecode(contents));
    } catch (e) {
      return null;
    }
  }

  Future<File> writeLog(String log) async {
    final file = _localFile;
    return file.writeAsString(log);
  }
}
