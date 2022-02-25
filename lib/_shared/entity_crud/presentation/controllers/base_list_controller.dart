import 'dart:async';

import 'package:get/get.dart';
import 'package:grocery_template/_core/entity_crud/data/read_params.dart';
import 'package:grocery_template/_core/response/i_list_response.dart';
import 'package:grocery_template/_core/status.dart';
import 'package:grocery_template/_core/usecase/usecase.dart';
import 'package:grocery_template/_core/utils/string_utils.dart';
import 'package:grocery_template/_shared/entity/savable_entity.dart';
import 'package:grocery_template/_shared/entity/i_shared_entity.dart';
import 'package:grocery_template/_shared/extra/shared_constants.dart';
import 'package:grocery_template/_shared/extra/shared_fields.dart';
import 'package:grocery_template/_shared/utils/dialog_utils.dart';
import 'package:grocery_template/_shared/utils/logger_utils.dart';
import 'package:grocery_template/_shared/utils/toast_util.dart';
import 'package:grocery_template/app/extra/app_enum.dart';
import 'package:grocery_template/app/modules/dashboard/presentation/controllers/dashboard_controller.dart';
import 'package:grocery_template/generated/l10n.dart';

abstract class BaseListController<T extends SavableEntity>
    extends GetxController {
  ///This is the original data as received from the source
  final dataList = <T>[].obs;

  ///This list is filtered and sorted with local parameters
  final localList = <T>[].obs;
  final searchQuery = "".obs;

  ///The Order which should sort the data at the source, for example sort queries for firestore
  final sourceSorter =
      <OrderBy>[OrderBy(metaFieldCreatedOn, descending: true)].obs;

  ///To fetch data from nested collection with dynamic path, for example /ctma_clients/KIleX2Qvt9VPoknNUKyc/trials/FDwSagF6tX04GptDDHke/trial_audit_log/3DuYfdYFUCjrsuoFYXEp
  final pathArgs = <PathArgs>[].obs;

  ///The queries which should filter the data at the source, for example where queries for firestore
  final sourceFilter = <QueryArgs>[].obs;

  ///Items limit per page load call. how many items we want to load at once and further additions using #fetchMoreItems
  ///Defaults to #defaultItemsLimit
  final limitPerFetch = defaultItemsLimit.obs;

  ///The items limit while fetching data, used in the limit parameter of query
  ///Defaults to #defaultItemsLimit
  final _currentItemsFetchLimit = defaultItemsLimit.obs;

  ///The queries which should filter the data at the source, for example whereIn queries for firestore
  final Rx<WhereInArgs?> whereInFilter = (null).obs;

  ///The queries which should filter the data locally
  final localFilter = <QueryArgs>[].obs;

  ///The Order which should sort the data locally,
  ///try to make it a final field when override
  final localSorter = <OrderBy>[].obs;

  final selectedItems = <String>[].obs;

  ///true when data fetch is in progress
  final isFetching = false.obs;

  StreamSubscription? _searchStreamSub;
  StreamSubscription? _limitSub;

  @override
  void onInit() {
    super.onInit();
    _currentItemsFetchLimit.value = limitPerFetch.value;
  }

  @override
  void onReady() {
    super.onReady();
    _searchStreamSub = searchQuery.listen((p0) {
      _updateSearchQuery(p0);
    });
    _fetchItems();
    _limitSub = _currentItemsFetchLimit.listen((p0) {
      _fetchItems();
    });
  }

  @override
  void dispose() {
    _searchStreamSub?.cancel();
    _limitSub?.cancel();
    super.dispose();
  }

  T? getItemById(String? uid) {
    if (uid?.isEmpty ?? true) return null;
    return dataList.firstWhereOrNull((element) {
      return element.uniqueId == uid;
    });
  }

  void onFailure(Failure l) {
    logE('$this onFailure $l');
    showMessage(l);
  }

  /// This method is supposed to be called only once for a page,
  void _fetchItems() async {
    final readParams = ReadParams(
        orderBy: sourceSorter.toList(),
        queryArgs: sourceFilter.toList(),
        whereInArgs: whereInFilter.value,
        limit: _currentItemsFetchLimit.value,
        pathArgs: pathArgs.toList());
    logD('$this fetchItems .. ${readParams.toString()}');

    isFetching.value = fetchItemsFromSource(readParams);
  }

  ///Call your data stream or query use case in this method,
  ///this will be called repeatedly on #fetchMoreItems
  bool fetchItemsFromSource(ReadParams readParams);

  onFetchSuccess(IListResponse<T> r) {
    // logD('got items $_listUseCase ${r.getItems.length}');
    dataList.clear();
    dataList.addAll(r.getItems);
    refreshItemList();
  }

  bool get itemsFetchedToLimit =>
      dataList.length >= _currentItemsFetchLimit.value;

  bool fetchMoreItems() {
    if (itemsFetchedToLimit) {
      _currentItemsFetchLimit.value += limitPerFetch.value;
      return true;
    }
    return false;
  }

  ///Call after the local filters or sorters are modified
  void refreshItemList() {
    List<T> items = [...dataList];

    // filter items by search
    items = filterItems(items);

    // sort items
    items = sortItems(items);

    localList.value = items;
  }

  /// Items filtering...................
  List<T> filterItems(List<T> items) {
    //TODO set proper call whenever searchQuery or localFilter value changes
    if (StringUtils.isNotEmpty(searchQuery.value.trim())) {
      items.removeWhere(
          (element) => !element.contains(searchQuery.value.trim()));
    }
    items.removeWhere((element) => !element.where(localFilter));
    return items;
  }

  /// Item sorting.......................
  void onLocalSorterUpdated(OrderBy value) {
    //TODO source sorter should not be modified here
    if (sourceSorter.isNotEmpty && sourceSorter.first.field == value.field) {
      _updateSorter([value.clone(descending: !value.descending)]);
    } else {
      _updateSorter([value]);
    }

    int index =
        localSorter.indexWhere((element) => element.field == selectedSorter);
    if (index > -1) {
      localSorter
        ..removeAt(index)
        ..insert(index, sourceSorter.first);
    }
  }

  List<T> sortItems(List<T> items) {
    if (sourceSorter.isEmpty) return items;
    return items;
  }

  void _updateSearchQuery(String? text) {
    refreshItemList();
  }

  void _updateSorter(List<OrderBy> sorters) {
    // refreshItemList();
    sourceSorter.value = sorters;
    refreshItemList();
  }

  String get selectedSorter =>
      sourceSorter.isNotEmpty ? sourceSorter.first.field : '';

  /// Item selections..................

  bool get allSelected =>
      selectedItems.isNotEmpty && selectedItems.length == localList.length;

  void updateListSelection() {
    if (allSelected) {
      selectedItems.clear();
    } else {
      selectedItems.clear();
      selectedItems.addAll(localList.map((element) => element.uniqueId ?? ''));
    }
  }

  bool isItemSelected(ISharedEntity item) =>
      selectedItems.contains(item.uniqueId);

  void toggleItemSelection(ISharedEntity item) {
    if (isItemSelected(item)) {
      selectedItems.remove(item.uniqueId);
    } else {
      selectedItems.add(item.uniqueId!);
    }
  }

  void openItem(int position,
      {DashboardContentAction action = DashboardContentAction.view}) {
    Get.find<DashboardController>()
        .changePage(topPage: 0, data: localList[position], action: action);
  }

  ///This does not do hard delete, it will only change the entity status to EntityStatus.deleted
  Future<bool> deleteOrArchiveItem(
      {T? entity, int? position, bool archiveItem = false}) async {
    assert(getEntityUpdateUseCase != null,
        '${runtimeType.toString()} must override getEntityUpdateUseCase and provide appropriate instance');
    assert(entity != null || position != null,
        'either one of entity or position should be non-null');
    final value = await showOkCancelPopUp(
        S.current.confirm,
        archiveItem
            ? S.current.areYouSureWantToArchiveThis
            : S.current.areYouSureWantToDeleteThis);
    if (value == true) {
      if (position != null) entity = localList[position];
      entity!.status =
          archiveItem ? EntityStatus.archived : EntityStatus.deleted;
      var result = await getEntityUpdateUseCase!(entity);
      result.fold((l) {
        showMessage(l);
      }, (r) {
        showMessage(Success(
            message: archiveItem
                ? S.current.archivedSuccessfully
                : S.current.deletedSuccessfully));
      });
      return true;
    }
    return false;
  }

  ///This will reset the status of entity to active.
  Future<bool> reActivateItem(
      {T? entity, int? position, String? confirmationMsg}) async {
    assert(getEntityUpdateUseCase != null,
        '${runtimeType.toString()} must override getEntityUpdateUseCase and provide appropriate instance');
    assert(entity != null || position != null,
        'either one of entity or position should be non-null');
    final value = await showOkCancelPopUp(S.current.confirm,
        confirmationMsg ?? S.current.areYouSureWantToReactivateThis);
    if (value == true) {
      if (position != null) entity = localList[position];
      entity!.status = EntityStatus.active;
      var result = await getEntityUpdateUseCase!(entity);
      result.fold((l) {
        showMessage(l);
      }, (r) {
        showMessage(Success(message: S.current.reactivatedSuccessfully));
      });
      return true;
    }
    return false;
  }

  ///Override this getter to provide a use case for updating the entity, will be used in case updating status and other cases
  SaveUseCase? get getEntityUpdateUseCase {
    return null;
  }
}
