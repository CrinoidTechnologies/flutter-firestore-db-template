import 'package:grocery_template/_core/entity_crud/data/read_params.dart';
import 'package:grocery_template/_shared/entity/savable_entity.dart';
import 'package:grocery_template/_shared/entity_crud/domain/usecases/query_entity_list_usecase.dart';
import 'base_list_controller.dart';

class QueryListController<T extends SavableEntity> extends BaseListController {
  final QueryEntityListUseCase<T> _listUseCase;

  QueryListController(this._listUseCase);

  @override
  bool fetchItemsFromSource(ReadParams readParams) {
    _listUseCase(readParams).then((event) {
      event.fold((l) => onFailure(l), (r) {
        onFetchSuccess(r);
      });
      isFetching.value = false;
    });
    return true;
  }
}
