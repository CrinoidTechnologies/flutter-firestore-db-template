import 'package:grocery_template/_core/response/i_list_response.dart';

import '../read_params.dart';

/// Abstract class for basic CRUD operation on a Table/Collection.
/// [T] is type of object that DB table is going to save.
///
/// [rootPath] is location of collection
abstract class ICRUDDataSource<T> {
  /// It is root path of table/collection where data will be stored
  final String rootPath;

  ICRUDDataSource(this.rootPath);

  /// updates [item] in collection if item is available
  Future<T?> createItem(T item, {List<PathArgs>? pathArgs});

  /// updates [item] in collection if item is available
  Future<T?> updateItem(T item, {List<PathArgs>? pathArgs});

  /// delete item with given [id] from collection/db
  Future<void> deleteItem(String id);

  /// fetches item referenced by [id]
  /// null if no item is present
  Future<T?> getItem(String id, {List<PathArgs>? pathArgs});

  /// return and creates empty item with dynamic unique id in collection
  String createItemId();

  /// creates item is id is null other it will try to update item
  Future<T?> createUpdateItem(T item);

  /// give item stream referenced by [id]
  /// It is useful when changes/updates are need to be monitored
  Stream<T> getItemStream(String id);

  ///
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
