import 'package:dartz/dartz.dart';
import 'package:grocery_template/_core/entity_crud/data/read_params.dart';
import 'package:grocery_template/_core/entity_crud/domain/repositories/i_crud_entity_data_repository.dart';
import 'package:grocery_template/_core/response/i_list_response.dart';
import 'package:grocery_template/_core/status.dart';
import 'package:grocery_template/_core/usecase/usecase.dart';
import 'package:grocery_template/_shared/entity/i_shared_entity.dart';

class QueryEntityListUseCase<T extends ISharedEntity>
    extends UseCase<IListResponse<T>, ReadParams?> {
  final ICRUDEntityDataRepository<T> repository;

  QueryEntityListUseCase(
    this.repository,
  );

  @override
  Future<Either<Failure, IListResponse<T>>> call(ReadParams? params) {
    // logD('StreamEntityListUseCase $T $params');
    return repository.getQueryList(readParams: params);
  }
}
