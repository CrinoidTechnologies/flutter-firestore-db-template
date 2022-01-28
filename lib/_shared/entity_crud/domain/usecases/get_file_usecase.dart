import 'package:dartz/dartz.dart';
import 'package:grocery_template/_core/entity_crud/domain/repositories/i_crud_file_repository.dart';
import 'package:grocery_template/_core/status.dart';
import 'package:grocery_template/_core/usecase/usecase.dart';

class GetFileUseCase extends UseCase<String, String> {
  final ICrudFileRepository repository;

  GetFileUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(String filePath) {
    return repository.getFile(filePath);
  }
}
