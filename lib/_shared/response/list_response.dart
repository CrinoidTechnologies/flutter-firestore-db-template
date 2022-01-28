
import 'package:grocery_template/_core/response/i_list_response.dart';

class ListResponse<T> implements IListResponse<T> {
  final List<T>? items;
  final int? totalItems;
  final int? itemsPerPage;
  final int? pageIndex;

  ListResponse(
      {this.items, this.totalItems, this.itemsPerPage, this.pageIndex});

  @override
  List<T> get getItems => items ?? [];

  @override
  int get getItemsPerPage => itemsPerPage ?? 0;

  @override
  int get getPageIndex => pageIndex ?? 0;

  @override
  int get getTotalItems => totalItems ?? 0;
}
