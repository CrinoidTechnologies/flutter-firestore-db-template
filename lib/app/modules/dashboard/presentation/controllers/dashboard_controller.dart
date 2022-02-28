import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:grocery_template/app/extra/app_enum.dart';

final empty = Rx<String?>(null);

class DashboardController extends GetxController {
  /// monitor status of login
  final isProcessing = false.obs;
  final explorerPage = 0.obs;
  final topPage = (-1).obs;
  final h1 = ''.obs;
  final h2 = ''.obs;
  final h3 = ''.obs;
  final title = ''.obs;
  final subTitle = ''.obs;

  Object? data;

  DashboardContentAction action = DashboardContentAction.view;

  DashboardController({currentPage = 0}) {
    explorerPage.value = currentPage ?? 0;
  }

  @override
  void onReady() {
    super.onReady();
    if (kDebugMode) {
      explorerPage.value = 1;
      topPage.value = -1;
    }
  }

  bool get showPageIndex => topPage.value < 0;

  get isCreatePageEnabled => topPage.value == 0;

  signOut() {
/*    print('signOut call');
    isProcessing.value = true;
    logoutUseCase.call(null).then((value) {
      isProcessing.value = false;
      value.fold((l) => showMessage(l), (r) => Get.offAllNamed(Routes.login));
    });*/
  }

  closeTopPage() {
    changePage(topPage: -1);
  }

  toggleTopPage(int? topPage) {
    changePage(
        topPage: this.topPage >= 0 ? -1 : topPage,
        action: DashboardContentAction.create);
  }

  changePage(
      {int? topPage,
      int? explorerPage,
      data,
      DashboardContentAction action = DashboardContentAction.view}) {
    if (topPage != null) this.topPage.value = topPage;
    if (explorerPage != null) this.explorerPage.value = explorerPage;
    this.data = data;
    this.action = action;
  }

  void refreshBar(
      {String? title,
      String? subTitle,
      String? h1,
      String? h2,
      String? h3,
      bool resetAll = true}) async {
    await Future.delayed(const Duration(milliseconds: 300));
    if (title != null || resetAll) this.title.value = title ?? "";
    if (subTitle != null || resetAll) this.subTitle.value = subTitle ?? "";
    if (h1 != null || resetAll) this.h1.value = h1 ?? "";
    if (h2 != null || resetAll) this.h2.value = h2 ?? "";
    if (h3 != null || resetAll) this.h3.value = h3 ?? "";
  }
}
