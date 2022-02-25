import 'dart:async';

import 'package:grocery_template/_core/entity_crud/data/read_params.dart';
import 'package:grocery_template/_shared/entity/savable_entity.dart';
import 'package:grocery_template/_shared/entity_crud/domain/usecases/stream_entity_list_usecase.dart';

import 'base_list_controller.dart';

class StreamListController<T extends SavableEntity>
    extends BaseListController<T> {
  final StreamEntityListUseCase<T> _listUseCase;

  ///Reference to latest data source stream subscription
  StreamSubscription? _itemsStreamSubscription;

  StreamListController(this._listUseCase);

  @override
  bool fetchItemsFromSource(ReadParams readParams) {
    if (_itemsStreamSubscription != null) {
      _itemsStreamSubscription?.cancel();
      _itemsStreamSubscription = null;
    }
    _itemsStreamSubscription = _listUseCase(readParams).listen((event) {
      event.fold((l) => onFailure(l), (r) {
        onFetchSuccess(r);
      });
      isFetching.value = false;
    });
    return true;
  }

  @override
  void dispose() {
    super.dispose();
    _itemsStreamSubscription?.cancel();
  }
}
