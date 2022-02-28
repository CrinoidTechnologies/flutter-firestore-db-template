import 'package:get/get.dart';
import 'package:grocery_template/_shared/utils/storage_util.dart';
import 'package:grocery_template/app/extra/app_constants.dart';
import 'package:grocery_template/app/utils/app_storage_util.dart';

///Works with package_info_plus
class AppVersionController extends GetxController {
  final fullVersion = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _getData();
  }

  _getData() async {
    // final _packageInfo = await PackageInfo.fromPlatform();
    // final String versionName = _packageInfo.version;
    // final String versionNumber = _packageInfo.buildNumber;
    const String versionName = appVersionName;
    const String versionNumber = appVersionNumber;
    fullVersion.value = '$versionName($versionNumber)';
    Get.find<StorageUtil>().write(AppStorageUtil.appVersion, versionName);
  }
}
