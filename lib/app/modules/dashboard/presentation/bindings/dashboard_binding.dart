import 'package:get/get.dart';
import 'package:grocery_template/app/di/dependency_injection.dart';
import 'package:grocery_template/app/modules/grocery/presentation/controllers/grocery_list_controller.dart';

class DashboardBinding extends Bindings {
  final int selectedPage;

  DashboardBinding({this.selectedPage = 0});

  @override
  void dependencies() {
    Get.put<GroceryListController>(appSL());
  }
}
