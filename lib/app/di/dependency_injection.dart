import 'package:get_it/get_it.dart';
import 'package:grocery_template/_shared/di/dependency_injection.dart';
import 'package:grocery_template/app/ui/controllers/language_controller.dart';
import 'package:grocery_template/app/extra/middlewares/language_detector_middle_ware.dart';
import 'package:grocery_template/app/modules/Grocery/data/sources/grocery_firestore_data_source.dart';
import 'package:grocery_template/app/modules/Grocery/domain/repositories/grocery_repository.dart';
import 'package:grocery_template/app/modules/dashboard/presentation/controllers/dashboard_controller.dart';
import 'package:grocery_template/app/modules/grocery/domain/usecases/create_update_grocery_use_case.dart';
import 'package:grocery_template/app/modules/grocery/domain/usecases/grocery_stream_list_usecase.dart';
import 'package:grocery_template/app/modules/grocery/presentation/controllers/grocery_list_controller.dart';
import 'package:grocery_template/app/modules/splash/presentation/controllers/splash_controller.dart';
import 'package:grocery_template/app/ui/controllers/theme_controller.dart';

/// global variable to access Service Locator
final appSL = GetIt.instance;

/// All the component belongs to data and domain layer will be created
/// as lazy singleton i.e they will initialized only when they used
///
/// Components belongs to presentation layer will be created by factory i.e
/// a new instance will be created every time we call it. A place where it is
/// initialized has a responsibility to dispose.

Future<void> initServiceLocator() async {
  /// initialising shared dependency
  await initSharedServiceLocator();

  ///Splash.........................
  // presentation
  appSL.registerFactory(() => SplashController());

  ///Extras
  appSL.registerSingleton(LanguageController());
  appSL.registerSingleton<ThemeController>(ThemeController());

  ///Middleware......................
  appSL.registerLazySingleton(() => LanguageDetectorMiddleWare());

  ///Dashboard......................
  // presentation
  appSL.registerFactoryParam((p1, _) => DashboardController(currentPage: p1));

  ///grocery sections........................
  // data
  appSL.registerLazySingleton(() => GroceryFirestoreDataSource());
  appSL.registerLazySingleton(() => GroceryRepository(appSL()));
  //domain
  appSL.registerLazySingleton(() => GroceryStreamListUseCase(appSL()));
  appSL.registerLazySingleton(() => CreateUpdateGroceryUseCase(appSL()));
  //Presentation
  appSL.registerFactoryParam<GroceryListController, void, void>(
      (p1, _) => GroceryListController(listUseCase: appSL()));
}

Future<void> initTestServiceLocator() async {}
