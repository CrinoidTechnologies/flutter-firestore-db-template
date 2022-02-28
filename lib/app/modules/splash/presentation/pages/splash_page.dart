import 'package:flutter/material.dart';
import 'package:grocery_template/app/ui/app_color_helper.dart';
import 'package:grocery_template/app/ui/app_text_styles.dart';
import 'package:grocery_template/generated/l10n.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColorHelper.lightColor,
      child: Center(
        child: Text(
          S.of(context).appTitle,
          style: AppTextStyles.headline4Style(context,
              color: AppColorHelper.primaryColor, weight: FontWeight.bold),
        ),
      ),
    );
  }
}
