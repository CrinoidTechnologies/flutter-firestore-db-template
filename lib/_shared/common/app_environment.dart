import 'package:grocery_template/app/ui/routes/app_pages.dart';
import 'package:grocery_template/config/env_dev.dart';

abstract class Environment {
  final String secret = '';
  final String name = '';
  final String sentryDSN = '';
  final String firebaseFunctionLocation = 'us-central1';

  final bool authGuardEnabled = true;

  String get initialRoute => Routes.root;

  ///Used for testing purposes
  final String loginEmail = '';
  final String loginPassword = '';
}

class EnvironmentValue {
  static final Environment development = EnvDev();
// static final Environment staging = EnvStaging();
// static final Environment production = EnvProduction();
}
