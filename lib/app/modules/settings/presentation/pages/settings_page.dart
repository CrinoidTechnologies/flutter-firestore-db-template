import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_template/_core/ui/spacing.dart';
import 'package:grocery_template/app/extra/ui/components/language_change_button.dart';
import 'package:grocery_template/app/modules/settings/presentation/widgets/setting_row_widget.dart';
import 'package:grocery_template/app/ui/controllers/theme_controller.dart';
import 'package:grocery_template/app/ui/icon_helper.dart';
import 'package:grocery_template/app/ui/styles.dart';
import 'package:grocery_template/generated/l10n.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Insets.l),
      child: Column(
        children: [
          VSpace(Insets.xxl),
          SettingRowWidget(
            title: S.of(context).changeAppTheme,
            suffix: GetX<ThemeController>(
              builder: (_c) => clickableIconButton(
                ThemeIndicatorIcons[_c.currentThemeMode.value?.index ?? 0],
                onPress: () => _c.toggleTheme(),
              ),
            ),
          ),
          VSpace(Insets.m),
          SettingRowWidget(
            title: S.of(context).changeLanguage,
            suffix: const LanguageChangeButton(),
          ),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Get.find<ThemeController>().setThemeData(context);
  }
}
