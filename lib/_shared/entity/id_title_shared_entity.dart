import 'package:grocery_template/_core/entity_crud/data/read_params.dart';
import 'package:grocery_template/_core/utils/string_utils.dart';
import 'package:grocery_template/_shared/entity/shared_entity.dart';

const String fieldId = 'id';
const String fieldTitle = 'title';

class IdTitleSharedEntity extends ISharedEntity {
  ///Keep id empty, if you want this item to be created (not updated)
  final String id;
  String title;

  IdTitleSharedEntity(this.id, this.title);

  @override
  String? get uniqueId => id;

  IdTitleSharedEntity.fromMap(Map<String, dynamic> data, {id})
      : id = (data[fieldId] ?? '').isEmpty ? id : data[fieldId],
        title = data[fieldTitle] ?? '';

  @override
  Map<String, dynamic> get toMap => {
        if (id.isNotEmpty) fieldId: id,
        fieldTitle: title,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is IdTitleSharedEntity && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  bool contains(String? query) {
    if (StringUtils.isEmpty(query)) return true;
    return title.toLowerCase().contains(query?.toLowerCase() ?? '');
  }

  @override
  String toString() {
    return 'IdTitleSharedEntity{id: $id, title: $title}';
  }

  @override
  bool where(List<QueryArgs> query) {
    // TODO: implement where
    return true;
  }
}
