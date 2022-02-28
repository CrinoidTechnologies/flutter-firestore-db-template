import 'package:dartz/dartz.dart';
import 'package:grocery_template/_core/status.dart';
import 'package:grocery_template/_core/usecase/usecase.dart';
import 'package:grocery_template/app/modules/Grocery/domain/entities/grocery_entity.dart';
import 'package:grocery_template/app/modules/Grocery/domain/repositories/grocery_repository.dart';

class CreateUpdateGroceryUseCase extends SaveUseCase<GroceryEntity> {
  final GroceryRepository _repository;

  CreateUpdateGroceryUseCase(this._repository);

  @override
  Future<Either<Failure, dynamic>> call(GroceryEntity params) async {
    return _repository.createUpdateItem(params);
  }
}
