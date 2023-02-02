import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:lithium_http_inspector/src/storage/lithium_storage.dart';
import 'package:lithium_http_inspector/src/storage/lithium_storage_interface.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../data/storage.dart';
@GenerateNiceMocks([MockSpec<File>()])
import 'lithium_storage_test.mocks.dart';

void main() {
  final mockFile = MockFile();
  when(mockFile.path).thenReturn('/mock/directory/lithium_log.json');

  when(mockFile.readAsString()).thenAnswer(
    (_) => Future.delayed(const Duration(seconds: 1), () => mockFileResponse),
  );

  final lithiumStorage = LithiumStorage(mockFile);

  test('File should be read correctly', () async {
    final expectation = LithiumStorageInterface(data: null, config: null);
    identical(await lithiumStorage.readLog(), expectation);
  });
}
