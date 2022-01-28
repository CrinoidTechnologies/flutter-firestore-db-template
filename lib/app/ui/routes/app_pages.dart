import 'package:get/get.dart';
import 'package:grocery_template/app/modules/dashboard/presentation/bindings/dashboard_binding.dart';
import 'package:grocery_template/app/modules/dashboard/presentation/pages/dashboard_page.dart';
import 'package:grocery_template/app/modules/splash/presentation/bindings/splash_binding.dart';
import 'package:grocery_template/app/modules/splash/presentation/pages/splash_page.dart';

part 'app_routes.dart';

class AppPages {
  ///This is the route which is opened when the app starts
  static const initial = Routes.root;

  ///Use this route to redirect user to starting point of the app, for example after password reset.
  static const redirectHome = Routes.root;

  ///Contains all the available routes for the application
  static final routes = [
    GetPage(
        name: Routes.root,
        page: () => const SplashPage(),
        binding: SplashBinding()),
    GetPage(
      name: Routes.dashboard,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
    ),
  ];
}
