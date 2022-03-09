
/// Entity which can be searched has to implement this interface
mixin ISearchableEntity {

  /// return true if entity contains [query].
  ///
  /// By default value is [false]
  bool contains(String? query) => false;
}
