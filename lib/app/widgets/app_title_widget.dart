import 'package:flutter/material.dart';
import 'package:grocery_template/app/ui/app_text_styles.dart';

class AppTitleWidget extends StatelessWidget {
  final String title;

  const AppTitleWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyles.text15MediumDarkColor,
    );
  }
}
