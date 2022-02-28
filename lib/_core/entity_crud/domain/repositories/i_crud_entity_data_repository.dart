import 'package:dartz/dartz.dart';
import 'package:grocery_template/_core/entity_crud/data/read_params.dart';
import 'package:grocery_template/_core/entity_crud/data/sources/i_crud_data_source.dart';
import 'package:grocery_template/_core/response/i_list_response.dart';
import 'package:grocery_template/_core/status.dart';
import 'package:grocery_template/_shared/entity/i_shared_entity.dart';

abstract class ICRUDEntityDataRepository<T extends ISharedEntity> {
  final ICRUDDataSource<T> dataSource;

  ICRUDEntityDataRepository(this.dataSource);

  Map<String, dynamic> toMap(T object) => object.toMap;

  Either<Failure, String> createItemId();

  Future<Either<Failure, T?>> createUpdateItem(T item);

  Future<Either<Failure, void>> updateItem(T item, {List<PathArgs>? pathArgs});

  Future<Either<Failure, void>> removeItem(String id);

  Future<Either<Failure, T?>> getSingle(String id, {List<PathArgs>? pathArgs});

  Stream<Either<Failure, T>> streamSingle(String id);

  Stream<Either<Failure, IListResponse<T>>> streamList();

  Future<Either<Failure, IListResponse<T>>> getQueryList(
      {ReadParams? readParams});

  Stream<Either<Failure, IListResponse<T>>> streamQueryList(
      {ReadParams? readParams});

  Future<Either<Failure, IListResponse<T>>> getListFromTo(
      String field, DateTime from, DateTime to,
      {List<QueryArgs> args = const []});

  Stream<Either<Failure, IListResponse<T>>> streamListFromTo(
      String field, DateTime from, DateTime to,
      {List<QueryArgs> args = const []});
}
