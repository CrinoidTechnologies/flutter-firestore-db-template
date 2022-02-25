import 'package:dartz/dartz.dart';
import 'package:grocery_template/_core/entity_crud/data/read_params.dart';
import 'package:grocery_template/_core/entity_crud/domain/repositories/i_crud_entity_data_repository.dart';
import 'package:grocery_template/_core/response/i_list_response.dart';
import 'package:grocery_template/_core/status.dart';
import 'package:grocery_template/_core/usecase/stream_usecase.dart';
import 'package:grocery_template/_shared/entity/i_shared_entity.dart';

class StreamEntityListUseCase<T extends ISharedEntity>
    extends StreamUseCase<IListResponse<T>, ReadParams?> {
  final ICRUDEntityDataRepository<T> repository;

  StreamEntityListUseCase(
    this.repository,
  );

  @override
  Stream<Either<Failure, IListResponse<T>>> call(ReadParams? params) {
    // logD('StreamEntityListUseCase $T $params');
    return repository.streamQueryList(readParams: params);
  }
}
