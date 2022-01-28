import 'package:get/get.dart';
import 'package:grocery_template/app/di/dependency_injection.dart';
import 'package:grocery_template/app/modules/splash/presentation/controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(appSL());
  }
}
