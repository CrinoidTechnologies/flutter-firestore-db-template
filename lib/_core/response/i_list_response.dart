///
mixin IListResponse<T> {
  List<T> get getItems;

  int get getTotalItems;

  int get getPageIndex;

  int get getItemsPerPage;
}
