import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:grocery_template/_core/entity_crud/data/sources/i_crud_file_source.dart';
import 'package:grocery_template/_core/entity_crud/domain/repositories/i_crud_file_repository.dart';
import 'package:grocery_template/_core/status.dart';

class CrudFileRepository extends ICrudFileRepository {
  CrudFileRepository(ICrudFileSource dataSource) : super(dataSource);

  @override
  Stream<Either<Failure, Status>> uploadFile(Uint8List? file, String fileName,
      {List<String>? pathArgs, Map<String, String>? extraData}) async* {
    try {
      if (file == null) {
        yield const Left(Failure(message: 'Invalid file data'));
      } else {
        yield* dataSource
            .uploadFile(file, fileName,
                pathArgs: pathArgs, extraData: extraData)
            .map((event) => event.state == TaskState.error
                ? Left(Failure(message: event.toString()))
                : (event.state == TaskState.success
                    ? Right(Success(message: event.ref.fullPath))
                    : Right(ProgressStatus(event.bytesTransferred.toDouble() /
                        event.totalBytes.toDouble())))); //
      }
    } on Exception catch (e) {
      yield Left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, String>> getFile(String filePath) async {
    try {
      final result = await dataSource.getFile(filePath);
      return Right(result);
    } on Exception catch (e) {
      return Left(Failure.fromException(e));
    }
  }
}
