import 'package:grocery_template/_shared/entity/savable_entity.dart';
import 'package:grocery_template/app/extra/app_fields.dart';

class GroceryEntity extends SavableEntity {
  double? price;
  String? description;
  String? expiryDate;

  GroceryEntity.empty(id, {this.price, this.description}) : super.empty(id);

  @override
  Map<String, dynamic> get toMap => {
        fieldPrice: price,
        fieldDesc: description,
        fieldExpiryDate: expiryDate
      }..addAll(super.toMap);

  GroceryEntity.fromMap(data, {id})
      : price = data[fieldPrice] ?? 0.0,
        description = data[fieldDesc],
        expiryDate = data[fieldExpiryDate],
        super.fromMap(data, id: id);

  @override
  bool get validToCreate => super.validToCreate && ((price ?? 0.0) != 0);
}
