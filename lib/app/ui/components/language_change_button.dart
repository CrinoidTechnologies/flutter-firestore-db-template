import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:grocery_template/_core/ui/spacing.dart';
import 'package:grocery_template/app/extra/app_strings.dart';
import 'package:grocery_template/app/ui/controllers/language_controller.dart';
import 'package:grocery_template/app/ui/app_color_helper.dart';
import 'package:grocery_template/app/ui/app_icon_helper.dart';
import 'package:grocery_template/app/ui/app_styles.dart';
import 'package:grocery_template/app/ui/app_text_styles.dart';
import 'package:grocery_template/generated/l10n.dart';

class LanguageChangeButton extends StatelessWidget {
  final Offset offset;
  final Color? color;
  final double? size;

  const LanguageChangeButton(
      {Key? key, this.offset = const Offset(0, 34), this.color, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<LanguageController>(
        builder: (_c) => PopupMenuButton<String>(
              tooltip: S.of(context).changeLanguage,
              initialValue: _c.currentLanguage.value,
              offset: offset,
              onSelected: (value) {
                _c.changeLocale(value);
              },
              itemBuilder: (BuildContext context) {
                return _c.supportedLanguage
                    .map((element) => PopupMenuItem(
                          value: element.toLanguageTag(),
                          child: Row(
                            children: [
                              HSpace(Insets.s),
                              SizedBox(
                                width: 75,
                                child: Text(
                                  AppStrings
                                      .languageNames[element.languageCode]!,
                                  style: AppTextStyles.text14NormalDarkColor,
                                ),
                              ),
                              if (_c.currentLanguage.value ==
                                  element.toLanguageTag())
                                iconWidget(
                                  Icons.check,
                                  color: AppColorHelper.darkColor,
                                ),
                            ],
                          ),
                        ))
                    .toList(growable: false);
              },
              child: Icon(
                Icons.translate_outlined,
                size: size,
                color: color ?? AppColorHelper.darkColor,
              ),
            ));
  }
}
