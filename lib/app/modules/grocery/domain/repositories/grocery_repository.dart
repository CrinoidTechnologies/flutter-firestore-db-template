import 'package:grocery_template/_shared/entity_crud/data/repositories/crud_entity_data_repository_impl.dart';
import 'package:grocery_template/app/modules/Grocery/data/sources/grocery_firestore_data_source.dart';
import 'package:grocery_template/app/modules/Grocery/domain/entities/grocery_entity.dart';

class GroceryRepository extends CRUDEntityDataRepository<GroceryEntity> {
  GroceryRepository(GroceryFirestoreDataSource dataSource) : super(dataSource);
}
