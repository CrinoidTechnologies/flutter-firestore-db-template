import 'package:flutter/material.dart';
import 'package:grocery_template/app/ui/color_helper.dart';
import 'package:grocery_template/app/ui/text_styles.dart';
import 'package:grocery_template/generated/l10n.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorHelper.lightColor,
      child: Center(
        child: Text(
          S.of(context).appTitle,
          style: AppTextStyles.headline4Style(context,
              color: ColorHelper.primaryColor, weight: FontWeight.bold),
        ),
      ),
    );
  }
}
