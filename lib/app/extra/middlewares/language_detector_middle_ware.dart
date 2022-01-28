import 'package:get/get.dart';

class LanguageDetectorMiddleWare extends GetMiddleware{
  @override
  GetPage? onPageCalled(GetPage? page) {
    // TODO: should check the parameter 'lang=en' here and set in language controllers
    return super.onPageCalled(page);
  }
}