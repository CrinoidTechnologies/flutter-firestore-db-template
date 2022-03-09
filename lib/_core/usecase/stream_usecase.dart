import 'package:dartz/dartz.dart';
import 'package:grocery_template/_core/status.dart';

/// special [usecase] where output is a stream
abstract class StreamUseCase<Type, Params> {
  Stream<Either<Failure, Type>> call(Params params);
}
