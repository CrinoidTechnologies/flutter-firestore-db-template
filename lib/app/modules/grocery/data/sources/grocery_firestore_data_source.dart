import 'package:grocery_template/_shared/entity_crud/data/sources/crud_data_source_firebase_impl.dart';
import 'package:grocery_template/app/extra/app_constants.dart';
import 'package:grocery_template/app/modules/Grocery/domain/entities/grocery_entity.dart';

class GroceryFirestoreDataSource
    extends CRUDDataSourceFirestore<GroceryEntity> {
  GroceryFirestoreDataSource() : super(ServerPaths.groceriesRoot);

  @override
  GroceryEntity fromDS(String id, Object? ds) {
    final data = ds as Map<String, dynamic>;
    return GroceryEntity.fromMap(data, id: id);
  }
}
