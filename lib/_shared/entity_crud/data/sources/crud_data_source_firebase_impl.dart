import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:grocery_template/_core/entity_crud/data/read_params.dart';
import 'package:grocery_template/_core/entity_crud/data/sources/i_crud_data_source.dart';
import 'package:grocery_template/_core/response/i_list_response.dart';
import 'package:grocery_template/_shared/entity/i_shared_entity.dart';
import 'package:grocery_template/_shared/extra/shared_fields.dart';
import 'package:grocery_template/_shared/response/list_response.dart';
import 'package:grocery_template/_shared/utils/storage_util.dart';
import 'package:grocery_template/app/utils/app_storage_util.dart';

abstract class CRUDDataSourceFirestore<T extends ISharedEntity>
    extends ICRUDDataSource<T> {
  CollectionReference get rootCollection =>
      FirebaseFirestore.instance.collection(rootPath);

  Query get rootSubCollection =>
      FirebaseFirestore.instance.collectionGroup(rootPath);

  CRUDDataSourceFirestore(String rootCollection) : super(rootCollection);

  CollectionReference collectionBuilderWithList(List<PathArgs>? pathArgs) {
    // print('collectionBuilderWithList $pathArgs');
    var col = rootCollection;
    for (var element in (pathArgs ?? [])) {
      col = collectionBuilder(element, col);
      // print('pathArgs forEach ${col.path}');
    }
    return col;
  }

  CollectionReference collectionBuilder(
      PathArgs? pathArgs, CollectionReference collectionReference) {
    // print('collectionBuilder ${pathArgs?.toString()}');
    if (pathArgs != null) {
      return collectionReference.doc(pathArgs.key).collection(pathArgs.value);
    }
    return collectionReference;
  }

  T fromDS(String id, Object? ds);

  Map<String, dynamic> metaInfo() {
    final storage = Get.find<StorageUtil>();
    return {
      'user': {
        'name': storage.readString(AppStorageUtil.userName),
        'role': storage.readString(AppStorageUtil.userRole),
        'id': storage.readString(AppStorageUtil.userId),
        'ip': storage.readString(AppStorageUtil.ipAddress),
      },
      'app': {
        'v': storage.readString(AppStorageUtil.appVersion),
      },
      'on': FieldValue.serverTimestamp(),
    };
  }

  Map<String, dynamic> toMap(T object) {
    final data = object.toMap;
    //Add the latest meta field of update for every write
    data[metaFieldUpdated] = metaInfo();
    //if data does not contain meta field of creation, it means it's new entity being created. Add the meta field of creation information
    if (data[metaFieldCreated] == null) {
      data[metaFieldCreated] = metaInfo();
    } else {
      //if the data already contains meta field of creation, it means the entity is old. This must be removed so it does not update on cloud
      data.remove(metaFieldCreated);
    }
    return data;
  }

  @override
  String createItemId() {
    return rootCollection.doc().id;
  }

  @override
  Future<T?> createUpdateItem(T item) {
    if ((item.uniqueId ?? '').isNotEmpty) {
      return updateItem(item);
    } else {
      return rootCollection
          .add(toMap(item))
          .then((value) => getSingleByDocReference(value));
    }
  }

  @override
  Future<T?> updateItem(T item, {List<PathArgs>? pathArgs}) {
    return rootCollection
        .doc(item.uniqueId)
        .set(toMap(item), SetOptions(merge: true))
        .then((value) => item);
  }

  @override
  Future<void> removeItem(String id) {
    return rootCollection.doc(id).delete();
  }

  @override
  Future<T?> getSingle(String id, {List<PathArgs>? pathArgs}) async {
    return getSingleByDocReference(collectionBuilderWithList(pathArgs).doc(id));
  }

  Future<T?> getSingleByDocReference(DocumentReference reference) async {
    var snap = await reference.get();
    // print('snap.reference.path ${snap.reference.path}');
    if (!snap.exists) return null;
    return fromDS(snap.id, snap.data());
  }

  @override
  Stream<T> streamSingle(String id) {
    return rootCollection
        .doc(id)
        .snapshots()
        .map((snap) => fromDS(snap.id, snap.data()));
  }

  @override
  Stream<IListResponse<T>> streamList() {
    var ref = rootCollection;
    return ref.snapshots().map((list) => ListResponse(
        items: list.docs.map((doc) => fromDS(doc.id, doc.data())).toList(),
        totalItems: list.size,
        pageIndex: 0));
  }

  @override
  Future<IListResponse<T>> getQueryList({ReadParams? readParams}) async {
    CollectionReference collref = rootCollection;
    Query? ref;
    if (readParams?.queryArgs != null) {
      for (QueryArgs arg in readParams!.queryArgs!) {
        if (ref == null) {
          ref = collref.where(arg.key, isEqualTo: arg.value);
        } else {
          ref = ref.where(arg.key, isEqualTo: arg.value);
        }
      }
    }
    if (readParams?.orderBy != null) {
      for (var order in readParams!.orderBy!) {
        if (ref == null) {
          ref = collref.orderBy(order.field, descending: order.descending);
        } else {
          ref = ref.orderBy(order.field, descending: order.descending);
        }
      }
    }
    if (readParams?.limit != null) {
      if (ref == null) {
        ref = collref.limit(readParams!.limit!);
      } else {
        ref = ref.limit(readParams!.limit!);
      }
    }

    QuerySnapshot query;
    if (ref != null) {
      query = await ref.get();
    } else {
      query = await collref.get();
    }

    return ListResponse<T>(
        items: query.docs
            .map((doc) => fromDS(doc.id, doc.data() as Map<String, dynamic>))
            .toList(),
        totalItems: query.size,
        pageIndex: 0,
        itemsPerPage: readParams?.limit);
  }

  @override
  Stream<IListResponse<T>> streamQueryList({ReadParams? readParams}) {
    // CollectionReference collRef = rootCollection;
    CollectionReference collRef =
        collectionBuilderWithList(readParams?.pathArgs);
    Query? ref;
    if (readParams?.orderBy != null) {
      for (var order in readParams!.orderBy!) {
        if (ref == null) {
          ref = collRef.orderBy(order.field, descending: order.descending);
        } else {
          ref = ref.orderBy(order.field, descending: order.descending);
        }
      }
    }
    if (readParams?.queryArgs != null) {
      for (QueryArgs arg in readParams!.queryArgs!) {
        if (ref == null) {
          if (arg.negate) {
            ref = collRef.where(arg.key, isNotEqualTo: arg.value);
          } else {
            ref = collRef.where(arg.key, isEqualTo: arg.value);
          }
        } else {
          if (arg.negate) {
            ref = ref.where(arg.key, isNotEqualTo: arg.value);
          } else {
            ref = ref.where(arg.key, isEqualTo: arg.value);
          }
        }
      }
    }

    if (readParams?.whereInArgs != null) {
      WhereInArgs arg = readParams!.whereInArgs!;
      if (arg.negate) {
        if (ref == null) {
          ref = collRef.where(arg.key, whereNotIn: arg.value);
        } else {
          ref = ref.where(arg.key, whereNotIn: arg.value);
        }
      } else {
        if (ref == null) {
          ref = collRef.where(arg.key, whereIn: arg.value);
        } else {
          ref = ref.where(arg.key, whereIn: arg.value);
        }
      }
    }
    if (readParams?.limit != null) {
      if (ref == null) {
        ref = collRef.limit(readParams!.limit!);
      } else {
        ref = ref.limit(readParams!.limit!);
      }
    }

    return (ref ?? collRef).snapshots().map((snap) => ListResponse<T>(
        items: snap.docs
            .map<T>((doc) => fromDS(doc.id, doc.data() as Map<String, dynamic>))
            .toList(),
        totalItems: snap.size));
  }

  @override
  Future<IListResponse<T>> getListFromTo(
      String field, DateTime from, DateTime to,
      {List<QueryArgs> args = const []}) async {
    var ref = rootCollection.orderBy(field);
    for (QueryArgs arg in args) {
      ref = ref.where(arg.key, isEqualTo: arg.value);
    }
    QuerySnapshot query = await ref.startAt([from]).endAt([to]).get();
    return ListResponse(
      items: query.docs
          .map((doc) => fromDS(doc.id, doc.data() as Map<String, dynamic>))
          .toList(),
      totalItems: query.size,
    );
  }

  @override
  Stream<IListResponse<T>> streamListFromTo(
      String field, DateTime from, DateTime to,
      {List<QueryArgs> args = const []}) {
    var ref = rootCollection.orderBy(field, descending: true);
    for (QueryArgs arg in args) {
      ref = ref.where(arg.key, isEqualTo: arg.value);
    }
    var query = ref.startAfter([to]).endAt([from]).snapshots();
    return query.map((snap) => ListResponse(
        items: snap.docs.map((doc) => fromDS(doc.id, doc.data())).toList(),
        totalItems: snap.size));
  }
}
