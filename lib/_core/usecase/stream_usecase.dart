import 'package:dartz/dartz.dart';
import 'package:grocery_template/_core/status.dart';

abstract class StreamUseCase<Type, Params> {
  Stream<Either<Failure, Type>> call(Params params);
}
