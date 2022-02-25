// import 'dart:typed_data';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:grocery_template/_core/entity_crud/data/sources/i_crud_file_source.dart';
// import 'package:grocery_template/_shared/di/dependency_injection.dart';
// import 'package:grocery_template/app/extra/app_constants.dart';
// import 'package:path/path.dart';

// class CrudFileSourceFirebase extends ICrudFileSource {
//   final FirebaseStorage _firebaseStorage;
//
//   CrudFileSourceFirebase(this._firebaseStorage, {String? rootPath})
//       : super(rootPath ?? StoragePaths.adminRoot);
//
//   Reference get root => _firebaseStorage.ref(rootPath);
//
//   Reference collectionBuilderWithList(List<String>? pathArgs) {
//     var col = root;
//     (pathArgs ?? []).forEach((element) {
//       col = collectionBuilder(element, col);
//     });
//     return col;
//   }
//
//   Reference collectionBuilder(String? pathArgs, Reference collectionReference) {
//     if (pathArgs != null) return collectionReference.child(pathArgs);
//     return collectionReference;
//   }
//
//   @override
//   Stream<TaskSnapshot> uploadFile(Uint8List file, String fileName,
//       {List<String>? pathArgs, Map<String, String>? extraData}) {
//     String? mimeType = mime(basename(fileName));
//     extraData ??= {};
//     extraData['fileName'] = fileName;
//     final metaData =
//         SettableMetadata(contentType: mimeType, customMetadata: extraData);
//     pathArgs ??= [];
//     final serverFileName = sharedSL<Uuid>().v1() + extension(fileName);
//     pathArgs.add(serverFileName);
//     final uTask = collectionBuilderWithList(pathArgs).putData(file, metaData);
//     return uTask.snapshotEvents;
//   }
//
//   @override
//   Future<String> getFile(String filePath) {
//     return _firebaseStorage.ref(filePath).getDownloadURL();
//   }
// }
