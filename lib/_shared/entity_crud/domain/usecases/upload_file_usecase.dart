import 'dart:typed_data';
import 'package:dartz/dartz.dart';
import 'package:grocery_template/_core/entity_crud/domain/repositories/i_crud_file_repository.dart';
import 'package:grocery_template/_core/status.dart';
import 'package:grocery_template/_core/usecase/usecase.dart';

// class UploadFileUseCase extends StreamUseCase<Status, FileUploadUseCaseParams> {
//   final ICrudFileRepository repository;
//   final List<String>? pathArgs;
//
//   UploadFileUseCase(this.repository, {this.pathArgs});
//
//   @override
//   Stream<Either<Failure, Status>> call(FileUploadUseCaseParams params) {
//     return repository.uploadFile(params.file, params._fileName,
//         pathArgs: params.pathArgs ?? pathArgs);
//   }
// }
//
// class FileUploadUseCaseParams {
//   final Uint8List? _file;
//   final String _fileName;
//   final List<String>? pathArgs;
//
//   FileUploadUseCaseParams.withPlatformFile(PlatformFile file, {this.pathArgs})
//       : _file = file.bytes,
//         _fileName = file.name;
//
//   Uint8List? get file => _file;
// }
