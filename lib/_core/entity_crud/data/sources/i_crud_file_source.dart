import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

/// data source for handling file related operations
abstract class ICrudFileSource {
  final String rootPath;

  ICrudFileSource(this.rootPath);

  Stream<TaskSnapshot> uploadFile(Uint8List file, String fileName,
      {List<String>? pathArgs, Map<String, String>? extraData});

  Future<String> getFile(
    String filePath,
  );

//TODO add other CRUD operations
}
