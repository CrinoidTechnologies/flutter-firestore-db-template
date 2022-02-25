import 'package:grocery_template/_core/response/i_list_response.dart';

import '../read_params.dart';

/// Abstract class for
abstract class ICRUDDataSource<T> {
  final String rootPath;

  ICRUDDataSource(this.rootPath) {
    // print('ICRUDDataSource rootPath $rootPath');
  }

  String createItemId();

  Future<T?> createUpdateItem(T item);

  Future<void> updateItem(T item, {List<PathArgs>? pathArgs});

  Future<void> removeItem(String id);

  Future<T?> getSingle(String id, {List<PathArgs>? pathArgs});

  Stream<T> streamSingle(String id);

  Stream<IListResponse<T>> streamList();

  Future<IListResponse<T>> getQueryList({ReadParams? readParams});

  Stream<IListResponse<T>> streamQueryList({ReadParams? readParams});

  Future<IListResponse<T>> getListFromTo(
      String field, DateTime from, DateTime to,
      {List<QueryArgs> args = const []});

  Stream<IListResponse<T>> streamListFromTo(
      String field, DateTime from, DateTime to,
      {List<QueryArgs> args = const []});
}
