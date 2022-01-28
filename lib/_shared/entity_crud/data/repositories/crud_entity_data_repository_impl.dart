import 'package:dartz/dartz.dart';
import 'package:grocery_template/_core/entity_crud/data/read_params.dart';
import 'package:grocery_template/_core/entity_crud/domain/repositories/i_crud_entity_data_repository.dart';
import 'package:grocery_template/_core/response/i_list_response.dart';
import 'package:grocery_template/_core/status.dart';
import 'package:grocery_template/_shared/entity/shared_entity.dart';
import 'package:grocery_template/_shared/utils/logger_utls.dart';
class CRUDEntityDataRepository<T extends ISharedEntity>
    extends ICRUDEntityDataRepository<T> {
  CRUDEntityDataRepository(dataSource) : super(dataSource);

  Either<Failure, String> createItemId() {
    try {
      final result = dataSource.createItemId();
      return Right(result);
    } on Exception catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  Future<Either<Failure, T?>> createUpdateItem(T item) async {
    try {
      final result = await dataSource.createUpdateItem(item);
      return Right(result);
    } on Exception catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  Future<Either<Failure, void>> updateItem(T item,
      {List<PathArgs>? pathArgs}) async {
    try {
      final result = await dataSource.updateItem(item, pathArgs: pathArgs);
      return Right(result);
    } on Exception catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  Future<Either<Failure, void>> removeItem(String id) async {
    try {
      final result = await dataSource.removeItem(id);
      return Right(result);
    } on Exception catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  Future<Either<Failure, T?>> getSingle(String id,
      {List<PathArgs>? pathArgs}) async {
    try {
      final result = await dataSource.getSingle(id, pathArgs: pathArgs);
      return Right(result);
    } on Exception catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  Stream<Either<Failure, T>> streamSingle(String id) async* {
    try {
      yield* dataSource.streamSingle(id).map((event) => Right(event));
    } on Exception catch (e) {
      yield Left(Failure.fromException(e));
    }
  }

  Stream<Either<Failure, IListResponse<T>>> streamList() async* {
    try {
      yield* dataSource.streamList().map((event) => Right(event));
    } on Exception catch (e) {
      print('streamList Exception $e');
      yield Left(Failure.fromException(e));
    }
  }

  Future<Either<Failure, IListResponse<T>>> getQueryList(
      {ReadParams? readParams}) async {
    try {
      final result = await dataSource.getQueryList(readParams: readParams);
      return Right(result);
    } on Exception catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  Stream<Either<Failure, IListResponse<T>>> streamQueryList(
      {ReadParams? readParams}) async* {
    try {
      yield* dataSource
          .streamQueryList(readParams: readParams)
          .map((event) => Right(event));
    } on Exception catch (e) {
      //TODO the exception occurred while parsing the json data to entity using fromMap function is not being captured here due to some unknown reasons.Must investigate.
      logE('streamQueryList Exception ${e.toString()}');
      yield Left(Failure.fromException(e));
    }
  }

  Future<Either<Failure, IListResponse<T>>> getListFromTo(
      String field, DateTime from, DateTime to,
      {List<QueryArgs> args = const []}) async {
    try {
      final result =
          await dataSource.getListFromTo(field, from, to, args: args);
      return Right(result);
    } on Exception catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  Stream<Either<Failure, IListResponse<T>>> streamListFromTo(
      String field, DateTime from, DateTime to,
      {List<QueryArgs> args = const []}) async* {
    try {
      yield* dataSource
          .streamListFromTo(field, from, to, args: args)
          .map((event) => Right(event));
    } on Exception catch (e) {
      yield Left(Failure.fromException(e));
    }
  }
}
