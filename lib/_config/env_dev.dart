import 'package:grocery_template/_shared/common/app_environment.dart';
import 'package:grocery_template/app/ui/routes/app_pages.dart';

/// Implementation of development environment. It is default environment.
class EnvDev extends Environment {
  @override
  String get name => 'Dev';

  @override
  String get initialRoute => Routes.root;

  @override
  String get rootUrl => "";

  @override
  EnvironmentType get environment => EnvironmentType.dev;
}
