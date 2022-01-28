import 'package:dartz/dartz.dart';
import '../status.dart';


/// It is Application-specific business rules
/// Encapsulate all the usecases of the application
/// Orchestrate the flow of data throughout the app
/// Should not be affected by any UI changes whatsoever
/// Might change if the functionality and flow of application change
///
/// Usecase where we are expecting execution one time only
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class SaveUseCase<Params> {
  Future<Either<Failure, void>> call(Params params);
}

abstract class AutoSaveUseCase<Params> extends SaveUseCase<Params> {
  Either<Failure, String> generateAutoSaveId();
}

///Use this use case when we don't want to perform any data saving
class DummyAutoSaveUseCase extends AutoSaveUseCase {
  @override
  call(params) => Future.value(Right(Success()));

  @override
  generateAutoSaveId() => Right('1234');
}

abstract class SyncUseCase<Type, Params> {
  Either<Failure, Type> call(Params params);
}

abstract class StreamUseCase<Type, Params> {
  Stream<Either<Failure, Type>> call(Params params);
}