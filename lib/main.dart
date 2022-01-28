import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import '_core/controllers/app_version_controller.dart';
import '_shared/utils/logger_utls.dart';
import '_shared/utils/storage_util.dart';
import 'app/di/dependency_injection.dart';
import 'app/extra/controllers/language_controller.dart';
import 'app/ui/controllers/theme_controller.dart';
import 'app/ui/routes/app_pages.dart';
import 'app/ui/styles.dart';
import 'app/ui/themes.dart';
import 'generated/l10n.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setUpAll().then((value) {
    runApp(const MyApp());
  });
}

Future setUpAll() async {
  await initServiceLocator();

  /// Disable shadows on web builds for better performance
  if (kIsWeb) {
    Shadows.enabled = false;
  }
  final storage = appSL<StorageUtil>();
  //Initialise global singleton controllers here (not in MyApp), because MyApp rebuilds on locale or theme changes
  Get.put(appSL<LanguageController>(), permanent: true);
  Get.put(appSL<ThemeController>(), permanent: true);
  Get.put(storage, permanent: true);
  Get.put(appSL<AppVersionController>(), permanent: true);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    logD('in myapp build');
    //TODO observe auth state in main to redirect to initial route from any route
    return GetMaterialApp(
      onGenerateTitle: (ctx) => S.of(ctx).appTitle,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      supportedLocales: S.delegate.supportedLocales,
      themeMode: Get.find<ThemeController>().currentThemeMode.value!,
      theme: AppTheme.light().themeData,
      darkTheme: AppTheme.dark().themeData,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      onInit: () async {
        await Get.find<ThemeController>().setThemeData(context);
      },
    );
  }
}
