import 'dart:typed_data';
import 'package:dartz/dartz.dart';
import 'package:grocery_template/_core/entity_crud/data/sources/i_crud_file_source.dart';
import '../../../status.dart';


abstract class ICrudFileRepository {
  final ICrudFileSource dataSource;

  ICrudFileRepository(this.dataSource);

  Stream<Either<Failure, Status>> uploadFile(Uint8List? file, String fileName,
      {List<String>? pathArgs, Map<String, String>? extraData});

  Future<Either<Failure, String>> getFile(String filePath,);

//TODO add other CRUD operations

}
