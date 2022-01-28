import 'package:grocery_template/_shared/common/app_environment.dart';
import 'package:grocery_template/app/di/dependency_injection.dart';

///Represents the app version to be used in the UI. Must make sure same version is mentioned here and in pubspec
///To make sure the correct app version is shown when a browser is running the cached version of the code
const appVersionName = '1.0.94';
const appVersionNumber = '95';

//For FireStore make sure these paths end in a collection
abstract class ServerPaths {
  ///Root paths
  static const String groceriesRoot = 'groceries';

  ///Dynamic paths
  static String get _adminContextRoot => ''
      '$groceriesRoot';
}
