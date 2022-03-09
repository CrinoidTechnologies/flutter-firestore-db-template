import 'package:grocery_template/_core/entity_crud/data/read_params.dart';

///
mixin IFilterableEntity {
  bool where(List<QueryArgs> query) => false;
}
