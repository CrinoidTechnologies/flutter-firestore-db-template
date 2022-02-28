import 'package:get/get.dart';
import 'package:grocery_template/_core/entity_crud/data/read_params.dart';
import 'package:grocery_template/_core/status.dart';
import 'package:grocery_template/_core/usecase/usecase.dart';
import 'package:grocery_template/_shared/entity_crud/presentation/controllers/stream_list_controller.dart';
import 'package:grocery_template/_shared/extra/shared_fields.dart';
import 'package:grocery_template/_shared/utils/toast_util.dart';
import 'package:grocery_template/app/di/dependency_injection.dart';
import 'package:grocery_template/app/extra/app_enum.dart';
import 'package:grocery_template/app/modules/Grocery/domain/entities/grocery_entity.dart';
import 'package:grocery_template/app/modules/grocery/domain/usecases/create_update_grocery_use_case.dart';
import 'package:grocery_template/app/modules/grocery/domain/usecases/grocery_stream_list_usecase.dart';

class GroceryListController extends StreamListController<GroceryEntity> {
  GroceryListController({required GroceryStreamListUseCase listUseCase})
      : super(listUseCase) {
    sourceSorter.value = [];
    localSorter.value = [OrderBy(fieldTitle)];
  }

  @override
  get sourceFilter => <QueryArgs>[
        QueryArgs(fieldStatus, EntityStatus.active.toString()),
      ].obs;

  @override
  SaveUseCase get getEntityUpdateUseCase => appSL<CreateUpdateGroceryUseCase>();

  @override
  List<GroceryEntity> sortItems(List<GroceryEntity> items) {
    if (sourceSorter.isEmpty) return items;

    var field = sourceSorter.first.field;
    var descending = sourceSorter.first.descending;

    switch (field) {
      case fieldTitle:
        items.sort((a, b) => descending
            ? (b.title.compareTo(a.title))
            : (a.title.compareTo(b.title)));
        break;
    }

    return items;
  }

  Future<GroceryEntity?> createGrocery(GroceryEntity entity) async {
    var result = await appSL<CreateUpdateGroceryUseCase>()(entity);
    final v = result.fold((l) {
      showMessage(l);
      return null;
    }, (r) {
      showMessage(const Success(message: 'Success'));
      return r;
    });
    return v;
  }
}
