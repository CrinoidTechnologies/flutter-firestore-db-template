import 'package:get_storage/get_storage.dart';
import 'package:grocery_template/_shared/utils/logger_utils.dart';
import 'package:grocery_template/_shared/utils/storage_util.dart';

/// Singleton helper class for storing and fetching persistent data
/// via KEY-VALUE in synchronous manner
///
/// Create unique keys in this class and handle default cases
///
/// Note this utils require plugin to work
/// In pubspec.ymal add this line in dependencies
/// shared_preferences:
///
///  main(){
///    await GetStorage.init();
///    runApp(MyApp());
///   });
/// }
///
/// Reading value
///   bool isFirstTime = AppStorageUtil().readBool(AppStorageUtil.firstTimeAppOpen);
///
/// Writing value
///   AppStorageUtil().writeBool(AppStorageUtil.firstTimeAppOpen, false);
///
class AppStorageUtil extends StorageUtil {
  static const String theme = "theme";
  static const String appVersion = "appVersion";
  static const String os = "os";
  static const String userId = "userId";
  static const String userRole = "userRole";
  static const String userName = "userName";
  static const String ipAddress = "ipAddress";

//  static const int userId = 2;
//  static const int rememberMe = 3;
//  so on...

  AppStorageUtil(GetStorage storage) : super(storage) {
    logD('AppStorageUtil constructed with $storage');
  }

  /// override this function to handle default case
  @override
  bool readBool(key) {
    var result = super.readBool(key);

    // result will be null if it is  accessed first time,
    // handling of default case
    if (result == null) {
      switch (key) {
      }
    }

    // making default value false
    return result ?? false;
  }
}
