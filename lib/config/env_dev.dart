import 'package:grocery_template/_shared/common/app_environment.dart';
import 'package:grocery_template/app/ui/routes/app_pages.dart';

class EnvDev extends Environment {
  @override
  String get name => 'Dev';

  @override
  String get initialRoute => Routes.root;
}
