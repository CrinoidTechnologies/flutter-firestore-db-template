import 'package:grocery_template/_config/env_dev.dart';
import 'package:grocery_template/app/ui/routes/app_pages.dart';

enum EnvironmentType { dev, prod }

/// When project has multiple working environments like Development, Production
/// Add environment specific parameter here
abstract class Environment {
  EnvironmentType get environment;

  /// display environment name, can be used for debugging
  String get name;

  /// base cloud url
  String get rootUrl;

  /// initial starting page
  /// can be useful in development phase
  /// where it can be changed to speedup development
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
