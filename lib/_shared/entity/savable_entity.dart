import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_template/_core/entity_crud/data/read_params.dart';
import 'package:grocery_template/_shared/entity/id_title_shared_entity.dart';
import 'package:grocery_template/_shared/extra/shared_fields.dart';
import 'package:grocery_template/_shared/utils/date_utils.dart';
import 'package:grocery_template/app/extra/app_enum.dart';

class SavableEntity extends IdTitleSharedEntity with ICreateValidity {
  ///Set false if created_on, created_by, updated_on, updated_by fields should not be set
  final includeMetaFields = true;
  @Deprecated('use createMetaTags')
  final DateTime? _createdOn;
  @Deprecated('use updateMetaTags')
  final DateTime? _updatedOn;

  DateTime? get updatedOn =>
      (updateMetaTags?['on'] as Timestamp?)?.toDate() ?? _updatedOn;

  DateTime? get createdOn =>
      (createMetaTags?['on'] as Timestamp?)?.toDate() ?? _createdOn;
  EntityStatus status;
  final dynamic createMetaTags;
  final dynamic updateMetaTags;

  SavableEntity.empty(
    id,
  )   : _createdOn = null,
        _updatedOn = null,
        createMetaTags = null,
        updateMetaTags = null,
        status = EntityStatus.active,
        super(id, '');

  SavableEntity.fromMap(Map<String, dynamic> data, {String? id})
      : _createdOn = data[fieldCreatedOn] != null
            ? (data[fieldCreatedOn] as Timestamp).toDate()
            : null,
        _updatedOn = data[fieldUpdatedOn] != null
            ? (data[fieldUpdatedOn] as Timestamp).toDate()
            : null,
        createMetaTags = data[metaFieldCreated],
        updateMetaTags = data[metaFieldUpdated],
        status = data[fieldStatus] == null
            ? EntityStatus.active
            : EntityStatus.values.firstWhere(
                (element) => element.toString() == data[fieldStatus],
                orElse: () => EntityStatus.active),
        super.fromMap(data, id: id);

  @override
  bool get validToCreate => title.isNotEmpty;

  //metaFieldUpdated will be automatically added by the data source before pushing to cloud
  @override
  Map<String, dynamic> get toMap => {
        if (includeMetaFields) ...{
          //keeping the fieldCreatedOn in db entity because this field is being used for sorting in almost all places
          fieldCreatedOn: _createdOn != null
              ? _createdOn!.serverTimeStamp
              : FieldValue.serverTimestamp(),
          if (createMetaTags != null) metaFieldCreated: createMetaTags,
        },
        fieldStatus: status.toString(),
      }..addAll(super.toMap);

  @override
  bool where(List<QueryArgs> query) {
    var isValid = true;

    for (final element in query) {
      if (element.key == fieldStatus) {
        isValid = element.value == status;
      }
      if (!isValid) break;
    }
    return isValid && super.where(query);
  }

  @override
  String toString() {
    return 'SavableEntity{includeMetaFields: $includeMetaFields, _createdOn: $_createdOn, _updatedOn: $_updatedOn, status: $status, createMetaTags: $createMetaTags, updateMetaTags: $updateMetaTags ${super.toString()}';
  }
}

mixin ICreateValidity {
  bool get validToCreate;
}
