import 'package:grocery_template/_shared/entity_crud/domain/usecases/stream_entity_list_usecase.dart';
import 'package:grocery_template/app/modules/Grocery/domain/entities/grocery_entity.dart';
import 'package:grocery_template/app/modules/Grocery/domain/repositories/grocery_repository.dart';

class GroceryStreamListUseCase extends StreamEntityListUseCase<GroceryEntity> {
  GroceryStreamListUseCase(GroceryRepository repository) : super(repository);
}
